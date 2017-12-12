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
	void(*move_special)(struct projectile *, struct tObj*);
} PROJECTILE, *PPROJECTILE;

// changes the objects speed
void set_object_speed(POBJECT o, int speedx, int speedy);

// draws the object to the screen through the pixel() function
void draw_object(POBJECT o);

// clears the object from the screen through the pixel() function
void clear_object(POBJECT o);

// clears from pos A and then moves to pos B, taking in consideration walls (or in this case the edge of the screen)
void move_object(POBJECT o);

void move_proj_object(PPROJECTILE o, POBJECT p);