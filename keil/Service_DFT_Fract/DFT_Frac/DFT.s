    PRESERVE8
    THUMB

    extern LeSignal
	extern TabCos
	extern TabSin	
	export DFT_fract
; ====================== zone de reservation de donnees,  ======================================
;Section RAM (read only) :
    area    mesdata,data,readonly


;Section RAM (read write):
    area    maram,data,readwrite

; ===============================================================================================




;Section ROM code (read only) :
    area    moncode,code,readonly
; écrire le code ici


DFT_fract proc 
	; On push les registres qu'on va use
	push {r4-r11, lr}

	; On initialise les var
	mov r2, #0 ; sommeCos
	mov r3, #0 ; sommeSin
	mov r6, #0; i index
	ldr r7, = TabCos;
	ldr r8, = TabSin

loop
	cmp r6, #64
	bge endLoop

	ldrh r4, [r0,r6, LSL #1] ; signal[i]
	mul r5, r1,r6 ; k * i
	lsr r5, r5, #8 ; (k*i)%64 on fait un decalage de 8 2 a la puissance 8 egal 64
	ldrsh r10, [r7,r5] ; TabCos[(k*i)%64]

	mul r9, r4,r10 ; produit donnant sommeCos
	add r2,r2,r9    ; on augmente sommeCos de r9

	ldrsh r10, [r8,r5] ; TabSin[(k*i)%64]

	mul r9, r4,r10 ; produit donnant sommeSin
	add r3,r3,r9    ; on augmente sommeSin de r9

	add r6, r6, #1 ; on incremente l'index i 
	
	bl loop
endLoop

	UMLAL r4, r5, r2, r2 ; On stocke dans r4 et r5 le produit de r2 et r2 
	UMLAL r6, r7, r3, r3 ; On stocke dans r4 et r5 le produit de r2 et r2 

	add r2, r4,r6 ; on prend juste les parties ayant les bits de poids fort pour ce coup
					; donc juste les registres r4 et r6
	str r0, [r2]
	pop {r4-r11, pc}
	bx lr
	endp

	END
