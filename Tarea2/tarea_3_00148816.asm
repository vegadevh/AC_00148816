	;Imprimir los primero 16 numeros de Fibonacci
	;Usar JMP debido a excedente----en tercera fila

	org	100h

	mov	ax, 0000h

	mov	ax, 0d
	mov	[220h], ax

	mov	ax, 1d
	mov	[221h], ax
	mov	bx, 222h

fib:	mov	ax, 000h ;limpiando ax
	mov	[bx], ax
	sub	bx, 2h ;La resta es almacenada en bx
	mov	al, [bx]
	add	bx, 1h ;suma almacenada en bx
	add	ax, [bx] ; valor de bx almacenado en ax
	add	bx, 1h ; 1h para bx
	mov	[bx], ax
	add	bx, 1h

	cmp	bx, 22Fh
	jb	fib ;Al cumplir la comparacion si bx es menor salta realiza fibo

	int	20h