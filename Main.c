

void Main(){

	int i,input,j,k,bot,cnt;

	int data[100];

	Init_LED();

	Init_Key();		

	i=0;j=0;

	Uart_Printf("==========START GAME==========\n");

	for(k=0;k<0xffffa;k++);	//delay

	while(++j){

		for(i=0;i<j;i++){

			input=rand()%4+1;

			data[i]=input;

			ASSM_LED_ON(input+3);	//fuction of assemle

		}

		for(i=0;i<j;i++){

			bot=BOTTON();		//fuction of assemle

			ASSM_LED_ON(bot+2);		//fuction of assemle

			for(k=0;k<0xfffa;k++);	//delay

			if(data[i]!=(bot-1)) {

				goto fault_LED;

			 }

			

		}

		if(j==100){

			Uart_Printf(">>>>SUCESS\n");

			return 0;

		}

	}

	fault_LED: 

	Uart_Printf(">>>>WRONG\n\n\n");	

	for(k=0;k<0xffffa;k++);	//delay


}
