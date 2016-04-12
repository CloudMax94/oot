;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Free Cursor Movement
;
;Allows you to place the inventory cursor on empty slots
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Free Navigation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Remove Left Check
.org 0x803D8B84
    nop
    nop

;Remove Right Check
.org 0x803D8C64
    nop
    nop

;Remove from L check & make it so that only x position is reset
.org 0x803D8DC8
    lhu     at, 0x0222(s1)      ;at = X position
    lhu     v0, 0x0218(s1)      ;v0 = Slot
    subu    v0, v0, at          ;v0 = First slot on current row
    sh      v0, 0x0218(s1)      ;Store new slot
    sh      r0, 0x0222(s1)      ;Store new X position
    nop
    nop

;Remove from R check & make it so that only x position is reset
.org 0x803D8EA0
    addiu   v0, zero, 0x0005    ;v0 = 0x0005 (last column)
    lhu     at, 0x0222(s1)      ;at = X position
    sh      v0, 0x0222(s1)      ;Store new X position
    subu    at, v0, at          ;at = X to add
    lhu     v0, 0x0218(s1)      ;v0 = Slot
    addu    v0, v0, at          ;v0 = Last slot on current row
    sh      v0, 0x0218(s1)      ;Store new slot

;Remove Up Check
.org 0x803D8FA8
    nop
    nop

;Remove Down Check
.org 0x803D9000
    nop
    nop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Set Cursor to default on 0xFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D9058
    slti    t5, a0, 0x00FF          ;t5 = 1 if you have selected an item
    sll     t5, t5, 0x0002          ;t5 = t5<<0x2 (0 = white, 4 = yellow)
    nop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hide Item 0xFF name (loop)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;This is the global check for all menu panels
;Other panels use 0x03E7 for empty slots
;We only show IDs below 0xFF to cover both

.org 0x803E1370
    slti    at, t7, 0x00FF          ;Set at to 1 if you don't have item 0xFF or a blank slot selected
.org 0x803E1378
    beql    at, zero, 0x803E17E8    ;Branch if you have item 0xFF or a blank slot selected

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hide item name on 0xFF (select)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;This is the global check for all menu panels
;Other panels use 0x03E7 for empty slots
;We only show IDs below 0xFF to cover both

.org 0x803E2168
    lhu     a1, 0x023C(v0)          ;Loads the item ID (instruction moved up so that at can use it)
    lhu     v1, 0x002A(sp)          ;Already there, no clue what it does, and I don't care
    slti    at, a1, 0x00FF          ;Set at to 1 if the item is 0xFF or a blank slot
    beql    at, zero, 0x803E2338    ;Branch if you have item 0xFF or a blank slot selected

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Skip equip logic on 0xFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[equip_skip_branch]: 0x803d935C     ;0x803d9360
.org 0x803D9104
    ;t2 = item ID
    addiu   t9, zero, 0x00FF
    beq     t2, t9, @equip_skip_branch
    nop
    ;Optomized code below
    ;Likely slots could be removed by branching to one instruction earlier
    bne     t8, r0, @equip_skip_branch
    lhu     t9, 0x01D4(s1)
    addiu   at, r0, 0x0006
    bne     t9, at, @equip_skip_branch
    lhu     t2, 0x01E4(s1)
    lw      t3, 0x00B8(sp)
    bne     t2, r0, @equip_skip_branch
    lhu     v1, 0x0020(t3)
    andi    t4, v1, 0x0007
    /*
    beq     t4, r0, @equip_skip_branch
    nop
    */

    /*
    bnel    t8, r0, 0x803d9360
    lh      t4, 0x009e (sp)
    lhu     t9, 0x01d4 (s1)
    addiu   at, r0, 0x0006
    bnel    t9, at, 0x803d9360
    lh      t4, 0x009e (sp)
    lhu     t2, 0x01e4 (s1)
    lw      t3, 0x00b8 (sp)
    bnel    t2, r0, 0x803d9360
    lh      t4, 0x009e (sp)
    lhu     v1, 0x0020 (t3)
    andi    t4, v1, 0x0007
    beql    t4, r0, 0x803d9360
    lh      t4, 0x009e (sp)
    */
