#include "delay.h"

// config GPIO_E
#define		PORT_BASE	0x40021000
// Definiera word-adresser för initieringar
#define		PORT_MODER		*((volatile unsigned int *) PORT_BASE)
#define		PORT_OTYPER		*((volatile unsigned short *) (PORT_BASE+0x4))
#define		PORT_OSPEEDR	*((volatile unsigned int *) (PORT_BASE+0x8))
#define		PORT_PUPDR		*((volatile unsigned int *) (PORT_BASE+0xC))
// Definiera byte-adresser för data och styrregister
#define		PORT_IDR_LOW	*((volatile unsigned char *) (PORT_BASE+0x10))
#define		PORT_IDR_HIGH	*((volatile unsigned char *) (PORT_BASE+0x11))
#define 	PORT_ODR_LOW	*((volatile unsigned char *) (PORT_BASE+0x14))
#define		PORT_ODR_HIGH	*((volatile unsigned char *) (PORT_BASE+0x15))
// bitmasks for control-bits in control register
#define		B_E			64	// work-cycle flag
#define		B_RST		32
#define		B_CS2		16
#define		B_CS1		8
#define		B_SELECT	4 	
#define		B_RW		2
#define		B_RS		1

// kommandon för displayen
#define		LCD_ON			0x3F
#define		LCD_OFF			0x3E
#define		LCD_SET_ADD		0x40
#define		LCD_SET_PAGE	0xB8
#define		LCD_DISP_START	0xC0
#define		LCD_BUSY		0x80

typedef unsigned char uint8_t;

// välj den displayen vi vill använda och ettställ de biter som är 1 i x
void graphic_ctrl_bit_set(uint8_t x) {
	PORT_ODR_LOW |= x;
	PORT_ODR_LOW &= ~B_SELECT;
}

// välj den displayen vi vill använda och nollställ de biter som är 1 i x
void graphic_ctrl_bit_clear(uint8_t x) {
	PORT_ODR_LOW &= ~x;
	PORT_ODR_LOW &= ~B_SELECT;
}

void graphic_ctrl_bit_set_clear(uint8_t setx, uint8_t clearx) {
	graphic_ctrl_bit_set(setx);
	graphic_ctrl_bit_clear(clearx);
}

// konfigurera CS-signalerna
void select_controller(uint8_t controller) {
	switch(controller) {
		case 0:
			graphic_ctrl_bit_clear(B_CS1 | B_CS2);
			break;
		case B_CS1:
			graphic_ctrl_bit_set_clear(B_CS1, B_CS2);
			break;
		case B_CS2:
			graphic_ctrl_bit_set_clear(B_CS2, B_CS1);
			break;
		case (B_CS1 | B_CS2):
			graphic_ctrl_bit_set(B_CS1 | B_CS2);
			break;
	}
}

// Undersöker BUSY-flaggan (B7) och returnerar först då denna blivit 0
void graphic_wait_ready(void) {
	graphic_ctrl_bit_clear(B_E);
	PORT_MODER = 0x00005555;
	graphic_ctrl_bit_set_clear(B_RW, B_RS);
	delay_500ns();
	while(1) {
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if ((PORT_IDR_HIGH & LCD_BUSY) == 0) 
			break;	
	}
	graphic_ctrl_bit_set(B_E);
	PORT_MODER = 0x55555555;
}

// reads from the graphic display
// waits for screens in  @controller
unsigned char graphic_read(unsigned char controller) {
	graphic_ctrl_bit_clear(B_E);		// (stop workcycle)
	PORT_MODER = 0x00005555;			// set ctrl 15-8 to inports, 7-0 to outports
	graphic_ctrl_bit_set(B_RS | B_RW);	// set reset and read/write bits
	select_controller(controller);		
	delay_500ns();
	
	graphic_ctrl_bit_set(B_E);			// (start workcycle)
	unsigned char rv = PORT_IDR_HIGH;	// read data register
	graphic_ctrl_bit_clear(B_E);		// (stop workycle)
	PORT_MODER = 0x55555555;			// set ctrl to outports
	
	// wait for screen 1 if reading from screen 1
	if(controller & B_CS1) {	
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	
	// !! 
	if(controller & B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	return rv;
}

// writes @value to specified @controller(s)
void graphic_write(uint8_t value, uint8_t controller) {
	PORT_ODR_HIGH = value;				// set outpins
	select_controller(controller);		
	delay_500ns();
	
	graphic_ctrl_bit_set(B_E);			// (start workcycle)
	delay_500ns();						// wait for display to handle outpins' data
	
	graphic_ctrl_bit_clear(B_E);		// (stop workcycle)
	
	// wait for screen 1
	if(controller & B_CS1) {
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	// !
	if(controller & B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	PORT_ODR_HIGH = 0;					// clear outpins' data
	graphic_ctrl_bit_set(B_E);			// (start workcycle)
	select_controller(0);				// clear selected controller to preserve the data we've written
}

// writes a @command to the screen(s) specified in @controller
void graphic_write_command(uint8_t command, uint8_t controller) {
	graphic_ctrl_bit_clear(B_E);			// (stop workcycle)
	select_controller(controller);			// choose screen
	graphic_ctrl_bit_clear(B_RS | B_RW);	// RS = 0 to write command, RW = 0 to write at all
	graphic_write(command, controller);		// actually write the command
}

// paints @data to the screen(s) specified in @controller
void graphic_write_data(uint8_t data, uint8_t controller) {
	graphic_ctrl_bit_clear(B_E);			// (stop workcycle)
	select_controller(controller);			// choose screen
	graphic_ctrl_bit_set_clear(B_RS, B_RW);	// RS = 1 to not write command, RW = 0 to write at all
	graphic_write(data, controller);		// actually
}


uint8_t graphic_read_data(uint8_t controller) {
	(void) graphic_read(controller);			// called to clear junk
	return graphic_read(controller);
}

// initierar och förbereder grafikdisplayen
void graphic_initialize(void) {
	graphic_ctrl_bit_set(B_E);
	delay_mikro(10);
	
	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
	delay_milli(30);
	
	graphic_ctrl_bit_set(B_RST);
	
	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
	graphic_write_command(LCD_ON, B_CS1 | B_CS2);			// toggle display
	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);	// start = 0
	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);		// add = 0
	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);		// page = 0
	
	select_controller(0);									// deaktivera båda CS-signalerna
}

// Nollställer alla pixlar i grafikminnet
void graphic_clear_screen(void) {
	for(int page = 0; page < 8; page++) {
		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
		for(int add = 0; add < 64; add++) {
			graphic_write_data(0, B_CS1 | B_CS2);
		}
	}
}

// funktion för att tända eller släcka en enskild pixel
void pixel(unsigned x, unsigned y, unsigned set) {
	// kolla om x och y är tillåtna värden
	if(x < 1 | y < 1 | x > 128 | y > 64)
		return;
	
	// skapa en bitmask för pixeln
	char mask;
	int index = (y-1)/8;
	switch((y-1) % 8) {
		case 0:
			mask = 1; break;
		case 1:
			mask = 2; break;
		case 2:
			mask = 4; break;
		case 3:
			mask = 8; break;
		case 4:
			mask = 16; break;
		case 5:
			mask = 32; break;
		case 6:
			mask = 64; break;
		case 7:
			mask = 128; break;
		default:
			break;
	}
	
	if(!set)
		mask = ~mask;
	
	// bestäm fysiska koordinater och välj styrkrets
	uint8_t controller, temp;
	char x_fysisk;
	
	if(x > 64) {
		controller = B_CS2; 
		x_fysisk = x - 65;
	} else {
		controller = B_CS1;
		x_fysisk = x - 1;
	}
	
	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
	graphic_write_command(LCD_SET_PAGE | index, controller);
	temp = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
	if(set)
		mask = mask | temp;
	else
		mask = mask & temp;
	graphic_write_data(mask, controller);
}