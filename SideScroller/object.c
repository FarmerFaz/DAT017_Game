
#include "graphicdisplay.h"

#define    MAX_POINTS    20


// ye good olde PRNG sequence
static int rand[] = {47, 18, 22, 51, 33, 10, 45, 46, 48, 34, 11, 20, 17, 32, 34, 40, 45, 12, 24, 61, 14, 7, 27, 50, 43,
                     30, 54, 9, 8, 50, 9, 63, 21, 14, 28, 39, 17, 55, 24, 54, 46, 23, 56, 50, 5, 11, 28, 40, 4, 24, 42,
                     15, 37, 46, 23, 41, 33, 19, 59, 9, 22, 23, 4, 37, 22, 57, 50, 34, 8, 51, 13, 35, 22, 8, 13, 44, 30,
                     25, 10, 35, 16, 49, 30, 20, 47, 46, 12, 43, 28, 8, 3, 6, 33, 54, 42, 24, 10, 5, 24, 49, 21, 50, 1,
                     21, 23, 44, 36, 58, 61, 39, 44, 3, 30, 39, 13, 63, 2, 5, 13, 7, 57, 31, 13, 31, 40, 59, 22, 39, 11,
                     22, 32, 2, 50, 0, 59, 21, 55, 50, 49, 55, 32, 3, 31, 40, 45, 9, 15, 8, 40, 45, 16, 6, 40, 15, 5,
                     55, 24, 6, 58, 35, 38, 17, 23, 30, 42, 64, 3, 44, 28, 51, 4, 15, 27, 37, 34, 45, 14, 17, 2, 11, 41,
                     6, 0, 40, 29, 7, 43, 4, 44, 5, 7, 8, 40, 38, 53, 49, 10, 58, 33, 3, 42, 64, 8, 62, 28, 43, 42, 63,
                     18, 35, 42, 58, 38, 8, 38, 45, 24, 30, 63, 56, 27, 30, 42, 61, 55, 61, 39, 37, 34, 56, 43, 23, 48,
                     53, 34, 27, 1, 51, 63, 5, 11, 20, 33, 32, 3, 11, 30, 48, 51, 17, 4, 55, 20, 42, 24};

static int randCount = 0;

typedef struct tPoint {
    unsigned char x;
    unsigned char y;
} POINT;

typedef struct tGeometry {
    int numpoints;
    int sizex;
    int sizey;
    POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj {
    PGEOMETRY geo;
    int dirx, diry;
    int posx, posy;

    void (*draw)(struct tObj *);

    void (*clear)(struct tObj *);

    void (*move)(struct tObj *);

    void (*set_speed)(struct tObj *, int, int);
} OBJECT, *POBJECT;

typedef struct enemy {
    POBJECT obj;

    void (*move_special)(struct enemy *, struct OBJECT);
} ENEMY, *PENEMY;

typedef struct projectile {
    POBJECT obj;
	unsigned int score;
    void (*move_special)(struct projectile *, struct tObj *);
} PROJECTILE, *PPROJECTILE;

// changes the objects speed
void set_object_speed(POBJECT o, int speedx, int speedy) {
    o->dirx = speedx;
    o->diry = speedy;
}

// draws the object to the screen through the pixel() function
void draw_object(POBJECT o) {
    int xx, yy;
    char offsx, offsy;
    xx = o->posx;
    yy = o->posy;

    for (int i = 0; i < o->geo->numpoints; i++) {
        offsx = o->geo->px[i].x;
        offsy = o->geo->px[i].y;

        pixel(xx + offsx, yy + offsy, 1);
    }
}

// clears the object from the screen through the pixel() function
void clear_object(POBJECT o) {
    int xx, yy, offsx, offsy;
    xx = o->posx;
    yy = o->posy;

    for (int i = 0; i < o->geo->numpoints; i++) {
        offsx = o->geo->px[i].x;
        offsy = o->geo->px[i].y;

        pixel(xx + offsx, yy + offsy, 0);
    }
}

// clears from pos A and then moves to pos B, taking in consideration walls (or in this case the edge of the screen)
void move_object(POBJECT o) {
    clear_object(o);
	
    

    o->posx += o->dirx;
    o->posy += o->diry;
	
	if (o->posy < 1) {
		o->posy = 1;
	} else if (o->posy + o->geo->sizey > 60) {
		o->posy = 60;
	}
    draw_object(o);
}

// completely "random" function
static int random(int offs) {
    randCount += 1 + offs * 3;
    if (randCount > 254)
        randCount = 0;
	int rv = rand[randCount];
    return rv;
}

// move an enemy object
void move_enemy_object(POBJECT o) {
    clear_object(o);
	
	if((o->posy < 4 && o->diry < 0) || (o->posy > 60 && o->diry > 0)) {
		o->diry = -(o->diry);
	}

    o->posx += o->dirx;
    o->posy += o->diry;

    draw_object(o);
}

int mod(int a, int mod);

// special move function for a projectile object
void move_proj_object(PPROJECTILE o, POBJECT p, POBJECT e) {
    clear_object(o->obj);

	// if projectile object moves offscreen, make it "disappear"
    if (o->obj->posx < 1 || o->obj->posx + o->obj->geo->sizex > 128) {
        o->obj->posx = 150;
        o->obj->posy = -10;
    }
    /*if(o->posy < 1 || o->posy + o->geo->sizey > 64)
        o->diry = 0;*/

    int ex = e->posx;
    int ey = e->posy + e->geo->sizey / 2;
    int ox = o->obj->posx;
    int oy = o->obj->posy + o->obj->geo->sizey / 2;

	// if projectile object hits an enemy, make both the enemy and the projectile "disappear"
    if (ox > ex - 10 && ox < ex + 10 && oy > ey - 4 && oy < ey + 4) {
		o->score++;
        clear_object(e);
        e->posx = 130;
        e->posy = random(e->posy);

        o->obj->posx = 150;
        o->obj->posy = -10;
		
		if(mod(o->score, 5) == 0)
			e->dirx -= 1;
		if(o->score >= 5)
			e->diry = mod(random(o->score), 4) - 2;
		
    }

    o->obj->posx += o->obj->dirx;
    o->obj->posy += o->obj->diry;

    draw_object(o->obj);
}
