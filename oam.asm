SECTION "Shadow OAM",WRAM0,align[8]
wShadowOAM: ds 40*4 ; This is the buffer we'll write sprite data to
player_name: ds 16

SECTION "OAM DMA routine", ROM0[$150]
OAMreset:
	ld a, $0	
	ld hl, $C000
	ld [hl], a
REPT 160
	ld [hl+], a
ENDR
	ret
CopyDMARoutine:
	ld hl, DMARoutine
	ld b, DMARoutineEnd - DMARoutine ; Number of bytes to copy
	ld c, LOW(hOAMDMA) ; Low byte of the destination address
.copy
	ld  a, [hli]
  	ldh [c], a
 	inc c
 	dec b
 	jr  nz, .copy
 	ret

DMARoutine:
	ldh [rDMA], a
	ld  a, 40
.wait
	dec a
	jr  nz, .wait
	ret
DMARoutineEnd:

SECTION "OAM DMA", HRAM
hOAMDMA: ds DMARoutineEnd - DMARoutine ; Reserve space to copy the routine to