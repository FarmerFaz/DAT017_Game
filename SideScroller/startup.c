/*
 * 	startup.c
 *
 */
 
#include "graphicdisplay.h"
#include "object.h"
#include "keyboard.h"

GEOMETRY ball_geometry =
{
	12,
	4,4,
	{
		{0,1}, {0,2}, {1,0}, {1,1},
		{1,2}, {1,3}, {2,0}, {2,1},
		{2,2}, {2,3}, {3,1}, {3,2}
	}
};

static OBJECT ball =
{
	&ball_geometry,
	0,0,
	1,1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup (void) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void init_app(void) {
	PORT_MODER = 0x55555555;
	
	GPIO_MODER = 0x55005555;
	GPIO_PUPDR = 0x00AA0000;
	GPIO_ODR_HIGH &= 0x00FF;
}

int main(int argc, char **argv) {
	char c,hspd,vspd;
	POBJECT p = &ball;
	
	init_app();
	graphic_initialize();
	
	#ifndef SIMULATOR
		graphic_clear_screen();
	#endif
	
	p->set_speed(p,4,1);
	while(1) {
		p->move(p);
		delay_milli(40);
		c = keyboard();
		
		switch(c) {
			case 6: p->set_speed(p,2,0); break;
			case 4: p->set_speed(p,-2,0); break;
			case 2: p->set_speed(p,0,-2); break;
			case 8: p->set_speed(p,0,2); break;
			case 5: break;
			default: p->set_speed(p,0,0);
		}
	}
}

