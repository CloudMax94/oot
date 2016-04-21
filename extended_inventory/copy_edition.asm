;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Extended Inventory Copy Edition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.inc "../utilities/offset_relocator_nullifier.asm"
.inc "../utilities/free_cursor_movement.asm"
.inc "../utilities/item_usability.asm"
.inc "consts.asm"
.inc "save_file.asm"
.inc "code.asm"
copy_inject:
    la      t7, @save_addr      ;t7 = save address
    addiu   t8, zero, 0x0000    ;t8 = 0

    -:
    addu    t9, t7, t8          ;t9 = save address + slot
    lbu     at, 0x0074(t9)      ;load item
    sb      at, @items_offs(t9) ;store item
    slti    at, t8, 0x18        ;set if less than amount of slots
    bnel    at, zero, -         ;branch if not set
    addiu   t8, t8, 0x0001      ;add one to iterator

    lui     t1, 0x8016
    addiu   t1, t1, 0xE660
    j       copy_return
    nop

.org 0x803E5990
    j       copy_inject
    nop
    copy_return:
