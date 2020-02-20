; hello-os
; TAB=4

ORG	0x7c00

; FAT12 FD

JMP	entry

DB	0x90
DB	"HELLOIPL"
DW	512
DB	1
DW	1
DB	2
DW	224
DW	2880
DB	0xf0
DW	9
DW	18
DW	2
DD	0
DD	2880
DB	0, 0, 0x29
DD	0xffffffff
DB	"HELLO-OS   "
DB	"FAT12   "
;RESB 18
TIMES 18 DB 0

; Program

entry:
	MOV		AX, 0
	MOV		SS, AX
	MOV		SP, 0x7c00
	MOV		DS, AX		; data segment
	MOV		ES, AX		; extra segment

	MOV		SI, msg

putloop:
	MOV		AL, [SI]
	ADD		SI, 1
	CMP		AL, 0
	JE		fin
	MOV		AH, 0x0e	; 1文字表示
	MOV		BX, 15		; カラーコード
	INT		0x10 		; ビデオBIOS呼び出し
	JMP putloop

fin:
	HLT
	JMP fin

msg:
	DB		0x0a, 0x0a ; 改行2行
	DB		"hello, world"
	DB		0x0a
	DB		0
	; RESB 	0x1fe-$
	TIMES	0x1fe-($-$$) DB 0
	DB		0x55, 0xaa
	; PCはまずディスクの最初のセクタを読み、その最後の2バイトを見る。それが55AAであればboot sectorと認識する。

; Sections other than the boot sector
DB	0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
TIMES	4600 DB 0
DB	0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
TIMES	1469432 DB 0
