/*------------------------------------------------------*/
/*Universidad del Valle de Guatemala 				   	*/
/*Taller de Assembeler, Seccion: 31   				   	*/
/*Jonnathan Juarez, Carnet: 15377    				   	*/
/*Diego Castaneda,  Carnet: 15151 						*/
/*Laboratorio 2:Control de posiciones de un Servomotor  */ 
/*main: asignacion GPIO e implementacion de rutinas     */
/*------------------------------------------------------*/

/*compilar con: gcc -o main phys_to_virt.c gpio0_2.s timeLibV2.c subrutinas.s main.s*/
@@PUERTOS DE GPIO
@@-----ENTRADA-----
@ GPIO 17 = BTN incrementar angulo
@ GPIO 27 = BTN decrementar angulo
@@-----SALIDA-----
@ GPIO 20 = SERVO SIGNAL

.text
.align 2
.global main
@incica codido
main:
	@utilizando la biblioteca GPIO (gpio0_2.s)
	bl GetGpioAddress @solo se llama una vez
	
	@GPIO para escritura puerto 20
	mov r0,#20
	mov r1,#1
	bl SetGpioFunction

	@GPIO para lectura puerto 17 
	mov r0,#17
	mov r1,#0
	bl SetGpioFunction	

	@GPIO para lectura puerto 27 
	mov r0,#27
	mov r1,#0
	bl SetGpioFunction	
@@inicia el servo en 90 grados
	mov r0, #3
	bl setPosServo

mainLoop:
	@revisar boton incremto
	mov r0,#17
	bl GetGpio
	cmp r0,#1
	bleq aumentarAngulo
	@revisar boton decremento
	mov r0,#27
	bl GetGpio
	cmp r0,#1
	bleq dismminuirAngulo

	ldr r0,=posicionActual
	ldr r0,[r0]
	bl setPosServo
b mainLoop

salida:
	@salida al SO
	MOV R7, #1				
	SWI 0
@datos
.data
.align 2
	.global myloc
	myloc: .word 0

	.global posicionActual
	posicionActual: .word 3

@@----TIMER PARA GRADOS----	
	.global apagado0,apagado30,apagado60,apagado90,apagado120,apagado150,apagado180
	.global encendido0,encendido30,encendido60,encendido90,encendido120,encendido150,encendido180
	@@para 0 grados
	apagado0: .word 19565000
	encendido0: .word 435000
	@@para 30 grados
	apagado30: .word 19400000
	encendido30: .word 600000
	@@para 60 grados
	apagado60: .word 19205000
	encendido60: .word 795000
	@@para 90 grados
	apagado90: .word 18761000
	encendido90: .word 1239000
	@@para 120 grados
	apagado120: .word 18500000
	encendido120: .word 1500000
	@@para 150 grados
	apagado150: .word 18125000
	encendido150: .word 1875000
	@@para 180 grados
	apagado180: .word 17750000
	encendido180: .word 2250000
