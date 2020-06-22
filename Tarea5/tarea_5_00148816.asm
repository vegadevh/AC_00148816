org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	;Letra E

	mov	si, 30d
	mov	di, 30d
	call	linea_vg
	
	mov 	si, 30d ; X -> Columna
	mov 	di, 30d ; Y -> Fila
	call 	linea_hg
	;linea pequeña
	mov 	si, 160d ; X -> Columna
	mov 	di, 30d ; Y -> Fila
	call 	linea_vp
	;brazo 1
	mov 	si, 70d ; X -> Columna
	mov 	di, 60d ; Y -> Fila
	call 	linea_hp

	;LINEA MEDIA-------------------------------------------
	mov 	si, 70d ; X -> Columna
	mov 	di, 0d ; Y -> Fila
	call 	linea_vmi


	;brazo 2
	mov 	si, 70d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
	call 	linea_hp

	;linea pequeña
	mov 	si, 160d ; X -> Columna
	mov 	di, 0d ; Y -> Fila
	call 	linea_vpm

	;brazo 3
	mov 	si, 70d ; X -> Columna
	mov 	di, 120d ; Y -> Fila
	call 	linea_hp

	;LINEA MEDIA-------------------------------------------
	mov 	si, 70d ; X -> Columna
	mov 	di, 0d ; Y -> Fila
	call 	linea_vmf

	;brazo 4
	mov 	si, 70d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	call 	linea_hp

	;linea pequeña
	mov 	si, 160d ; X -> Columna
	mov 	di, 0d ; Y -> Fila
	call 	linea_vpb

	;linea final
	mov 	si, 30d ; X -> Columna
	mov 	di, 180d ; Y -> Fila
	call 	linea_hg

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
linea_vmi:
lupi_vmi:mov 	cx, si ; Columna 
	mov	dx, 60d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 30d
	jne 	lupi_vmi
	ret

;vertical mediana
linea_vmf:
lupi_vmf:mov 	cx, si ; Columna 
	mov	dx, 120d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 30d
	jne 	lupi_vmf
	ret

;vertical pequeña
linea_vp:
lupi_vp:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 60d
	jne 	lupi_vp
	ret

linea_vpb:
lupi_vpb:mov 	cx, si ; Columna 
	mov	dx, 150d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 31d
	jne 	lupi_vpb
	ret

linea_vpm:
lupi_vpm:mov 	cx, si ; Columna 
	mov	dx, 90d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 31d
	jne 	lupi_vpm
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data