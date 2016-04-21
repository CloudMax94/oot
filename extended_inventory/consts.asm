[inv_slots]:        0x60        ;The number of slots that should be assigned to the inventory
[scroll_step]:      0x6         ;How much the offset should change when scrolling
[scroll_limit]:     0x4         ;How far you can scroll

[inv_asm]:          0x803EDFB0  ;Where the custom ASM is located

[save_addr]:        0x8015E660  ;Where the save data is located in RAM

[scroll_offs]:      0x0F44      ;Inventory scroll in save data
[items_offs]:       0x0F50      ;Inventory items in save data

[scroll_addr]:      0x8015F5A4  ;Where the inventory scroll is stored in RAM (save_addr+scroll_offs)

[bottle_slot]:      0x12        ;The slot where the bottles start
[bottle_amount]:    0x04        ;How many bottles you can obtain
