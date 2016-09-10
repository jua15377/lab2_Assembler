/*------------------------------------------------------*/
/*Universidad del Valle de Guatemala 				   	*/
/*Taller de Assembeler, Seccion: 31   				   	*/
/*Jonnathan Juarez, Carnet: 15377    				   	*/
/*Diego Castaneda,  Carnet: 15151 						*/
/*Laboratorio 2:Control de posiciones de un Servomotor  */ 
/*subrutinasDos: rutinas     */
/*------------------------------------------------------*/


.global  aumentarAngulo, dismminuirAngulo,setPosServo,memUno,memDos,memTres,memCuatro

@@reciben en r0: la poscion actual
setPosServo:
	push {lr}
	@@comparar con las posibles posiciones
	cmp r0,#0 
	beq posicionCero
	cmp r0, #1 
	beq posicionUno
	cmpne r0, #2   
	beq	posicionDos
	cmpne r0, #3  
	beq	posicionTres
	cmpne r0, #4  
	beq posicionCuatro
	cmpne r0, #5   
	beq posicionCinco
	cmpne r0, #6 
	beq posicionSeis 
@@cada una de las etiquetas posicionees realiza la misma funcion, ajustar el servo segun un  parametro definido
	posicionCer
		@contador
		mov r6,#50
		@etiqueta a la que regresa para repetir el pulso por un numero finito de veces
		servoFix1:
			sub r6,r6,#1
			cmp r6,#0
			@slae de la subrutina
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			@delay 
				ldr r0,=encendido0
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio
			@delay
				ldr r0,=apagado0
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix1
	posicionUno:
		mov r6,#50
		servoFix2:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido30
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado30
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix2


	posicionDos:
		mov r6,#50
		servoFix3:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido60
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado60
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix3

	posicionTres:
		mov r6,#50
		servoFix4:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido90
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado90
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix4
	posicionCuatro:
		mov r6,#50
		servoFix5:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido120
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado120
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix5
	posicionCinco:
		mov r6,#50
		servoFix6:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido150
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado150
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix6
	posicionSeis:
		mov r6,#50
		servoFix7:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido180
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado180
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix7

@@etiqueta general para la salida de las subrutinas
salida:
	pop {pc}

@@se encargan de revisar si es necesario cambiar la posicion del servo
dismminuirAngulo:
	push {lr}
	ldr r0, =posicionActual
	ldr r1,[r0]
	cmp r1,#0
	subgt r1,r1,#1
	str r1,[r0]
	pop {pc}
aumentarAngulo:
	push {lr}
	ldr r0, =posicionActual
	ldr r1,[r0]
	cmp r1,#8
	addlt r1,r1,#1
	str r1,[r0]
	pop {pc}
@@PUNTOS EXTRAS sirve para mostrar memorias predefinidas 
memUno:
		push {lr}
		mov r6,#100
		ramUno:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido0
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado0
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b ramUno
memDos:
		push {lr}
		mov r6,#100
		ramDos:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido45
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado45
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b ramDos
memTres:
		push {lr}
		mov r6,#100
		ramTres:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido90
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado90
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b ramTres
memCuatro:
		push {lr}
		mov r6,#100
		ramCuatro:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#20
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido135
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#20
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado135
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b ramCuatro
