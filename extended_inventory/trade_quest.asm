;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Failing Trade Quest Timer
;Only verified for Odd Mushroom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x8008C450
    lbu     t9, @items_offs(t3)         ;Failing Trade Quest Timer

.org 0x8008C4C0
    sb      v0, @items_offs(t3)         ;Failing Trade Quest Timer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Lost Woods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x8009F000
;    lbu     t5, 0xE6D4(t5)              ;Cojiro Crow?

.org 0x80233EA8
    lbu     t5, @items_offs(t4)         ;Entering Lost Woods as Adult, checking for Odd Potion (Spawns Fado)

.org 0x8023526C
;    lbu     t0, 0xE6D4(t0)              ;Entering Fado area in Lost Woods, checking for Any Trade Item before Poacher's Saw

.org 0x8022E46C
    lbu     t5, @items_offs(t4)         ;Entering Lost Woods as Adult, checking for Any Trade Item before Poacher's Saw
