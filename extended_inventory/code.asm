;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Scroll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Scroll Up
.org 0x803D8F84
    jal     scrollUp
    nop

;Scroll Down
.org 0x803D8FDC
    jal     scrollDown
    nop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;load item id (selection)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; LEFT AND RIGHT

.org 0x803D8D1C
    nop     ;removes some dumb jump that's done (find out why it runs)

.org 0x803D8D24
    jal     repoint_selection_lr
    addu    t6, s4, a1

; UP AND DOWN

.org 0x803D9060
    nop     ;removes some dumb jump that's done (find out why it runs)

.org 0x803D9068
    jal     repoint_selection_ud
    addu    t6, s4, a1



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;load item id (empty slots)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D9548
    jal     repoint_empty_slot
    sw      t4, 0x0004(v1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;load item id (icons)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D97A8
    jal     repoint_icon
    sw      t2, 0x0004(v1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;load item slot id (borders)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803E349C
    jal     repoint_border
    addu    a2, a2, t3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;set item slot id on equip
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D91BC
    jal     repoint_equip
    addu    v0, t7, t8


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;fix ammo position
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


.org 0x803E37C8
    jal     repoint_ammo_pos
    lw      v1, 0x0158(t0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;fix ammo display
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D9860
    lbu     v0, @items_offs(t3)



/*

0x803E8FB0 table for slot using ammo?

0x801B8C2C ammo display position

0x803E9CAC Ammo X Position Table

0x80127464 Item Ammo Slot Attached Table

*/
.org @inv_asm
    ; s4 = SRAM
    ; t6 = SRAM + Slot
    ; t2 = out
    repoint_selection_lr:
    lbu     t9, @scroll_offs(s4)    ;t9 = inventory scroll
    addiu   at, zero, @scroll_step  ;at = @scroll_step
    mult    t9, at                  ;t9 = inventory scroll * @scroll_step
    mflo    t9
    addu    t9, t9, t6              ;t9 = SRAM + inventory scroll offset
    lbu     t2, @items_offs(t9)     ;t7 = Item ID
    jr      ra
    nop

    ; s4 = SRAM
    ; t6 = SRAM + Slot
    ; t7 = out
    repoint_selection_ud:
    lbu     t9, @scroll_offs(s4)    ;t9 = inventory scroll
    addiu   at, zero, @scroll_step  ;at = @scroll_step
    mult    t9, at                  ;t9 = inventory scroll * @scroll_step
    mflo    t9
    addu    t9, t9, t6              ;t9 = SRAM + inventory scroll offset
    lbu     t7, @items_offs(t9)     ;t7 = Item ID
    jr      ra
    nop

    ; s4 = SRAM
    ; t1 = SRAM + Slot
    ; t5 = out
    repoint_empty_slot:
    lbu     t9, @scroll_offs(s4)    ;t9 = inventory scroll
    addiu   at, zero, @scroll_step  ;at = @scroll_step
    mult    t9, at                  ;t9 = inventory scroll * @scroll_step
    mflo    t9
    addu    t9, t9, t1              ;t9 = SRAM + inventory scroll offset
    lbu     t5, @items_offs(t9)     ;t5 = Item ID
    jr      ra
    nop

    ; s4 = SRAM
    ; t1 = SRAM + Slot
    ; t8 = out
    repoint_icon:
    lbu     t9, @scroll_offs(s4)    ;t9 = inventory scroll
    addiu   at, zero, @scroll_step  ;at = @scroll_step
    mult    t9, at                  ;t9 = inventory scroll * @scroll_step
    mflo    t9
    addu    t9, t9, t1              ;t9 = SRAM + inventory scroll offset
    lbu     t8, @items_offs(t9)     ;t8 = Item ID
    jr      ra
    nop

    ; a2 = 0x8016000 + Slot
    ; t3 = Slot
    ; t8 & t9 is free
    repoint_border:
    lbu     t8, @scroll_addr        ;t8 = inventory scroll
    addiu   t9, zero, @scroll_step  ;t9 = @scroll_step
    mult    t8, t9                  ;t8 = inventory scroll * @scroll_step
    mflo    t8

    lbu     a2, 0xE6CB(a2)          ;get slot id of currently equipped item
    subu    a2, a2, t8              ;subtract @scroll_step * inventory scroll from item slot

    bltzl   a2, +
    addiu   a2, zero, 0xFF          ;set slot to 0xFF if it's less than 0
    slti    t9, a2, 0x18            ;t9 = 1 if a2 < 0x18
    blezl   t9, +
    addiu   a2, zero, 0xFF          ;set slot to 0xFF if it's greater than 0x17

    +:
    jr      ra
    nop

    ; t5 = Slot ID
    ; a0 & at is free
    repoint_equip:
    lbu     a0, @scroll_addr        ;a0 = inventory scroll
    addiu   at, zero, @scroll_step  ;at = @scroll_step
    mult    a0, at                  ;a0 = inventory scroll * @scroll_step
    mflo    a0

    addu    a0, a0, t5              ;Add @scroll_step * inventory scroll to item slot

    sh      a0, 0x0250(s1)          ;Instruction carried over from hook location
    jr      ra
    nop

    ;
    ; v0 & a1 is free
    repoint_ammo_pos:

    lbu     v0, @scroll_addr        ;v0 = inventory scroll
    addiu   a1, zero, @scroll_step  ;a1 = @scroll_step
    sll     a1, a1, 0x2             ;a1 = @scroll_step * 0x4
    mult    v0, a1                  ;v0 = inventory scroll * (@scroll_step * 0x4)
    mflo    v0

    lh      t4, 0x0000(t7)          ;t4 = slot position
    subu    t4, t4, v0              ;Subtract inventory scroll * (@scroll_step * 0x4) from item slot

    bltzl   t4, +                   ;Branch Likely if result is less than 0
    addiu   t4, zero, 0x8000        ;set slot to 0x8000 (This will hide the display)
    +:
    jr      ra
    nop

    ;
    ;s2 & a0 is free
    scrollDown:
    beql    at, zero, +             ;Branch if you're at the bottom
    sh      t0, 0x022C(s1)          ;Instruction carried over from hook location
    jr      ra
    nop

    +:
    li      ra, 0x803D901C
    li      s2, @scroll_addr
    lbu     a0, 0x0000(s2)          ;a0 = inventory scroll
    blti    a0, @scroll_limit, +    ;Branch if you aren't at the bottom
    addiu   a0, a0, 0x1             ;a0 += 0x1
    addiu   a0, zero, @scroll_limit ;a0 = @scroll_limit
    jr      ra
    +:
    sb      a0, 0x0000(s2)          ;a0 = inventory scroll
    j       playScrollSound
    nop

    ;
    ;s2 & a0 is free
    scrollUp:
    beql    a2, zero, +             ;Branch Likely if cursor is at the top
    sh      t0, 0x022C(s1)          ;Instruction carried over from hook location
    jr      ra
    nop

    +:
    li      ra, 0x803D8FC0
    li      s2, @scroll_addr
    lbu     a0, 0x0000(s2)          ;a0 = inventory scroll
    addiu   a0, a0, 0xFFFF          ;a0 -= 0x1
    bltzl   a0, +                   ;Branch Likely if you scrolled past the top
    addiu   a0, zero, 0x0           ;set row to 0
    j       playScrollSound
    +:
    sb      a0, 0x0000(s2)          ;a0 = inventory scroll
    jr      ra
    nop

    ;
    playScrollSound:
    li      a1, 0x801333D4
    addiu   a0, r0, 0x4809
    j       0x800F738C
    addiu   a2, r0, 0x0004
