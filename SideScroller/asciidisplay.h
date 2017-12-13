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
void ascii_ctrl_bit_set(unsigned char x);

// Adresera ASCII-display och nollställ de bitar som är 1 i x
void ascii_ctrl_bit_clear(unsigned char x);

void ascii_ctrl_bit_set_clear(unsigned char set, unsigned char clear);


void ascii_write_cmd(unsigned char command);


void ascii_write_data(unsigned char data);

unsigned char ascii_read_controller(void);

unsigned char ascii_read_status(void);


unsigned char ascii_read_data(void);

// writes a byte to the ascii controller's data register
void ascii_write_controller(unsigned char byte);

void ascii_gotoxy(int x, int y);

void ascii_write_char(unsigned char c);

void ascii_init(void);