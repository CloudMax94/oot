/*
This will move the location of the inventory in the save file from 0x0074 to 0x0F50
*/

/*

get item slot table:
80127464

*/



.org 0x80084D8C
    lbu     a3, @items_offs(t2) ;?

.org 0x80085238
    sb      t8, @items_offs(v1) ;Get Bow

.org 0x80085288
    lbu     a3, @items_offs(t2) ;?

.org 0x800853C4
    sb      t9, @items_offs(v1) ;Get Bombs

.org 0x80085414
    lbu     a3, @items_offs(t2) ;?

.org 0x80085560
    lbu     t5, @items_offs(t2) ;?

.org 0x80085578
    sb      r0, @items_offs(t9) ;Get Deku Stick

.org 0x800855B4
    lbu     t5, @items_offs(t2) ;?

.org 0x800855CC
    sb      r0, @items_offs(t9) ;Get Deku Stick

.org 0x80085608
    lbu     t5, @items_offs(t2) ;?

.org 0x80085624
    sb      t8, @items_offs(t6) ;Get Deku Nuts

.org 0x80085660
    lbu     t9, @items_offs(t2) ;?

.org 0x8008567C
    sb      t8, @items_offs(t7) ;Get Deku Nuts

.org 0x800856C8
    sb      t6, @items_offs(t7) ;Get Deku Nuts

.org 0x80085720
    lbu     t9, @items_offs(t2) ;?

.org 0x800857B0
    lbu     a3, @items_offs(t2) ;?

.org 0x800857CC
    lbu     t8, @items_offs(t2) ;?

.org 0x80085898
    lbu     t5, @items_offs(t2) ;?

.org 0x8008592C
    lbu     a3, @items_offs(t2) ;?

.org 0x80085948
    lbu     t4, @items_offs(t2) ;?

.org 0x80085B3C
    lbu     t7, @items_offs(t2) ;?

.org 0x80085B60
    sb      t5, @items_offs(v1) ;Get Bombchus

.org 0x80085BB4
    lbu     t9, @items_offs(t2) ;?

.org 0x80085BD8
    sb      t8, @items_offs(v1) ;Get Bombchus

.org 0x80085D14
    sb      t4, @items_offs(v1) ;Get Fairy Slingshot

.org 0x80085E4C
    sb      t6, @items_offs(t9) ;Get Fairy Ocarina

.org 0x80085E6C
    sb      t8, @items_offs(t7) ;Get Ocarina of Time

.org 0x80085EC8
    lbu     t9, @items_offs(t2) ;?

.org 0x80085EE8
    sb      t4, @items_offs(t7) ;Get Magic Beans

.org 0x800860B4
    lbu     t7, @items_offs(v1) ;?

.org 0x800860C4
    sb      t5, @items_offs(v1) ;Get Empty Bottle

.org 0x800860EC
    lbu     a3, @items_offs(t2) ;?

.org 0x80086140
    lbu     t9, @items_offs(v1) ;?

.org 0x80086214
    sb      t8, @items_offs(v1) ;Get Lon Lon Milk?

.org 0x80086254
    lbu     t5, @items_offs(v1) ;?

.org 0x80086264
    sb      t6, @items_offs(v1) ;Get Bottled Item?

.org 0x8008628C
    lbu     a3, @items_offs(t2) ;?

.org 0x800862C8
    lbu     t0, @items_offs(v0) ;?

.org 0x800862CC
    sb      t7, @items_offs(v0) ;Get Trade Item?

.org 0x80086338
    lbu     a3, @items_offs(t2) ;?

.org 0x80086370
    sb      t8, @items_offs(t7) ;Get Remaining Items?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086400
    lbu     a3, @items_offs(v1) ;?

.org 0x80086884
    lbu     t0, @items_offs(t9) ;?

.org 0x800868CC
    lbu     t3, @items_offs(t2) ;?

.org 0x8008691C
    lbu     v0, @items_offs(t4) ;?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Replacing items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x80086A0C
    lbu     t6, @items_offs(v0)     ;Used for checking after the item that should be replaced

.org 0x80086A30
    sb      t7, @items_offs(v0)     ;Set the new item

.org 0x80086A9C
    slti    at, a3, @inv_slots      ;Used to determine how many slots it should check
