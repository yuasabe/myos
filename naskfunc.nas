; naskfunc

; [FORMAT "WCOFF"]
; [INTERSET "i486p"]
[BITS 32]

; [FILE "naskfunc.nas"]

		GLOBAL	io_hlt
		GLOBAL	write_mem8

[SECTION .text]

io_hlt:
		HLT
		RET

write_mem8:
		MOV		ECX, [ESP+4]		; [ESP+4]にaddrが入っているのでそれをECXに読み込む
		MOV		AL, [ESP+8]			; [ESP+8]にdataが入っているのでそれをALに読み込む
		MOV		[ECX], AL
		RET
