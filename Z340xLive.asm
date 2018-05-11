	BITS 16

start:
	text_string db '[nootloader@core] Staring down Z340x...', 0
	mov ax, 07C0h		; Set up 4K stack space after this bootloader
	add ax, 288		; (4096 + 512) / 16 bytes per paragraph
	mov ss, ax
	mov sp, 4096

	mov ax, 07C0h		; Set data segment to where we're loaded
	mov ds, ax


	mov si, text_string	; Put string position into SI
	call print_string	; Call our string-printing routine

	jmp $			; Jump here - infinite loop!


	text_string db '[nootloader@core] Ready', 0
	text_string db '[Z340x@Z340x] Welcome to Z340x - Boot Conditions: live, single-user...', 0 		; Welcome
	text_string db '[Z340x@Z340x] Distrobution: Z340x', 0 		; Say Distrobution
	extern Z34oxLive


print_string:			; Routine: output string in SI to screen
	mov ah, 0Eh		; int 10h 'print char' function

.repeat:
	lodsb			; Get character from string
	cmp al, 0
	je .done		; If char is zero, end of string
	int 10h			; Otherwise, print it
	jmp .repeat

.done:
	ret


	times 510-($-$$) db 0	; Pad remainder of boot sector with 0s
	dw 0xAA55		; The standard PC boot signature
