; Lava Seahorse Routine
SeahorseAIRoutine:
    lda EnsExtra.0.status,x
    cmp #enemyStatus_Resting
    bne L9AF5
        lda #$E8
        sta EnY,x
    L9AF5:
    cmp #enemyStatus_Active
    bne L9B4F

    lda EnMovementInstrIndex,x
    beq L9B4F
    lda EnsExtra.0.jumpDsplcmnt,x
    bne L9B4F
    
    lda FrameCount
    and #$1F
    bne L9B3C
        lda RandomNumber1
        and #$03
        beq L9B59
        
        lda #$02
        sta SpawnFireball_87
        lda #$00
        sta SpawnFireball_EnData0A
        lda #EnAnim_DragonIdleFacingRight - EnAnimTbl.b
        sta SpawnFireball_83
        lda #EnAnim_DragonIdleFacingLeft - EnAnimTbl.b
        sta SpawnFireball_83+1.b
        lda #$03
        sta SpawnFireball_AnimTableIndex
        jsr SpawnFireball
        lda NoiseSFXFlag
        ora #sfxNoise_SpitFlame
        sta NoiseSFXFlag
        lda EnData05,x
        and #$01
        tay
        lda SpawnFireball_83,y
        jsr InitEnAnimIndex
        beq L9B59
    L9B3C:
    cmp #$0F
    bcc L9B59
    lda EnData05,x
    and #$01
    tay
    lda SeahorseTable,y
    jsr InitEnAnimIndex
    jmp L9B59

L9B4F:
    lda EnsExtra.0.status,x
    cmp #enemyStatus_Explode
    beq L9B59
    jsr LFBCA
L9B59:
    lda #$01
    sta $00
    sta $01
    jmp CommonEnemyJump_00_01_02

SeahorseTable:
    .byte EnAnim_DragonPrepareToSpitFacingRight - EnAnimTbl, EnAnim_DragonPrepareToSpitFacingLeft - EnAnimTbl

