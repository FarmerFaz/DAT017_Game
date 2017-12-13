/*
 * 	startup.c
 *
 */

#include "graphicdisplay.h"
#include "asciidisplay.h"
#include "object.h"
#include "keyboard.h"
#include "delay.h"

GEOMETRY player_geometry = {
        13,
        5, 4,
        {
			{0, 0},	
			{0, 1}, {1, 1},	{2, 1}, {3, 1},
					{1, 2}, {2, 2}, 		{4, 2},
			{0, 3}, {1, 3}, {2, 3}, {3, 3}, {4, 3}
        }
};

GEOMETRY proj_geometry = {
        4,
        2, 2,
        {
                {0, 0}, {0, 1},
                {1, 0}, {1, 1}
        }
};

GEOMETRY enemy_geometry = {
        8,
        3, 7,
        {
			{0, 0},
					{1, 1},
							{2, 2},
					{1, 3}, {2, 3},
							{2, 4},
					{1, 5},
			{0, 6}
        }
};

static OBJECT player_object = {
        &player_geometry,
        0, 0,
        1, 32,
        draw_object,
        clear_object,
        move_object,
        set_object_speed
};

static OBJECT enemy_object = {
        &enemy_geometry,
        -4, 0,
        132, 32,
        draw_object,
        clear_object,
        move_enemy_object,
        set_object_speed
};

static OBJECT proj_small_object = {
        &proj_geometry,
        10, 0,
        150, 64,
        draw_object,
        clear_object,
        move_object,
        set_object_speed
};

static PROJECTILE proj_object = {
        &proj_small_object,
		0,
        move_proj_object
};

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")));

void startup(void) {
    __asm volatile(
    " LDR R0,=0x2001C000\n"        /* set stack */
            " MOV SP,R0\n"
            " BL main\n"                /* call main */
            "_exit: B .\n"                /* never return */
    );
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
    PPROJECTILE proj = &proj_object;
    POBJECT enem = &enemy_object;

    init_app();
    graphic_initialize();

	#ifndef SIMULATOR
		graphic_clear_screen();
	#endif

	ascii_gotoxy(1,1);
	char scoreString[] = "Score:";
	char *s = scoreString;
	while(*s){
		ascii_write_char(*s++);
	}
	
	unsigned char string[4]; 
	
    while (1) {
        player->move(player);
        enem->move(enem);
        proj->move_special(proj, player, enem);
        delay_milli(40);
        c = keyboard();


        switch (c) {
            case 2: // move up
                player->set_speed(player, 0, -2);
                break;
			case 6: // shoot a projectile
				if (proj->obj->posy < 0) {
					proj->obj->posx = player->posx + 4;
					proj->obj->posy = player->posy +2;
				}
				break;
            case 8: // move down
                player->set_speed(player, 0, 2);
                break;
            default: // don't move
                player->set_speed(player, 0, 0);
        }
		
		// print score
		ascii_gotoxy(1,2);
		
		intToString(proj->score,string);
		
		for(int i = 0; i < 3; i++){
			ascii_write_char(string[i]);
		}
		
		// check gameover
		if (enem->posx < -10){
			char gameoverString[] ="  Game Over!";
			s = gameoverString;
			while(*s){
				ascii_write_char(*s++);
			}
			while(1);
		}
    }
}


int mod(int a, int mod){
	return a - ((a / mod) * mod);
}

void intToString(int integer, unsigned char* string){
	int v = integer/100;
	string[0] = v+48;
	v = mod(integer,100) / 10;
	string[1] = v+48;
	v = mod(integer,10);
	string[2] = v+48;
	string[3] = "\0";
}