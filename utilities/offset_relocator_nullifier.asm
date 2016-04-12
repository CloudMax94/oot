;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Offset Relocator Nullifier
;
;Allows you to remove offset relocation entries by setting them
;to 0x00000000
;
;Optimized more than necessary. A lot of the code does not have
;to be included either. I'll clean it up some other time, maybe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


.org 0x800FC2C0
    addiu   sp, sp, 0xfe58
    lui     t6, 0x8013
    lw      t6, 0x3bc0(t6)
    sw      s8, 0x0040(sp)
    sw      s7, 0x003c(sp)
    sw      s6, 0x0038(sp)
    sw      s4, 0x0030(sp)
    sw      s3, 0x002c(sp)
    sw      s1, 0x0024(sp)
    sw      s0, 0x0020(sp)
    slti    at, t6, 0x0003
    or      s0, a1, r0
    or      s4, a0, r0
    or      s8, a2, r0
    sw      ra, 0x0044(sp)
    sw      s5, 0x0034(sp)
    sw      s2, 0x0028(sp)
    or      s3, r0, r0
    or      s1, r0, r0
    or      s6, r0, r0
    bnez    at, label_0x800fc35c
    or      s7, r0, r0
    lui     a0, 0x8015
    addiu   a0, a0, 0xa900
    or      a1, s4, r0
    or      a2, s0, r0
    or      a3, s8, r0
    jal     0x80002130
    sw      s0, 0x01ac(sp)
    lw      v0, 0x01ac(sp)
    lui     a0, 0x8015
    addiu   a0, a0, 0xa920
    lw      t7, 0x000c(v0)
    lw      a1, 0x0000(v0)
    lw      a2, 0x0004(v0)
    lw      a3, 0x0008(v0)
    jal     0x80002130
    sw      t7, 0x0010(sp)
    lw      s0, 0x01ac(sp)
    label_0x800fc35c:
    sw      r0, 0x0198(sp)
    sw      s4, 0x019c(sp)
    lw      t8, 0x0000(s0)
    or      t0, r0, r0
    or      t1, s0, r0
    addu    t9, t8, s4
    sw      t9, 0x01a0(sp)
    lw      t3, 0x0004(s0)
    addu    t4, t9, t3
    lw      t5, 0x0010(s0)
    beq     t5, r0, label_0x800fc5f0
    sw      t4, 0x01a4(sp)
    sw      s0, 0x01ac(sp)
    lw      v0, 0x0014(t1)
    /*
    This is where the loop starts
    Registers:
        at
        a0
        a1
        a2
        a3
        v0 = Relocator Entry
        v1 = Unknown Usage
        t0 = Loop counter
        t1 = Stack offset
        t2
        t3
        t4
        t5
        t6
        t7
        t8
        t9
        s0
        s1 = unused?
        s2
        s3 = unused?
        s4 = Unknown Usage
        s5
        s6 = unused?
        s7 = unused?
        s8 = Unknown Usage
        sp = Unknown Usage

     */
    label_0x800fc398:
    lui     at, 0x00ff
    ori     at, at, 0xffff

    ;Custom code injected here
    beq     v0, r0, end_of_loop     ;The entry is empty, skip to end of loop
    nop
    nop

    srl     t6, v0, 0x1e
    sll     t7, t6, 0x2
    addu    t8, sp, t7
    lw      t8, 0x0198(t8)
    and     t9, v0, at
    lui     at, 0x3f00
    addu    s0, t8, t9
    lw      v1, 0x0000(s0)
    and     a3, v0, at
    lui     at, 0x0200
    addiu   s2, r0, 0x0010
    beq     a3, at, label_0x800fc400
    or      s5, v1, r0
    lui     at, 0x0400
    beq     a3, at, label_0x800fc428
    lui     a0, 0x03ff
    lui     at, 0x0500
    beq     a3, at, label_0x800fc474
    srl     t3, v1, 0x10
    lui     at, 0x0600
    beq     a3, at, label_0x800fc4a0
    srl     v0, v1, 0x15
    beq     r0, r0, label_0x800fc54c
    lui     at, 0x0200
    label_0x800fc400:
    lui     at, 0x0f00
    and     t2, v1, at
    bnel    t2, r0, label_0x800fc54c
    lui     at, 0x0200
    subu    s3, v1, s8
    addu    s7, s3, s4
    or      s1, s7, r0
    or      s6, s5, r0
    beq     r0, r0, label_0x800fc548
    sw      s7, 0x0000(s0)
    label_0x800fc428:
    ori     a0, a0, 0xffff
    and     t3, v1, a0
    lui     a1, 0x8000
    sll     t4, t3, 0x2
    lui     at, 0xfc00
    or      s6, t4, a1
    and     t5, v1, at
    subu    s3, s6, s8
    lui     at, 0x0fff
    ori     at, at, 0xffff
    addu    t6, s4, s3
    and     t7, t6, at
    srl     t8, t7, 0x2
    or      s1, t5, t8
    and     t9, s1, a0
    sll     t2, t9, 0x2
    or      s7, t2, a1
    beq     r0, r0, label_0x800fc548
    sw      s1, 0x0000(s0)
    label_0x800fc474:
    andi    t4, t3, 0x001f
    sll     t6, t4, 0x2
    addu    t7, sp, t6
    sw      s0, 0x00fc(t7)
    lw      v1, 0x0000(s0)
    srl     t5, v1, 0x10
    andi    t8, t5, 0x001f
    sll     t9, t8, 0x2
    addu    t2, sp, t9
    beq     r0, r0, label_0x800fc548
    sw      v1, 0x007c(t2)
    label_0x800fc4a0:
    andi    v0, v0, 0x001f
    sll     v0, v0, 0x2
    addiu   t3, sp, 0x007c
    addu    a1, v0, t3
    lw      t7, 0x0000(a1)
    sll     t4, v1, 0x10
    sra     t6, t4, 0x10
    sll     t5, t7, 0x10
    addu    a2, t6, t5
    lui     at, 0x0f00
    addu    a0, sp, v0
    and     t8, a2, at
    bnez    t8, label_0x800fc548
    lw      a0, 0x00fc(a0)
    subu    s3, a2, s8
    addu    v0, s3, s4
    andi    t9, v0, 0x8000

    /*save 1 command
    beq     t9, r0, label_0x800fc4f4
    lui     a2, 0xffff
    beq     r0, r0, label_0x800fc4f8
    addiu   a1, r0, 0x0001
    label_0x800fc4f4:
    or      a1, r0, r0
    label_0x800fc4f8:
     */

    lui     a2, 0xffff
    beql    t9, r0, label_0x800fc4f8
    or      a1, r0, r0
    addiu   a1, r0, 0x0001
    label_0x800fc4f8:

    lw      v1, 0x0000(a0)
    srl     t6, v0, 0x10
    andi    t5, t6, 0xffff
    addu    t8, t5, a1
    and     t7, v1, a2
    sll     t3, s5, 0x10
    or      t9, t7, t8
    sra     t4, t3, 0x10
    sw      t9, 0x0000(a0)
    lw      t3, 0x0000(s0)
    sll     t2, v1, 0x10
    addu    s6, t2, t4
    andi    t4, v0, 0xffff
    and     t2, t3, a2
    or      s1, t2, t4
    sll     t7, s1, 0x10
    sra     t8, t7, 0x10
    sll     t5, t9, 0x10
    addu    s7, t5, t8
    sw      s1, 0x0000(s0)
    label_0x800fc548:
    lui     at, 0x0200
    label_0x800fc54c:
    beq     a3, at, label_0x800fc570
    lui     t9, 0x8013
    lui     at, 0x0400
    beq     a3, at, label_0x800fc574
    lui     at, 0x0600
    beq     a3, at, label_0x800fc578
    nop
    beq     r0, r0, label_0x800fc5d0
    ;nop removed below this one since it does not matter, save 1 command
    label_0x800fc570:
    addiu   s2, r0, 0x0016
    label_0x800fc574:
    addiu   s2, s2, 0x000a
    label_0x800fc578:
    lw      t9, 0x3bc0(t9)
    lui     a0, 0x8015
    addiu   a0, a0, 0xa950
    slti    at, t9, 0x0003
    bnez    at, label_0x800fc5d0
    or      a1, s2, r0
    or      a2, s0, r0
    or      a3, s1, r0
    sw      s7, 0x0010(sp)
    sw      t0, 0x0180(sp)
    jal     0x80002130
    sw      t1, 0x0058(sp)
    lui     a0, 0x8015
    addu    t3, s0, s8
    subu    a1, t3, s4
    addiu   a0, a0, 0xa968
    or      a2, s5, r0
    or      a3, s6, r0
    jal     0x80002130
    sw      s3, 0x0010(sp)
    lw      t0, 0x0180(sp)
    lw      t1, 0x0058(sp)
    label_0x800fc5d0:
    lw      t2, 0x01ac(sp)
    end_of_loop:
    addiu   t0, t0, 0x0001
    addiu   t1, t1, 0x0004
    lw      t4, 0x0010(t2)
    sltu    at, t0, t4
    bnel    at, r0, label_0x800fc398    ;Entries remain, continue loop
    lw      v0, 0x0014(t1)
    label_0x800fc5f0:
    lw      ra, 0x0044(sp)
    lw      s0, 0x0020(sp)
    lw      s1, 0x0024(sp)
    lw      s2, 0x0028(sp)
    lw      s3, 0x002c(sp)
    lw      s4, 0x0030(sp)
    lw      s5, 0x0034(sp)
    lw      s6, 0x0038(sp)
    lw      s7, 0x003c(sp)
    lw      s8, 0x0040(sp)
    jr      ra
    addiu   sp, sp, 0x01a8
