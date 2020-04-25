;Soy el de las graficas :c

;La maravillosa y precisa formula precisa: Dos casos el dia 1 se duplica cada 3 dias
;De manera dinamica colocar 11 estimaciones a partir del dia 3

	org	100h

	;Datos
	mov	ax, 0000h
	mov	cx, 0000h

	mov	ax, 2d ;Casos del primer dia
	mov	cx, 2d ;Constante para realizar producto

	mov	bx, 210h
	mov	dx, 0000h

covid:	mul	cx
	mov	[bx], ax
	;Llega a los 255, mostrar por medio de saltos
	;JMP
	cmp     ah, 00h
        ja      mas
        je      uno

mas:    add     bx, 2h
        jmp     pasa

uno:    add     bx, 1h

pasa:    cmp     bx, 21Fh
        jb      covid

	int	20h
