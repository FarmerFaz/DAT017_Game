#define GPIO_D 0x40020C00
#define GPIO_MODER *((volatile unsigned int*) (GPIO_D))
#define GPIO_OTYPER *((volatile unsigned short*) (GPIO_D+0x4))
#define GPIO_PUPDR *((volatile unsigned int*) (GPIO_D+0xC))
#define GPIO_IDR_HIGH *((volatile unsigned char*) (GPIO_D+0x11))
#define GPIO_ODR_LOW *((volatile unsigned char*) (GPIO_D+0x14))
#define GPIO_ODR_HIGH *((volatile unsigned char*) (GPIO_D+0x15))

void keyboardActivate(unsigned int row);

int keyboardGetColumn(void);

unsigned char keyboard(void);