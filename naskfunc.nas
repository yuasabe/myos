; naskfunc

; [FORMAT "WCOFF"]
[BITS 32]

; [FILE "naskfunc.nas"]

		GLOBAL	io_hlt

[SECTION .text]

io_hlt:
		HLT
		RET
