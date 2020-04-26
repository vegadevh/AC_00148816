	;Imprimir los primero 16 numeros de Fibonacci
	;Usar JMP debido a excedente----en tercera fila

	org	100h

	mov	ax, 0000h
	mov	bx, 0000h
	mov	bx, 220h

	mov	ax, 0d
	mov	[bx], ax
	mov	bx, 221h

	mov	ax, 1d
	mov	[bx], ax
	mov	bx, 222h

	mov	al, 2d
	mov	cl, 1d
	mov	bl, 2d
	

	int	20h