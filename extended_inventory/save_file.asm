;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Set items to 0xFF on file creation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x800A847C
    j       file_creation_logic

    /*testing
;v0 = save file offset
.org 0x80134DC0
    file_creation_logic:
    addiu   a0, zero, 0xFF          ;a0 = 0xFF (Empty Slot)
    addiu   t7, zero, @inv_slots    ;t7 = @inv_slots (length)
    addu    t5, zero, zero          ;t5 = 0 (iterator)
    -:
    addu    a1, v0, t5              ;a1 = SRAM + iterator
    addiu   t5, t5, 0x0001          ;iterator++
    bne     t5, t7, -               ;if iterator < length
    sb      a0, @items_offs(a1)
    jr      ra
    nop
*/

;v0 = save file offset
.org 0x80134DC0
    file_creation_logic:
    addiu   a0, zero, 0xFF          ;a0 = 0xFF (Empty Slot)
    addiu   t7, zero, 0x61          ;t7 = 0x61 (length + 1)
    addu    t5, zero, zero          ;t5 = 0 (iterator)
    -:
    addu    a1, v0, t5              ;a1 = SRAM + iterator
    sb      t5, @items_offs(a1)
    bne     t5, t7, -               ;if iterator < length
    addiu   t5, t5, 0x0001          ;iterator++

    addiu   t5, zero, 0xFF
    addiu   a1, v0, @items_offs
    sb      t5, 0x0007(a1)
    sb      t5, 0x0008(a1)
    sb      t5, 0x0009(a1)
    sb      t5, 0x000D(a1)
    sb      t5, 0x000E(a1)
    sb      t5, 0x000F(a1)
    jr      ra
    nop
