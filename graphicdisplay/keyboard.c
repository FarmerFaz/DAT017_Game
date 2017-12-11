#define GPIO_D 0x40020C00
#define GPIO_MODER *((volatile unsigned int*) (GPIO_D))
#define GPIO_OTYPER *((volatile unsigned short*) (GPIO_D+0x4))
#define GPIO_PUPDR *((volatile unsigned int*) (GPIO_D+0xC))
#define GPIO_IDR_HIGH *((volatile unsigned char*) (GPIO_D+0x11))
#define GPIO_ODR_LOW *((volatile unsigned char*) (GPIO_D+0x14))
#define GPIO_ODR_HIGH *((volatile unsigned char*) (GPIO_D+0x15))

unsigned const char key[] = {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};

void keyboardActivate(unsigned int row){
	//Aktivera angiven rad hos tangentbordet eller deaktivera samtliga
	
	switch(row){
		case 0: GPIO_ODR_HIGH = 0x10; break;
		case 1: GPIO_ODR_HIGH = 0x20; break;
		case 2: GPIO_ODR_HIGH = 0x40; break;
		case 3: GPIO_ODR_HIGH = 0x80; break;
		default: GPIO_ODR_HIGH = 0x00; break;
	}
}

int keyboardGetColumn(void){
	//Om någon tangent i den aktiverade raden är nedtryckt
	// returneras dess kolumnnummer. Annars 0.
	
	unsigned char c;
	c = GPIO_IDR_HIGH;
	if(c & 0x8){return 3;}
	if(c & 0x4){return 2;}
	if(c & 0x2){return 1;}
	if(c & 0x1){return 0;}
	return -1;
	}

unsigned char keyboard(void){
	int row, col;
	for(row = 0; row < 4; row++){
		keyboardActivate(row);
		col = keyboardGetColumn();
		if (col != -1){
			keyboardActivate(-1);
			return key[4*row + col];
		}
	}
	keyboardActivate(0);
	return 0xFF;
}