/*
Fixed:
obtaining an empty bottle
obtaining Lon Lon Milk Bottle & Letter Bottle
obtaining bottled items / catching something
emptying bottles / selling bottled items (including poe)
fairy resurrection
checking for empty bottles in shops, at grannys potion shop & when interacting with cows
drinking Lon Lon Milk
turning in Letter
catching a poe

If there are any scenarios where the inventory is referenced that I forgot about, please tell me!
*/


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Emptying Bottle (And selling bottled items)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086BC4
    lbu     t7, @items_offs(t6)     ;Used for Debug Message (and possibly more?)

.org 0x80086C10
    lbu     t9, @items_offs(v0)     ;Used for Lon Lon Milk check

.org 0x80086C28
    sb      s0, @items_offs(v0)     ;Used by Lon Lon Milk (when the bottle is empty in inventory?)

.org 0x80086C30
    sb      s0, @items_offs(v0)     ;Used for the other bottles

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Fairy Resurrection
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086C70
    addu    a1, zero, zero          ;Make it so that it starts checking from slot 0
    nop

.org 0x80086C9C
    lbu     t7, @items_offs(a3)     ;Used for checking after fairies

.org 0x80086D2C
    sb      t1, @items_offs(a3)     ;Empty the bottle in inventory

.org 0x80086D3C
    slti    at, v0, @inv_slots      ;Used to determine how many slots it should check

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Function used to determine if you have any empty bottles
;Jumps to the rewritten function below BECAUSE THEY'RE IDENTICAL GODDAMNIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086ABC
    j       func_have_item
    addiu   a0, zero, 0x0014        ;a0 = 0x14 (Empty Bottle)
    .skip   0x68, 0x00              ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Function used to determine if you have a specific bottled item
;Used when selling bottled items
;Completely rewritten BECAUSE ORIGINAL ONE SUCKS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086B2C
    func_have_item:
    ;sw      a0, 0x0000(sp)          ;Unused command?
    li      t6, @save_addr          ;t6 = SRAM location
    andi    v0, a0, 0xFF            ;v0 = Item to look for
    addu    t7, zero, zero          ;t7 = 0x00 (First slot to check)
    -:
    addu    t8, t6, t7              ;t8 = SRAM + Current Slot
    lbu     t8, @items_offs(t8)     ;t8 = Item ID
    bne     t8, v0, +               ;Branch if item isn't an empty bottle
    slti    t8, t7, @inv_slots      ;t8 = 1 if counter is less than @inv_slots
    jr      ra
    addiu   v0, zero, 0x01          ;You have an empty bottle
    +:
    bne     t8, zero, -             ;Continue loop if counter is less than @inv_slots
    addiu   t7, t7, 0x01            ;Increase counter
    jr      ra
    addiu   v0, zero, 0x00          ;You do not have an empty bottle
    .skip   0x38, 0x00              ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Obtaining empty bottle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x800860A0
    addiu   t0, zero, @bottle_slot  ;Set where the first bottle slot is located

.org 0x800860DC
    slti    at, v0, @bottle_amount  ;Used to determine how many bottles you can obtain

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Obtaining bottled items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086130
    addu    t0, zero, zero          ;Make it so that it starts checking from slot 0

.org 0x80086224
    slti    at, v0, @inv_slots      ;Used to determine how many slots it should check

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Obtaining Lon Lon Milk Bottle & Letter
;(need to confirm lon lon milk)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x8008610C
    addiu   t0, zero, @bottle_slot  ;Set where the first bottle slot is located

.org 0x8008627C
    slti    at, v0, @bottle_amount  ;Used to determine how many bottles you can obtain

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Some check idk
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086854
    addu    a2, zero, zero          ;Make it so that it starts checking from slot 0

.org 0x80086870
    addu    a2, zero, zero          ;Make it so that it starts checking from slot 0
    nop

.org 0x800868A0
    slti    at, v0, @inv_slots      ;Used to determine how many slots it should check

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Turning in Big Poe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
