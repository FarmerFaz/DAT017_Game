/*
 * 	startup.c
 *
 */

#include "graphicdisplay.h"
#include "object.h"
#include "keyboard.h"

GEOMETRY player_geometry = {
	13,
	5,4,
	{
		{0,0}, 	{0,1},
				{1,1}, 	{2,1}, 	{3,1},
				{1,2}, 	{2,2}, 			{4,2},
		{0,3}, 	{1,3}, 	{2,3}, 	{3,3}, 	{4,3}
	}
};

GEOMETRY proj_geometry = {
	4,
	2,2,
	{
		{0,0},	{0,1},
		{1,0},	{1,1}
	}
};

GEOMETRY enemy_geometry = {
	8,
	3,7,
	{
		{0,0},
				{1,1},
						{2,2},
				{1,3}, 	{2,3},
						{2,4},
				{1,5},
		{0,6}
	}
};

static OBJECT player_object = {
	&player_geometry,
	0,0,
	1,1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};

//static OBJECT proj_object = {
//	&proj_geometry,
//	10, 0,
//	0, 64,
//	draw_object,
//	clear_object,
//	move_object,
//	set_object_speed
//};

static PROJECTILE proj_object = {
  {
  	&proj_geometry,
  	10, 0,
  	0, 64,
  	draw_object,
  	clear_object,
  	move_object,
  	set_object_speed
  },
  move_proj_object
}

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
	char c;
	POBJECT player = &player_object;
  PPROJECTILE projectile = &proj_object

	init_app();
	graphic_initialize();

	#ifndef SIMULATOR
		graphic_clear_screen();
	#endif

	player->set_speed(player,4,1);
	while(1) {
		player->move(player);
    projectile->move_special(projectile,player)
		delay_milli(40);
		c = keyboard();

		switch(c) {
			case 2: player->set_speed(player,0,-2); break;
			case 8: player->set_speed(player,0,2); break;
			//case 5: break;
			default: player->set_speed(player,0,0);
		}
	}
}
