// config timer
#define 	SYS_TICK 	0xE000E010
#define 	STK_CTRL	*((volatile unsigned int *) (SYS_TICK))
#define		COUNTFLAG	*((volatile unsigned int *) (STK_CTRL+0xF))
#define 	STK_LOAD	*((volatile unsigned int *) (SYS_TICK+0x4))
#define 	STK_VAL		*((volatile unsigned int *) (SYS_TICK+0x8))

// delays with 41 clock cycles (42-1, approx 250ns)
void delay_250ns(void) {
	STK_CTRL = 0;
	STK_LOAD = 41;	// how many cycles you want to delay with
	STK_VAL = 0;
	STK_CTRL = 5;	// activates timer
	while(!(COUNTFLAG & 1)) {}
	STK_CTRL = 0;
}

// delays with 83 clock cycles (84-1, approx 500ns)
void delay_500ns() {
	STK_CTRL = 0;
	STK_LOAD = 83;
	STK_VAL = 0;
	STK_CTRL = 5;
	while(!(COUNTFLAG & 1)) {}
	STK_CTRL = 0;
}

// runs delay_250ns four times per us
void delay_mikro(unsigned int us) {
	for(int i = 0; i < 4*us; i++) {
		delay_250ns();
	}
}

// runs delay_mikro 1000 times per ms
void delay_milli(unsigned int ms) {
	#ifdef SIMULATOR
		ms = ms / 1000;
		ms++;
	#endif
	
	delay_mikro(1000*ms);
}