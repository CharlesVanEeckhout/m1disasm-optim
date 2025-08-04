; Waver Routine
WaverAIRoutine:
    lda #EnAnim_21 - EnAnimTbl.b
    sta EnemyFlipAfterDisplacementAnimIndex
    lda #EnAnim_1E - EnAnimTbl.b
    sta EnemyFlipAfterDisplacementAnimIndex+1.b
    lda EnsExtra.0.status,x
    cmp #enemyStatus_Explode
    beq L99F7
        jsr EnemyFlipAfterDisplacement
    L99F7:
    jmp CommonEnemyStub2

