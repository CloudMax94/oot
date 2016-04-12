;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Checks used to determine World Map Event states
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Do a dump to make sure there aren't more of them

.org 0x803E6078
    lbu     t9, @items_offs(t8)         ;Used to check if you have longshot in the hookshot slot

.org 0x803E60BC
    lbu     t9, @items_offs(t8)         ;Used to check if you have longshot in the hookshot slot

.org 0x803E6160
    lbu     t6, @items_offs(t9)         ;Used to check if your ocarina slot is empty

.org 0x803E61E4
    lbu     t8, @items_offs(t7)         ;Used to check if your ocarina slot contains the ocarina of time

.org 0x803E6214
    lbu     t9, @items_offs(t8)         ;Used to check if you have light arrows in the light arrow slot

.org 0x803E626C
    lbu     t6, @items_offs(t9)         ;Used to check if you have hookshot in the hookshot slot

.org 0x803E62F4
    lbu     t8, @items_offs(t7)         ;Used to check if you have hookshot in the hookshot slot

.org 0x803E63AC
    lbu     t9, @items_offs(t8)         ;Used to check if you have hookshot in the hookshot slot

.org 0x803E645C
    lbu     t7, @items_offs(t6)         ;Used to check if you have hookshot in the hookshot slot

.org 0x803E64A0
    lbu     v1, @items_offs(t7)         ;Use to check if you have various trade items in your adult trade slot