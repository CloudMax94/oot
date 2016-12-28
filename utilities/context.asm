;For additional information on some addresses, visit http://wiki.cloudmodding.com/oot/Global_Context

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;GLOBAL CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[global_context]:           0x80212020

[ctxt_gfx_context]:         0x0000      ;Graphics Context
[ctxt_update_func]:         0x0004      ;Game states "update" function
[ctxt_destruct_func]:       0x0008      ;Game states "Deconstructor" function
[ctxt_construct_func]:      0x000C      ;Game states next "Constructor" function
[ctxt_size]:                0x0010      ;Global context size, 0 after initialization

;CONTROLLERS
[ctxt_cont_1]:              0x0014
[ctxt_cont_2]:              0x002C
[ctxt_cont_3]:              0x0044
[ctxt_cont_4]:              0x005C
;CONTROLLER STATES
[ctxt_cont_buttons_state]:  0x00        ;Button states
[ctxt_cont_stick_state]:    0x02        ;Stick state
;0x04-0x05 unused?
[ctxt_cont_buttons_prev]:   0x06        ;Button states from previous frame/cycle
[ctxt_cont_stick_prev]:     0x08        ;Stick state from previous frame/cycle
;0x0A-0x0B unused?
[ctxt_cont_buttons_on_down]:0x0C        ;Button on Down (the frame/cycle a button is activated)
[ctxt_cont_stick_diff]:     0x0E        ;Stick difference between previous and current state
;0x10-0x11 unused?
[ctxt_cont_buttons_on_up]:  0x12        ;Button on Up (the frame/cycle a button is deactivated)
[ctxt_cont_stick_square]:   0x14        ;A variant of the stick state in a square space. (holding towards a corner will max out both X & Y values)
;0x10-0x11 unused?
;DEPRECATED, use the constants above instead
[ctxt_buttons_state]:       ctxt_cont_1+ctxt_cont_buttons_state
[ctxt_stick_state]:         ctxt_cont_1+ctxt_cont_stick_state
[ctxt_buttons_prev]:        ctxt_cont_1+ctxt_cont_buttons_prev
[ctxt_stick_prev]:          ctxt_cont_1+ctxt_cont_stick_prev
[ctxt_buttons_on_down]:     ctxt_cont_1+ctxt_cont_buttons_on_down
[ctxt_stick_diff]:          ctxt_cont_1+ctxt_cont_stick_diff
[ctxt_buttons_on_up]:       ctxt_cont_1+ctxt_cont_buttons_on_up
[ctxt_stick_square]:        ctxt_cont_1+ctxt_cont_stick_square

[ctxt_scene]:               0x00A4      ;The ID of the scene you're currently in

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MESSAGE TEXTURE CONTEXT(?)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[ctxt_message_texture]:     0x2200      ;Message texture context offset in global context (0x80214220)
[message_texture_context]:  0x2200      ;deprecated (will probably change this to 0x80214220 at some point)

[ctxt_dialog_msg_offset]:   0x0000      ;Offset of the current message in message_data_static
[ctxt_dialog_msg_length]:   0x0004      ;Length of the current message in message_data_static
[ctxt_dialog_msg_textures]: 0x0008      ;0x3C00 length? (0x80 per character)
[ctxt_dialog_btn_texture]:  0x3C08      ;Tringle, Square or Arrow texture

[ctxt_fs_digit_textures]:   0x3C88      ;Font digits 0 through 9
[ctxt_fs_uletter_textures]: 0x4188      ;Font letters A through Z
[ctxt_fs_lletter_textures]: 0x4E88      ;Font letters a through z
[ctxt_fs_space_texture]:    0x5B88      ;Font space
[ctxt_fs_hyphen_texture]:   0x5C08      ;Font chracter hyphen-minus
[ctxt_fs_period_texture]:   0x5C88      ;Font chracter period
[ctxt_fs_unk1]:             0x5D08      ;AB * 0x6858
[ctxt_fs_msg_offset]:       0xC560      ;Offset of the file select message in message_data_static
[ctxt_fs_msg_length]:       0xC564      ;Length of the file select message in message_data_static

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;INTERFACE CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[ctxt_interface]:           0x0104F0    ;Interface context offset in global context (0x80222510)
[interface_context]:        0x0104F0    ;deprecated (will probably change this to 0x80222510 at some point)
;0x0000 - 0x012F
[ctxt_parameter_static]:    0x0130      ;Address to parameter_static in RAM
[ctxt_do_action_textures]:  0x0134      ;Address to the do_action_static textures loaded for the A, B & Start buttons
[ctxt_icon_item_textures]:  0x0138      ;Address to the icon_item_static textures loaded for the B & C buttons
[ctxt_minimap_texture]:     0x013C      ;Address to the minimap texture
;0x0140 - 0x01EF
[ctxt_a_text]:              0x01F0      ;A Button Text
;0x01F2 - 0x01F3
[ctxt_a_rotation]:          0x01F4      ;A Button Rotation
[ctxt_navi_state]:          0x01F8      ;State determining if the navi button is visible
[ctxt_b_state]:             0x01FA      ;State determining if it should display an icon or text
;0x01FC - 0x0243
[ctxt_black_overlay_alpha]: 0x0244      ;Black Screen Overlay Alpha
[ctxt_a_alpha]:             0x0246      ;A Button Alpha
[ctxt_b_alpha]:             0x0248      ;B Button Alpha
[ctxt_c_left_alpha]:        0x024A      ;C Left Button Alpha
[ctxt_c_down_alpha]:        0x024C      ;C Down Button Alpha
[ctxt_c_right_alpha]:       0x024E      ;C Right Button Alpha
[ctxt_hearts_alpha]:        0x0250      ;Hearts and C Up Alpha
[ctxt_magic_rupee_alpha]:   0x0252      ;Magic, Rupees & Small Key Alpha
[ctxt_minimap_alpha]:       0x0254      ;Minimap Alpha
[ctxt_s_alpha]:             0x0256      ;Start Button ALpha
;0x0258 - 0x026F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SUBSCREEN CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[ctxt_subscreen]:           0x010760    ;Subscreen context offset in global context (0x80222780)
[subscreen_context]:        0x010760    ;deprecated (will probably change this to 0x80222780 at some point)
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
