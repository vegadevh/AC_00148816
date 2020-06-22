org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	;Letra E

	mov	si, 30d
	mov	di, 30d
	call	linea_vg
	;linea pequeña
	mov 	si, 30d ; X -> Columna
	mov 	di, 30d ; Y -> Fila
	call 	linea_hg

	mov 	si, 160d ; X -> Columna
	mov 	di, 30d ; Y -> Fila
	call 	linea_vp
	;brazo 1
	mov 	si, 70d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_hp
	;brazo 2
	mov 	si, 70d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
	call 	linea_hp
	;brazo 3
	mov 	si, 70d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	call 	linea_hp


	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

;horizontal grande
linea_hg: 
lupi_hg:mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 160d
	jne 	lupi_hg
	ret

;horizontal pequeña
linea_hp: 
lupi_hp:mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 161d ;1 pixel extra porque no me gusta ese punto vacio :(
	jne 	lupi_hp
	ret

;vertical grande
linea_vg:
lupi_vg:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 180d
	jne 	lupi_vg
	ret

;vertical mediana
linea_vm:
lupi_vm:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 60d
	jne 	lupi_vm
	ret

;vertical pequeña
linea_vp:
lupi_vp:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 50d
	jne 	lupi_vp
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data