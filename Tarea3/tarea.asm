	org 	100h

section .text

	call 	texto	
	call 	cursor
	mov	ah, 3d
	mov	[200h], ah
	mov 	ah, 5d
	mov	[210h], ah
	call 	phrase

	mov	ah, 6d
	mov	[200h], ah
	mov 	ah, 45d
	mov	[210h], ah
	call	phrase2

	mov	ah, 9d
	mov	[200h], ah
	mov 	ah, 5d
	mov	[210h], ah
	call	phrase3
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna

	add	dl, [210h]
	mov 	dh, [200h] ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
lupi:	mov 	cl, [msg+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

phrase2:	mov 	di, 0d
lupi2:	mov 	cl, [msg2+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret

phrase3:	mov 	di, 0d
lupi3:	mov 	cl, [msg3+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret


section .data
msg	db 	"Deberias ver tu mirada, es la de un total mediocre"
len 	equ	$-msg
msg2	db	"Por que? Por que me salvaste?"
len2 	equ	$-msg2
msg3	db	"No lo se, solo lo hice y ya"
len3 	equ	$-msg3