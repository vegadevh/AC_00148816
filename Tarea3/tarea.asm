	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	phrase2
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
	mov 	dh, 12d ; fila
	mov 	bh, 0h
	int 	10h
	ret

saltos:	mov	[200h], ax
	mov	ax, 3h
	add	[203h],ax
	mov	ax, [200h]
	ret

phrase:	mov 	di, 0d
lupi:	mov 	cl, [msg+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	call	saltos
	ret

phrase2:	mov 	di, 0d
lupi2:	mov 	cl, [msg2+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	call	saltos
	ret

phrase3:	mov 	di, 0d
lupi3:	mov 	cl, [msg3+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	call	saltos
	ret


section .data
msg	db 	"Deberias ver tu mirada, es la de un total mediocre"
len 	equ	$-msg
msg2	db	"Por que? Por que me salvaste?"
len2 	equ	$-msg2
msg3	db	"No lo se, solo lo hice y ya"
len3 	equ	$-msg3