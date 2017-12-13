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
#define		B_E			0x40	// work-cycle flag
#define		B_SELECT	4 	
#define		B_RW		2
#define		B_RS		1

// Adressera ASCII-display och ettställ de bitar som 1 i x
void ascii_ctrl_bit_set(unsigned char x) {
	PORT_ODR_LOW |= (x | B_SELECT);
}

// Adresera ASCII-display och nollställ de bitar som är 1 i x
void ascii_ctrl_bit_clear(unsigned char x) {
	PORT_ODR_LOW |= B_SELECT;
	PORT_ODR_LOW &= ~x;
}

void ascii_ctrl_bit_set_clear(unsigned char set, unsigned char clear){
	ascii_ctrl_bit_set(set);
	ascii_ctrl_bit_clear(clear);
}


void ascii_write_cmd(unsigned char command) {
	ascii_ctrl_bit_clear(B_RS | B_RW);
	ascii_write_controller(command);
}


void ascii_write_data(unsigned char data) {
	ascii_ctrl_bit_set_clear(B_RS,B_RW);
	ascii_write_controller(data);
}

unsigned char ascii_read_controller(void) {
	ascii_ctrl_bit_set(B_E);
	delay_500ns();
	unsigned char rv = PORT_IDR_HIGH;
	ascii_ctrl_bit_clear(B_E);
	return rv;
}

unsigned char ascii_read_status(void) {
	PORT_MODER &= 0x0000FFFF;				// clear bits15-8 (set to inport)
	ascii_ctrl_bit_set_clear(B_RW,B_RS);
	unsigned char rv = ascii_read_controller();
	PORT_MODER |= 0x55550000;				// set b15-8 to 0,1,0,1... (set to outport) 
	return rv;
}


unsigned char ascii_read_data(void) {
	PORT_MODER &= 0x0000FFFF;				// clear bits15-8 (set to inport)
	ascii_ctrl_bit_set(B_RS | B_RW);
	unsigned char rv = ascii_read_controller();
	PORT_MODER |= 0x55550000;
	return rv;
}

// writes a byte to the ascii controller's data register
void ascii_write_controller(unsigned char byte) {
	ascii_ctrl_bit_set(B_E);
	PORT_ODR_HIGH = byte;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);
}

void ascii_gotoxy(int x, int y) {
	int adress = x - 1;
	if (y == 2)
		adress += 0x40;
	ascii_write_cmd(0x80 | adress);
}

void ascii_write_char(unsigned char c) {
	while(ascii_read_status() & 0x80) {}	// wait for RS (status-bit) to become 0
	delay_mikro(8);
	ascii_write_data(c);
	delay_mikro(43);
}

void ascii_init(void) {
	while(ascii_read_status() & 0x80) {}
	delay_mikro(20);
	ascii_write_cmd(0b00111000);	// set 2 rows and 5x8 font
	delay_mikro(100);
	
	while(ascii_read_status() & 0x80) {}
	delay_mikro(20);
	ascii_write_cmd(0b00001110);	// light display, show cursor constantly
	delay_mikro(100);
	
	while(ascii_read_status() & 0x80) {}
	delay_mikro(20);
	ascii_write_cmd(0b00000110);	// addressing with left
	delay_mikro(100);
}