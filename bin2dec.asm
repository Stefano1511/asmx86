;Calculo de un número string de 8 bits a decimal almacenado en memoria
section .data
	binstr	db	"10101010"; Número a evaluar
	res	db	0	  ; Resultado

section .text
	global	_start

_start:
	mov	r15,	binstr	;Guardamos la posición de memoria en R15
	mov	r14,	128	;como son 8 bits, empezamos de 128
	mov	r13,	2	;Divisor de las potencias de 2
	mov	r12,	0	;Acumulador del resultado

mulbuc:
	mov	al,	[r15]	;Guardamos los 8 bits en AL
	sub	al,	'0'	;Restamos los valores ASCII
	mul	r14		;RAX=RAX*R14
	add	r12,	rax	;Acumulamos en R12
sigpa:
	xor	rdx,	rdx	;Limpiamos RDX (ver instrucciones)
	mov	rax,	r14	;Guardamos en RAX para dividir
	div	r13		;Dividimos entre la potencia de 2
	mov	r14,	rax	;Devolvemos  al divisor 
	inc	r15		;Incrementamos posición de memoria
	cmp	r14,	0	;CMP con 0 para ver si terminó la cadena
	jne	mulbuc

fin:
	mov	[res],	r12b
	mov	rax,	60
	mov 	rdi,	0
	syscall
