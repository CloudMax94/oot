;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;0xFF00 - RAM Dialog Messages
;------------------------------------------------------------
;Written by CloudMax.
;
;This hack overrides part of the game logic which handles
;the loading of dialog messages, addingd a special 0xFF00 ID.
;
;When 0xFF00 is used, the game will load the mssage from RAM
;instead. It uses a pointer at ff00_pointer (0x8010B4CC) to
;determine where the message is located.
;
;The message that is pointed to should follow this format:
;00 - BYTE   - Message Type/Position
;01 - BYTE   - Padding/Alignment, unused
;02 - HALF   - Message data length
;04 - WORD[] - Message data
;
;Message Type/Position is the same format as usual.
;Length is how many bytes the message data is.
;Message data is also the same format as usual. Length must
;be a multiple of 4. 00 padding can be used at the end.
;
;For more information, visit:
;https://wiki.cloudmodding.com/oot/Text_Format
;
;The original game logic was optimized to fit in the new one
;and keeping it self-contained, making it and less likely
;to collide with other hacks, and easier to distribute.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Define bcopy routine label
.org 0x80006F10
bcopy:

; Remove original code
.org 0x8010B3B0 ;to 0x8010B4D0
    .skip 0x120 0
; Label of where to continue after executing the logic
ff00_end:

; a1 = 8015E660
.org 0x8010B3B0
    beqiu   a3, 0xFF00, _ff00
    lw      a0, 0x0048(sp)
    jal     0x80107448
    andi    a1, a3, 0xFFFF
    lw      v0, 0x0048(sp)
    addiu   v0, v0, 0x2200
    li      a1, 0x8015E660
    lbu     t0, 0x1409(a1) ; t0 = language
    bnez    t0, _not_lang_0
    li      t6, 0x008C6000
    li      a3, 0x801542A8
    b       _all_lang
    addiu   t7, r0, 0x07AE
_not_lang_0:
    bnei    t0, 1, _not_lang_1
    li      t6, 0x008FF000
    li      a3, 0x801542BC
    b       _all_lang
    addiu   t7, r0, 0x07BA
_not_lang_1:
    li      t6, 0x0093B000
    li      a3, 0x801542D0
    addiu   t7, r0, 0x07C6
_all_lang:
    sw      t7, 0x0010(sp)
    ori     a0, r0, 0xDC88
    addu    a0, v0, a0
    lw      a1, 0x0000(v0)
    addu    a1, a1, t6
    lw      a2, 0x0004(v0)
    jal     0x80001AA0
    sw      v0, 0x0030(sp)
    b       _not_ff00
    nop
_ff00:
    addiu   v0, a0, 0x2200

    lw      t0, ff00_pointer ; t0 = pointer to RAM message

    lbu     t1, 0x0000(t0) ; t1 = message type/position
    sb      t1, 0x0008(v0) ; store message type/position

    addiu   a0, t0, 0x0004 ; a0 = message address
    lhu     a2, 0x0002(t0) ; a2 = message length

    sw      a0, 0x0000(v0) ; store message address
    sw      a2, 0x0004(v0) ; store message length

    ori     a1, r0, 0xDC88
    addu    a1, v0, a1 ; a1 = location that message is copied to for use by dialogs
    jal     bcopy
    sw      v0, 0x0030(sp) ; Must be set for the logic we return to afterwards
_not_ff00:
    lw      v0, 0x0030(sp)
    lw      t0, 0x0004(v0)
    addiu   at, s0, 0x7FFF
    sw      t0, 0x6301(at)
    b       ff00_end ; Jump to the end to get past the data down below
    nop
; Default message "0xFF00", in case the pointer has not been set
ff00_default_message:
    .byte 0x22 ; Type/Position
    .byte 0x00 ; Padding
    .half 0x08 ; Message Length
    .ascii "0xFF00\x02"

; We place the pointer at the very end of the code that we removed.
.org %(0x8010B3B0 +  0x120 - 0x4)
ff00_pointer:
    .word   ff00_default_message
