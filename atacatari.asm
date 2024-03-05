    processor 6502
    include "vcs.h"
    include "macro.h"

    SEG
    org $f000
start
    lda #0
    ldx #0
clearmem
    sta 0,x
    inx
    bne clearmem
    jmp begin


begin
    ; 228 clock counts (3.58MHz). The actual TV picture is drawn line by line from the top down 60 times a second, and actaully 
    ; consists of only a portion of the entire "frame" (see diag. #1). A typical frame will consists of 3 vertical sync (VSYNC) 
    ; lines*, 37 vertical blank (VBLANK) lines, 192 TV picture lines, and 30 overscan lines.

    ; baseado em https://www.randomterrain.com/atari-2600-memories-tutorial-andrew-davie-08.html
    lda #0
    sta PF0
    sta PF1
    sta PF2
    sta COLUBK
    sta COLUPF
    sta VBLANK
    
    lda #2
    sta VSYNC

    sta WSYNC
    sta WSYNC
    sta WSYNC

    lda #0
    sta VSYNC
 REPEAT 37 
    sta WSYNC
 REPEND
    ; ldy #$3A
    ldy #$0E
    sty COLUBK

    ldy #$F0
    sty COLUPF

    ldy #1
    sty CTRLPF
    
    ; imagem
    ; ldx #0
    ; repeat 192
        ; inx        
        ;stx COLUBK
        ;sta WSYNC
    ;repend

    include "morotlogo.asm"
    ;
    lda #%01000010
    sta VBLANK
 REPEAT 30
    sta WSYNC
 REPEND
    
    jmp begin

    org $fffa
    .word (start & $ffff)    ; NMI
    .word (start & $ffff)    ; RESET
    .word (start & $ffff)    ; IRQ