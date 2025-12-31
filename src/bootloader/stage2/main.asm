org 0x0
bits 16

%define ENDL 0x0D, 0x0A

start:
	jmp main

main:
	; print zr8xos message
	mov si, msg_hello
	call puts


.halt:
	cli
	hlt

puts:
	push si
	push ax


.loop:
	lodsb
	or al, al
	jz .done

	mov ah, 0x0e
	int 0x10

	jmp .loop

.done:
	pop ax
	pop si
	ret

msg_hello: db "Welcome to ZR8X OS!", ENDL, 0
