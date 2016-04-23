local lips = require "lips.init"

function make_rom_writer()
    local buff = {}
    local max = -1

    local errors = {}

    return function(pos, b)
        if pos then
            local converted = false
            local files = {
                --code
                {
                    start = 0x00A94000,
                    stop  = 0x00BCEF30,
                    ram   = 0x8001CE60
                },
                --ovl_kaleido_scope
                {
                    start = 0x00BE2730,
                    stop  = 0x00C010B0,
                    ram   = 0x803D23B0
                }
            }

            for key,file in pairs(files) do
                len = file.stop - file.start
                if pos > file.ram and pos < file.ram + len then
                    pos = pos - file.ram + file.start
                    converted = true
                    break
                end
            end

            if converted or pos < 0x01000000 then
                pos = pos % 0x80000000
                buff[pos] = b
                if pos > max then
                    max = pos
                end
            else
                table.insert(errors, ('0x%06X could not be converted'):format(pos))
            end

        elseif max >= 0 then
            strout = ""
            prev = false
            for i=0, max do
                local a = buff[i]
                if a then
                    if not prev then
                        strout = strout .. ('0x%06X,'):format(i)
                    end
                    strout = strout .. ('%02X'):format(a)
                    prev = true
                else
                    if (prev) then
                        strout = strout .. '\n'
                    end
                    prev = false
                end
            end
            if table.getn(errors) > 0 then
                strout = strout .. '\n\n; Errors\n'
            end
            for i,err in pairs(errors) do
                strout = strout .. '\n; ' .. err
            end
            f = io.open("patch.txt", "w")
            f:write(strout)
            f:close()
        end
    end
end

function make_ram_writer()
    local buff = {}
    local max = -1
    return function(pos, b)
        if pos then
            if pos >= 0x80000000 then
                pos = pos % 0x80000000
                buff[pos] = b
                if pos > max then
                    max = pos
                end
            end
        elseif max >= 0 then
            strout = ""
            for i=0, max, 2 do
                local a = buff[i+0]
                local b = buff[i+1]
                if a and b then
                    strout = strout .. ('81%06X %02X%02X'):format(i, a, b) .. '\n'
                elseif a then
                    strout = strout .. ('80%06X %04X'):format(i, a) .. '\n'
                elseif b then
                    strout = strout .. ('80%06X %04X'):format(i + 1, b) .. '\n'
                end
            end
            strout = string.sub(strout, 0, -2)
            io.write(strout)
        end
    end
end

function make_writer()
    local rom_writer = make_rom_writer()
    local ram_writer = make_ram_writer()
    return function(...)
        rom_writer(...)
        ram_writer(...)
    end
end

local params = {...}

local gs = make_writer()
lips(params[1], gs, {unsafe=true, offset=0x80000000})
gs()
