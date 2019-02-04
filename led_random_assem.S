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


	
	
/*button fuction*/
BOTTON:
	ldr r0,=0x56000054 //GPFDAT addr
	ldr r1,=0x56000064 //GPGDAT addr
	
	ldr r2,=0x0
	ldr r3,=0x1
	ldr r4,=0x1
	
	ldr r2,[r1]
	bic r2,r2,r3,lsl#7		
	str r2,[r1]

	ldr r5,[r0]
	orr r5,r5,r4
	str r5,[r0]	

	ldr r6,=0xf
	mov r6,r6,lsl#4
	str r6,[r1]	
	
WHILE_BOT:

	ldr r7,=0x2

	
FOR_BOT:

	ldr r3,=0x1
	
	mov r3,r3,lsl r7
	ldr r8,[r0]
	and r8,r8,r3
	cmp r8,#0x0
BEQ FINISH	

	add r7,r7,#1
	cmp r7,#7	

BLT FOR_BOT

B WHILE_BOT
	
FINISH:
	mov r0,r7
	mov pc,lr
