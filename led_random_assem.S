	.globl ASSM_LED_ON
	.globl BOTTON
	.globl LED_ON_OFF


/*LED randomly ON OFF FUCTION*/
ASSM_LED_ON:
	
	ldr r1,=0x56000064 //gpgdat
	ldr r2,[r1]	
	ldr r3,=0x1
	bic r2,r2,r3,lsl r0
	str r2,[r1]
	//turn on
	ldr r5,=0xfffaa //cnt
	ldr r4,=0x0
LED_ON:
	add r4,r4,#1
	cmp r4,r5				
	BNE LED_ON
	//roof
	//off
	ldr r3,=0xf
	mov r3,r3,lsl #4
	str  r3,[r1]
	
	ldr r4,=0x0
LED_OFF_B:

	add r4,r4,#1
	cmp r4,r5				
	BLS LED_OFF_B

	mov pc,lr


