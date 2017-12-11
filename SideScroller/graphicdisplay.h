// config GPIO_E
#define		PORT_BASE	0x40021000
// Definiera word-adresser för initieringar
#define		PORT_MODER		*((volatile unsigned int *) PORT_BASE)
// bitmasks for control-bits in control register
#define		B_CS2		16
#define		B_CS1		8

// kommandon för displayen
#define		LCD_SET_ADD		0x40
#define		LCD_SET_PAGE	0xB8

typedef unsigned uint8_t;

void graphic_ctrl_bit_set(uint8_t x);
void graphic_ctrl_bit_clear(uint8_t x);
void graphic_ctrl_bit_set_clear(uint8_t setx, uint8_t clearx);
void select_controller(uint8_t controller);
void graphic_wait_ready(void);
void graphic_write(uint8_t value, uint8_t controller);
void graphic_write_command(uint8_t command, uint8_t controller);
void graphic_write_data(uint8_t data, uint8_t controller);
void graphic_initialize(void);
void graphic_clear_screen(void);
void pixel(unsigned x, unsigned y, unsigned set);

unsigned char graphic_read(unsigned char);

uint8_t graphic_read_data(uint8_t controller);