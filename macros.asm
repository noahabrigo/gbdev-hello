SPRITE : MACRO
	ld a, \5 + $10
	ld hl, $C000 + 4*\1
	ld [hl], a

	ld a, \4 + $08
	ld hl, $C001 + 4*\1
	ld [hl], a

	ld a, \2
	ld hl, $C002 + 4*\1
	ld [hl], a

	ld a, \3
	ld hl, $C003 + 4*\1
	ld [hl], a
ENDM

REMOVE_SPRITE : MACRO
	ld a, 0
	ld hl, $C000 + 4*\1
	ld [hl], a

	ld a, 0
	ld hl, $C001 + 4*\1
	ld [hl], a

	ld a, 0
	ld hl, $C002 + 4*\1
	ld [hl], a

	ld a, 0
	ld hl, $C003 + 4*\1
	ld [hl], a
ENDM

;FULL_SPRITE : MACRO
;	SPRITE 0+4*\1, 0+4*\2, \3, \4, \5
;	SPRITE 1+4*\1, 2+4*\2, \3, \4+8, \5
;	SPRITE 2+4*\1, 4+4*\2, \3, \4, \5+16
;	SPRITE 3+4*\1, 6+4*\2, \3, \4+8, \5+16
;ENDM

;INC_SPRITE_X : MACRO

;ENDM