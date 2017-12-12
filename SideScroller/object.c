#define	MAX_POINTS	20

typedef struct tPoint {
	unsigned char x;
	unsigned char y;
} POINT;

typedef struct tGeometry {
	int numpoints;
	int sizex;
	int sizey;
	POINT px [MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj {
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void(*draw)(struct tObj *);
	void(*clear)(struct tObj *);
	void(*move)(struct tObj *);
	void(*set_speed)(struct tObj *, int, int);
} OBJECT, *POBJECT;

typedef struct projectile {
	POBJECT obj;
	void(*move_special)(struct projectile *, struct tObj*)
} PROJECTILE, *PPROJECTILE

// changes the objects speed
void set_object_speed(POBJECT o, int speedx, int speedy) {
	o->dirx = speedx;
	o->diry = speedy;
}

// draws the object to the screen through the pixel() function
void draw_object(POBJECT o) {
	int xx,yy;
	char offsx, offsy;
	xx = o->posx;
	yy = o->posy;

	for (int i = 0; i < o->geo->numpoints; i++) {
		offsx = o->geo->px[i].x;
		offsy = o->geo->px[i].y;

		pixel(xx+offsx,yy+offsy, 1);
	}
}

// clears the object from the screen through the pixel() function
void clear_object(POBJECT o) {
	int xx,yy,offsx,offsy;
	xx = o->posx;
	yy = o->posy;

	for (int i = 0; i < o->geo->numpoints; i++) {
		offsx = o->geo->px[i].x;
		offsy = o->geo->px[i].y;

		pixel(xx+offsx,yy+offsy, 0);
	}
}

// clears from pos A and then moves to pos B, taking in consideration walls (or in this case the edge of the screen)
void move_object(POBJECT o) {
	clear_object(o);

	if(o->posx < 1 || o->posx + o->geo->sizex > 128)
		o->dirx = 0;
	if(o->posy < 1 || o->posy + o->geo->sizey > 64)
		o->diry = 0;

	o->posx += o->dirx;
	o->posy += o->diry;

	draw_object(o);
}

void move_proj_object(POBJECT o, POBJECT p) {
	clear_object(o->obj);

	if(o->obj->posx < 1 || o->obj->posx + o->obj->geo->sizex > 128) {
		o->obj->posx = p->posx+4;
		o->posy = p->posy+2;
	}
	/*if(o->posy < 1 || o->posy + o->geo->sizey > 64)
		o->diry = 0;*/

	o->obj->posx += o->obj->dirx;
	o->obj->posy += o->obj->diry;

	draw_object(o);
}
