[SAVE_CONTEXT]:                 0x8015E660
[SAVE_ENTRANCE]:                0x0000
[SAVE_AGE]:                     0x0004
[SAVE_CUTSCENE_OFFSET]:         0x0008
[SAVE_TIME]:                    0x000C
; 0x000E - 0x000F, Unknown
[SAVE_NIGHT]:                   0x0010
; 0x0014 - 0x001B, Unknown
[SAVE_VALIDATION]:              0x001C
[SAVE_DEATHS]:                  0x0022
[SAVE_NAME]:                    0x0024
[SAVE_DISK_DRIVE]:              0x002C
[SAVE_HEALTH_MAX]:              0x002E
[SAVE_HEALTH_CURRENT]:          0x0030
[SAVE_MAGIC_UPGRADE]:           0x0032
[SAVE_MAGIC_CURRENT]:           0x0033
[SAVE_RUPEES]:                  0x0034
[SAVE_GIANTS_KNIFE_AMMO]:       0x0036
[SAVE_NAVI_TIMER]:              0x0038
; 0x003A - 0x003D, Unknown
[SAVE_BIGGORONS_SWORD_FLAG]:    0x003E
[SAVE_STORED_EQUIPMENT_C]:      0x0040
[SAVE_STORED_EQUIPMENT_A]:      0x004A
; 0x0054 - 0x0065, Unknown
[SAVE_SCENE]:                   0x0066
[SAVE_EQUIPPED]:                0x0068
[SAVE_EQUIPPED_ITEMS]:          SAVE_EQUIPPED
[SAVE_EQUIPPED_SLOTS]:          SAVE_EQUIPPED+0x3 ;NOTE: slot 0 overlaps with item 3 since B button doesn't use a slot
; SAVE_EQUIPPED+0x7, Unused
[SAVE_EQUIPPED_EQUIPMENT]:      SAVE_EQUIPPED+0x8
; 0x0072 - 0x0073, Unused
[SAVE_ITEMS]:                   0x0074
[SAVE_ITEM_AMMO]:               0x008C
[SAVE_MAGIC_BEANS_LEFT]:        0x009B
[SAVE_EQUIPMENT]:               0x009C
[SAVE_UPGRADES]:                0x00A0
[SAVE_QUEST_ITEMS]:             0x00A4
[SAVE_DUNGEON_ITEMS]:           0x00A8
[SAVE_SMALL_KEYS]:              0x00BC
[SAVE_SKULLTULA_COUNT]:         0x00D0
; 0x00D2 - 0x00D3, Unknown
[SAVE_SCENE_FLAGS]:             0x00D4
; 0x0BE0 - 0x0E63, Unknown
[SAVE_FARORES_WIND]:            0x0E64
; 0x0E84 - 0x0E9B, Unknown
[SAVE_SKULLTULA_FLAGS]:         0x0E9C
; 0x0EB4 - 0x0EB7, Unknown
[SAVE_HIGHSCORES]:              0x0EB8
[SAVE_HIGHSCORE_HORSE_ARCHERY]: SAVE_HIGHSCORES+0x4*0
[SAVE_HIGHSCORE_POES]:          SAVE_HIGHSCORES+0x4*1
[SAVE_HIGHSCORE_FISH]:          SAVE_HIGHSCORES+0x4*2
[SAVE_HIGHSCORE_HORSE_RACE]:    SAVE_HIGHSCORES+0x4*3
[SAVE_HIGHSCORE_MARATHON]:      SAVE_HIGHSCORES+0x4*4
[SAVE_HIGHSCORE_5]:             SAVE_HIGHSCORES+0x4*5 ;Unused
[SAVE_HIGHSCORE_DAMPE]:         SAVE_HIGHSCORES+0x4*6
[SAVE_EVENT_FLAGS]:             0x0ED4
[SAVE_ITEM_GET_FLAGS]:          0x0EF0
; 0x0EF8 - 0x0F31, Unknown
[SAVE_NO_SWORD_EQUIPPED]:       0x0F32
; 0x0F34 - 0x0F37, Unknown
[SAVE_WORLD_MAP_FLAGS]:         0x0F38
; 0x0F3C - 0x0F3F, Unknown
[SAVE_SCARECROW_LONG]:          0x0F40
; 0x12A4 - 0x12C3, Unused?
[SAVE_SCARECROW_SHORT]:         0x12C4
; 0x1344 - 0x1347, Unknown, it is read when changing Scarecrow's Song
; 0x1348 - 0x1351, Unknown
[SAVE_CHECKSUM]:                0x1352
[SAVE_FILE_INDEX]:              0x1354
