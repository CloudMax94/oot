;;;;;;;;;;;;;;;;;;;;;;;;
;SUBSCREEN CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;

[subscreen_context]:        0x010760    ;Subscreen context offset in global context (0x80222780)
[ctxt_subscreen_state]:     0x01D4      ;Subscreen State
[ctxt_subscreen_dbg_state]: 0x01D6      ;Subscreen debug State (1 & 2 = Inventory Editor, 3 = Event Editor)
;[ctxt_01E4]:                0x01E4      ;7 when equipping equipment, 1 when changing panel, 3 when equipping item, also changes when playing songs...
;[ctxt_01E6]:                0x01E6      ;???
[ctxt_subscreen_panel]:     0x01E8      ;Current Subscreen Panel
[ctxt_subscreen_alpha]:     0x0208      ;Subscreen Alpha
;Slot
[ctxt_inv_slot]:            0x0218      ;Current Inventory Slot
;[ctxt_021A]:                0x021A      ;??? (Slot for some panel that doesn't exist?)
[ctxt_quest_slot]:          0x021C      ;Current Quest Slot
[ctxt_equip_slot]:          0x021E      ;Current Equipment Slot
[ctxt_map_slot]:            0x0220      ;Current Map Slot (is this really right? shouldn't it be after inv?)
;Cursor X Position
[ctxt_inv_pos_x]:           0x0222      ;Inventory Cursor X Position
;[ctxt_0224]:                0x0224      ;??? (X Position for some panel that doesn't exist?)
;[ctxt_0226]:                0x0226      ;??? (Unused Quest X Position?)
[ctxt_equip_pos_x]:         0x0228      ;Equipment Cursor X Position
;[ctxt_022A]:                0x022A      ;Undefined? (0xABAB) (Map X Position?)
;Cursor Y Position
[ctxt_inv_pos_y]:           0x022C      ;Inventory Cursor Y Position
;[ctxt_022E]:                0x022E      ;??? (Y Position for some panel that doesn't exist?)
;[ctxt_0230]:                0x0230      ;??? (Unused Quest Y Position?)
[ctxt_equip_pos_y]:         0x0232      ;Equipment Cursor Y Position
;[ctxt_0234]:                0x0234      ;Undefined? (0xABAB) (Map Y Position?)
;[ctxt_0236]:                0x0236      ;Alignment?
;Cursor State
[ctxt_cursor_pos_state]:    0x0238      ;If cursor is on the L/R buttons or not
;[ctxt_023A]:                0x023A      ;Alignment?
;Current Item
[ctxt_current_item]:        0x023C      ;Current Subscreen Item
[ctxt_inv_item]:            0x023E      ;Current Inventory Item
[ctxt_map_item]:            0x0240      ;Current Map Item
[ctxt_quest_item]:          0x0242      ;Current Quest Item
[ctxt_equip_item]:          0x0244      ;Current Equipment Item
;Previous Slot, used to determine if slot has changed
[ctxt_inv_slot_prev]:       0x0246      ;Previous Inventory Slot
[ctxt_map_slot_prev]:       0x0248      ;Previous Map Slot (it's also a higher value, starting at 0x1F)
[ctxt_quest_slot_prev]:     0x024A      ;Previous Quest Slot
[ctxt_equip_slot_prev]:     0x024C      ;Previous Equipment Slot
;Inventory Equipping
[ctxt_inv_equip_item]:      0x024E      ;ID of the item you're equipping
[ctxt_inv_equip_slot]:      0x0250      ;ID of the slot you're equipping
[ctxt_inv_equip_btn]:       0x0252      ;ID of the button you're equipping to
[ctxt_inv_equip_ani_x]:     0x0254      ;Equip animation X Position
[ctxt_inv_equip_ani_y]:     0x0256      ;Equip animation Y Position
[ctxt_inv_equip_ani_a]:     0x0258      ;Equip animation Alpha
;Plate
[ctxt_plate_y]:             0x025A      ;Text Plate Y Position
[ctxt_plate_timer]:         0x025C      ;Text Plate Timer (used for alternating between item names and text)
[ctxt_plate_disabled]:      0x025E      ;Text Plate Disabled (it will not alternate when set to 1)
;Cursor
[ctxt_cursor_color]:        0x0260      ;Cursor Color State (0 = white, 4 = yellow, 8 = green)
[ctxt_save_pos]:            0x0262      ;Save / Game Over Panel Cursor Position
;Quest
[ctxt_song]:                0x0264      ;Current song that is being shown in Quest Panel
;World Map
[ctxt_map_dots]:            0x0266      ;Table ends at 0x0271 (0x00 = hidden, 0x01 = visible, 0x02 = blinking)
;[ctxt_0272]:                0x0272      ;Alignment?
;[ctxt_0274]:                0x0274      ;
;[ctxt_0276]:                0x0276      ;
;[ctxt_0278]:                0x0278      ;
[ctxt_map_marker]:          0x027A      ;Marker position for where you are supposed to go
;[ctxt_027B]:                0x027B      ;Undefined? (0xABAB)
