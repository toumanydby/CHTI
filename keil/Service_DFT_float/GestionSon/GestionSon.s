	PRESERVE8
    THUMB

    export GestionSon_callback
    extern LongueurSon
    extern PeriodeSonMicroSec
    extern Son
    export GestionSon_Index
    export SortieSon
	
	include Driver/DriverJeuLaser.inc
; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
    area    mesdata,data,readonly


;Section RAM (read write):
    area    maram,data,readwrite
GestionSon_Index dcd 0x0;
SortieSon dcw 0x0;

; ===============================================================================================




;Section ROM code (read only) :
    area    moncode,code,readonly
; écrire le code ici



;MOV R6,LongueurSon; ; on récupère la taille du tableau maximale
;BEQ fin_boucle

GestionSon_start proc
	ldr r0, = GestionSon_Index;			; On charge la valeur d'index
	mov r1, #0
	strh r1, [r0]
	
	bx lr
	endp

GestionSon_callback proc
	push {lr}						

	ldr r0, = GestionSon_Index;			; On charge la valeur d'index
	ldr r1, [r0]				;
	ldr r2, = LongueurSon;		; On charge la valeur de la longueur son
	ldr r3, [r2]				;
	
	cmp r3, r1					; On regarde si on est arrivé au bout du tableau
	ble Sinon
	
	ldr r2, = Son;				; On charge la valeur de la bonne
	ldrsh r3, [r2, r1, LSL #1]	; ligne de son
	
	add r1, r1, #1					; On store l'index et on l'incrémente de 1
	strh r1, [r0]
	
	;add r3, #32768				; On ajoute 32768
	mov r1, #360				; On multiplie par 720
	mul r3, r1, r3				;
	asr r3, #15					; On divise par 65536
	add r3, r1				
	
	ldr r2, = SortieSon
	strh r3, [r2]				; On sauvegarde la valeur dans SortieSon
	b fin
	
Sinon
	;mov r1, #0					; On remet l'index à 0
	str r0, [r1]				; On store l'index
	
fin
	EXPORT SortieSon
	mov r0, r3
	bl PWM_Set_Value_TIM3_Ch3
	pop {pc}
	endp
		
	END	