;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Slot to Item Usability
;
;This will make it so that the inventory uses the item
;usability table rather than slot usability table for all
;checks.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Equip & Name Color
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D9098
    lui     t5, 0x803F
    addiu   t5, t5, 0x97B4              ;Point to item usability table instead of slot usability table.

.org 0x803D90B4
    addu    s0, a0, t5                  ;Replace t4 with a0 to use item ID instead of Slot ID

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Selection Size
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D9574
    lui     v0, 0x803F
    addu    v0, v0, t5                  ;Replace s0 with t5 to use item ID instead of Slot ID

.org 0x803D9584
    lbu     v0, 0x97B4(v0)              ;Point to item usability table instead of slot usability table.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Ammo Color & Icon Greyscale
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x803D849C
    nop                                 ;This command is now unused
    addiu   t4, r0, 0x0009              ;0x9 = Usable by child & adult
    lui     v0, 0x803F
    addu    v0, v0, t1                  ;v0 = 0x803F0000 + Item ID
    lbu     v0, 0x97B4(v0)              ;Point to item usability table instead of slot usability table.


;Null relocation offsets
;for address 0x803D909C
.org 0x00BFFD60
    .word 0x00000000
;for address 0x803D9584
.org 0x00BFFDA4
    .word 0x00000000
;for address 0x803D84AC
.org 0x00BFFD0C
    .word 0x00000000
