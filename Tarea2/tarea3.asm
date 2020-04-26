	;Imprimir los primero 16 numeros de Fibonacci
	;Usar JMP debido a excedente----en tercera fila

	org	100h

	mov	ax, 0000h

	mov	ax, 0d
	mov	[220h], ax

	mov	ax, 1d
	mov	[221h], ax

fib:	mov	ax, 000h ;limpiando ax


	int	20h