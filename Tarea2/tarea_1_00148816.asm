;EJERCICIO1

;5 ultimos digitos de carnet: 00148816 ==> 48816
;4+8+8+1+6=27/5 = 5.4 = 5 ==> En el segundo
	
	org	100h

	;Obteniendo promedio
	mov	ax, 0000h
	mov	bx, 0000h
	mov	ax, 4d
	mov	bx, 8d
	add	ax, bx ;4+8=12
	mov	bx, 8d
	add	ax, bx ;12+8=20
	mov	bx, 1d
	add	ax, bx ;20+1=21
	mov	bx, 6d
	add	ax, bx ;21+6=27

	mov	dx, 0000h ;Limpiar dx
	mov	bx, 5d

	div	bx ;27/dx

	;cociente en ax = 5

	;Colocando palabra
	mov	cl, "E"
	mov	[200h], cl
	mov	cl, "n"
	mov	[201h], cl
	mov	cl, "e"
	mov	[203h], cl
	mov	cl, "l"
	mov	[204h], cl
	mov	cl, "s"
	mov	[206h], cl
	mov	cl, "e"
	mov	[207h], cl
	mov	cl, "g"
	mov	[208h], cl
	mov	cl, "u"
	mov	[209h], cl
	mov	cl, "n"
	mov	[20Ah], cl
	mov	cl, "d"
	mov	[20Bh], cl
	mov	cl, "o"
	mov	[20Ch], cl

	int 20h
