/* --------------------------------------------------------------------------------------
* #      #    #######    ########   #######   #          #######   ##      #    #########
* #     #        #       #          #         #             #      # #     #    #
* #    #         #       #          #         #             #      #  #    #    #
* ####           #       #####      #######   #             #      #   #   #    #    ####
* #    #         #       #                #   #             #      #    #  #    #       #
* #     #        #       #                #   #             #      #     # #    #       #
* #      #    ########   ########   #######   ########   #######   #      ##    #########
* 
* Ejercicio2.s
 -------------------------------------------------------------------------------------- */
/* --------------------------------------- TEXT --------------------------------------- */
.text
.align 2
.global main
.type main, %function

/* -- Main --*/
main:
    stmfd sp!, {lr}
    /*impresion de menu y pide comando*/

/* -- Menu --*/
Menu:
    @@ impresion de menu
    ldr r0,=menu
    bl puts
    ldr r0,=ingreso
    bl puts

    @@ ingreso de opcion
    ldr r0,=opcion
    ldr r1,=comando
    bl scanf

/*compara comandos*/
comp:
    ldr r4,=comando
    ldrb r4,[r4]

    /*saltos dependiendo de caracter*/
    @@ identifica la opcion y hace un salto a la subrutina que corresponde
    @@ promedio
    cmp r4, #'1'
    beq promedio

    @@ resta
    cmpne r4, #'2'
    beq salir

promedio:
    @@pedir datos
    ldr r0,=numero1
	bl puts
	ldr r0,=entrada
	ldr r1,=a
	bl scanf
    @@asignar variables
    ldr r4,=a

    @@pedir datos
    ldr r0,=numero2
	bl puts
	ldr r0,=entrada
	ldr r1,=b
	bl scanf
    ldr r5,=b

    ldr r6,=datos
    ldr r4,[r4]
    ldr r5,[r5]
    ldr r6,[r6]

    add r7,r4,r5
    @ciclo de division
    mov r10,#0 /*contador*/

ciclo:
    @calculo
    add r10,#1
    sub r7,r6
    cmp r7,#0
    bne ciclo
    mov r8,r10

    @guarda valor
    ldr r0,=res
    mov r1,r8
    bl printf

    @regreso al menu
    b Menu

/*-- Salir --*/
salir:
    ldr r0,=adios
    bl puts
    mov r0, #0
    mov r3, #0
    ldmfd sp!, {lr}
    bx lr

/* --------------------------------------- DATA --------------------------------------- */
.data
.align 2

/*-- Variables --*/
a: .word 0
b: .word 0
comando: .byte 0
datos: .word 2

/*-- Mensajes y solicitudes --*/
error: .asciz "Ingreso incorrecto"
res: .asciz "El promedio es: %d\n"
menu: .asciz "Ejercicio 2\n1. Promedio de dos numeros\n2. salir\n"
ingreso: .asciz "Ingrese la opcion a ejecutar: "
numero1: .asciz "Ingrese el primer numero"
numero2: .asciz "Ingrese el segundo numero"
opcion: .asciz " %c"
entrada: .asciz " %d"
salida: .asciz "El valor del promedio es: %d\n\n "
adios: .asciz "Hasta pronto!"
