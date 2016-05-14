;;;;;;;;;;;;;;;;;;;;;;;;
;GLOBAL CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;

[global_context]:           0x80212020

[ctxt_buttons_state]:       0x0014      ;Button states
[ctxt_stick_state]:         0x0016      ;Stick state
;0x18-0x19 unused?
[ctxt_buttons_prev]:        0x001A      ;Button states from previous frame/cycle
[ctxt_stick_prev]:          0x001C      ;Stick state from previous frame/cycle
;0x1E-0x1F unused?
[ctxt_buttons_on_down]:     0x0020      ;Button on Down (the frame/cycle a button is activated)
[ctxt_stick_diff]:          0x0022      ;Stick difference between previous and current state
;0x24-0x25 unused?
[ctxt_buttons_on_up]:       0x0026      ;Button on Up (the frame/cycle a button is deactivated)
[ctxt_stick_square]:        0x0028      ;A variant of the stick state in a square space. (holding towards a corner will max out both X & Y values)
;0x29-0x2A unused?
;0x2B-0xA3
[ctxt_scene]:               0x00A4      ;The ID of the scene you're currently in

;;;;;;;;;;;;;;;;;;;;;;;;
;INTERFACE CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;

[interface_context]:        0x0104F0    ;Interface context offset in global context (0x80222510)
;0x0000 - 0x01EF
[ctxt_a_text]:              0x01F0      ;A Button Text
;0x01F2 - 0x01F7
[ctxt_navi_state]:          0x01F8      ;State determining if the navi button is visible
[ctxt_b_state]:             0x01FA      ;State determining if it should display an icon or text
;0x01FC - 0x0243
[ctxt_black_overlay_alpha]: 0x0244      ;Black Screen Overlay Alpha
[ctxt_a_alpha]:             0x0246      ;A Button Alpha
[ctxt_b_alpha]:             0x0248      ;B Button Alpha
[ctxt_c_left_alpha]:        0x024A      ;C Left Button Alpha
[ctxt_c_down_alpha]:        0x024C      ;C Down Button Alpha
[ctxt_c_right_alpha]:       0x024E      ;C Right Button Alpha
[ctxt_hearts_alpha]:        0x0250      ;Hearts Alpha
[ctxt_magic_rupee_alpha]:   0x0252      ;Magic & Rupees
;0x0254 changes when opening/closing menu...
[ctxt_s_alpha]:             0x0256      ;Start Button ALpha
;0x0258 - 0x026F

;;;;;;;;;;;;;;;;;;;;;;;;
;SUBSCREEN CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;

[subscreen_context]:        0x010760    ;Subscreen context offset in global context (0x80222780)
;0x0000 - 0x01D3
[ctxt_subscreen_state]:     0x01D4      ;Subscreen State
[ctxt_subscreen_dbg_state]: 0x01D6      ;Subscreen debug State (1 & 2 = Inventory Editor, 3 = Event Editor)
;0x01D8-0x0143
;[ctxt_01E4]:                0x01E4      ;7 when equipping equipment, 1 when changing panel, 3 when equipping item, also changes when playing songs...
;[ctxt_01E6]:                0x01E6      ;???
[ctxt_subscreen_panel]:     0x01E8      ;Current Subscreen Panel
;0x01EA-0x0207
[ctxt_subscreen_alpha]:     0x0208      ;Subscreen Alpha
;0x020A-0x0217
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
;0x0274-0x279
[ctxt_map_marker]:          0x027A      ;Marker position for where you are supposed to go
;[ctxt_027B]:                0x027B      ;Undefined? (0xABAB)
