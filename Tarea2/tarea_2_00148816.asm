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

	mov	cl, 0000h

covid:	mul	cx
	mov	[210h + cl], cx
	inc	cl ;Contador
	mov	al, ax ;al tomara el valor actual de casos

	cmp	cl, 000Bh
	je	covid ;Si cl no es igual a 11 realiza covid

	
