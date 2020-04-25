;Soy el de las graficas :c

;La maravillosa y precisa formula precisa: Dos casos el dia 1 se duplica cada 3 dias
;De manera dinamica colocar 11 estimaciones a partir del dia 3

	org	100h

	;Datos
	mov	ax, 0000h
	mov	al, 0000h
	mov	cx, 0000h

	mov	al, 2d ;Casos del primer dia
	mov	cx, 2d ;Constante para realizar producto

	mov	bx, 0d
	mov	dx, 0000h

covid:	mul	cx
	mov	[210h + bx], ax
	inc	bx ;Contador
	mov	cx, ax ;cx tomara el valor actual de casos

	mov	dx, 11d
	cmp	dx, bx
	ja	covid ;Si bx no es igua

	mov	dx, 11d
	cmp	dx, bx
	je	covid ;Si bx no es igua

	int	20h
