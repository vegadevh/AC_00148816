org 	100h

section .text

	mov 	dx, men
	call 	w_strng
        xor 	si, si

lupi:	call 	kb
	cmp 	al, "$"
	je	avgprev
        sub     al, 30h
	mov	[300h+si], al
	inc 	si
	jmp 	lupi

avgprev:mov     bx, 0000h
        mov     ax, 0000h

avg:    add     al, [300h+bx]
        inc     bx
        cmp     bx, 05h
        jb      avg
        mov     [310h], al
        mov     [320h], bl
        mov     cl, bl
        div     cl
        mov     [330h], al

mostrar:mov 	dx, nl     
	call	w_strng
	cmp     al, 0Ah
        je      pal
        cmp     al, 09h
        je      pal1
        cmp     al, 08h
        je      pal2
        cmp     al, 07h
        je      pal3
        cmp     al, 06h
        je      pal4
        cmp     al, 05h
        je      pal5
        cmp     al, 04h
        je      pal6
        cmp     al, 03h
        je      pal7
        cmp     al, 02h
        je      pal8
        cmp     al, 01h
        je      pal9

pal:	mov 	dx, men1
        jmp     paro
pal1:	mov 	dx, men2
        jmp     paro
pal2:	mov 	dx, men3
        jmp     paro
pal3:	mov 	dx, men4
        jmp     paro
pal4:	mov 	dx, men5
        jmp     paro
pal5:	mov 	dx, men6
        jmp     paro
pal6:	mov 	dx, men7
        jmp     paro
pal7:	mov 	dx, men8
        jmp     paro
pal8:	mov 	dx, men9
        jmp     paro
pal9:	mov 	dx, men10
        jmp     paro
	
paro:   call 	w_strng
	call 	kb
	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h 
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

section .data

;mensaje inicial
men 	db 	"Ingrese 5 digitos de su carne y signo de dolar: $"
;lista de mensajes
men1 	db 	"Perfecto solo Dios$"
men2 	db 	"Siempre me esfuerzo$"
men3 	db 	"Colocho$"
men4 	db 	"Muy bien$"
men5 	db 	"Peor es nada$"
men6 	db 	"En el segundo$"
men7 	db 	"Me recupero$"
men8 	db 	"Hay salud$"
men9 	db 	"Aun se pasa$"
men10 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"