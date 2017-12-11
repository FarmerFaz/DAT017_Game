   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"object.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	set_object_speed
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	set_object_speed:
  23              	.LFB0:
  24              		.file 1 "C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/
   1:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** #define	MAX_POINTS	20
   2:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
   3:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** typedef struct tPoint {
   4:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	unsigned char x;
   5:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	unsigned char y;
   6:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** } POINT;
   7:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
   8:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** typedef struct tGeometry {
   9:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	int numpoints;
  10:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	int sizex;
  11:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	int sizey;
  12:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	POINT px [MAX_POINTS];
  13:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** } GEOMETRY, *PGEOMETRY;
  14:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
  15:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** typedef struct tObj {
  16:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	PGEOMETRY geo;
  17:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	int dirx, diry;
  18:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	int posx, posy;
  19:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	void(*draw)(struct tObj *);
  20:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	void(*clear)(struct tObj *);
  21:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	void(*move)(struct tObj *);
  22:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	void(*set_speed)(struct tObj *, int, int);
  23:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** } OBJECT, *POBJECT;
  24:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
  25:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** // changes the objects speed
  26:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** void set_object_speed(POBJECT o, int speedx, int speedy) {
  25              		.loc 1 26 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 16
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 84B0     		sub	sp, sp, #16
  34              		.cfi_def_cfa_offset 24
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 F860     		str	r0, [r7, #12]
  38 0008 B960     		str	r1, [r7, #8]
  39 000a 7A60     		str	r2, [r7, #4]
  27:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	o->dirx = speedx;
  40              		.loc 1 27 0
  41 000c FB68     		ldr	r3, [r7, #12]
  42 000e BA68     		ldr	r2, [r7, #8]
  43 0010 5A60     		str	r2, [r3, #4]
  28:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	o->diry = speedy;
  44              		.loc 1 28 0
  45 0012 FB68     		ldr	r3, [r7, #12]
  46 0014 7A68     		ldr	r2, [r7, #4]
  47 0016 9A60     		str	r2, [r3, #8]
  29:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** }
  48              		.loc 1 29 0
  49 0018 C046     		nop
  50 001a BD46     		mov	sp, r7
  51 001c 04B0     		add	sp, sp, #16
  52              		@ sp needed
  53 001e 80BD     		pop	{r7, pc}
  54              		.cfi_endproc
  55              	.LFE0:
  57              		.align	1
  58              		.global	draw_object
  59              		.syntax unified
  60              		.code	16
  61              		.thumb_func
  62              		.fpu softvfp
  64              	draw_object:
  65              	.LFB1:
  30:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
  31:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** // draws the object to the screen through the pixel() function
  32:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** void draw_object(POBJECT o) {
  66              		.loc 1 32 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 24
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0020 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0022 86B0     		sub	sp, sp, #24
  75              		.cfi_def_cfa_offset 32
  76 0024 00AF     		add	r7, sp, #0
  77              		.cfi_def_cfa_register 7
  78 0026 7860     		str	r0, [r7, #4]
  33:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	int xx,yy;
  34:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	char offsx, offsy;
  35:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	xx = o->posx;
  79              		.loc 1 35 0
  80 0028 7B68     		ldr	r3, [r7, #4]
  81 002a DB68     		ldr	r3, [r3, #12]
  82 002c 3B61     		str	r3, [r7, #16]
  36:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	yy = o->posy;
  83              		.loc 1 36 0
  84 002e 7B68     		ldr	r3, [r7, #4]
  85 0030 1B69     		ldr	r3, [r3, #16]
  86 0032 FB60     		str	r3, [r7, #12]
  87              	.LBB2:
  37:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
  38:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	for (int i = 0; i < o->geo->numpoints; i++) {
  88              		.loc 1 38 0
  89 0034 0023     		movs	r3, #0
  90 0036 7B61     		str	r3, [r7, #20]
  91 0038 26E0     		b	.L3
  92              	.L4:
  93              	.LBB3:
  39:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsx = o->geo->px[i].x;
  94              		.loc 1 39 0 discriminator 3
  95 003a 7B68     		ldr	r3, [r7, #4]
  96 003c 1968     		ldr	r1, [r3]
  97 003e 0B23     		movs	r3, #11
  98 0040 FB18     		adds	r3, r7, r3
  99 0042 7A69     		ldr	r2, [r7, #20]
 100 0044 0432     		adds	r2, r2, #4
 101 0046 5200     		lsls	r2, r2, #1
 102 0048 8A18     		adds	r2, r1, r2
 103 004a 0432     		adds	r2, r2, #4
 104 004c 1278     		ldrb	r2, [r2]
 105 004e 1A70     		strb	r2, [r3]
  40:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsy = o->geo->px[i].y;
 106              		.loc 1 40 0 discriminator 3
 107 0050 7B68     		ldr	r3, [r7, #4]
 108 0052 1968     		ldr	r1, [r3]
 109 0054 0A23     		movs	r3, #10
 110 0056 FB18     		adds	r3, r7, r3
 111 0058 7A69     		ldr	r2, [r7, #20]
 112 005a 0432     		adds	r2, r2, #4
 113 005c 5200     		lsls	r2, r2, #1
 114 005e 8A18     		adds	r2, r1, r2
 115 0060 0532     		adds	r2, r2, #5
 116 0062 1278     		ldrb	r2, [r2]
 117 0064 1A70     		strb	r2, [r3]
  41:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		
  42:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		pixel(xx+offsx,yy+offsy, 1);
 118              		.loc 1 42 0 discriminator 3
 119 0066 0B23     		movs	r3, #11
 120 0068 FB18     		adds	r3, r7, r3
 121 006a 1A78     		ldrb	r2, [r3]
 122 006c 3B69     		ldr	r3, [r7, #16]
 123 006e D018     		adds	r0, r2, r3
 124 0070 0A23     		movs	r3, #10
 125 0072 FB18     		adds	r3, r7, r3
 126 0074 1A78     		ldrb	r2, [r3]
 127 0076 FB68     		ldr	r3, [r7, #12]
 128 0078 D318     		adds	r3, r2, r3
 129 007a 0122     		movs	r2, #1
 130 007c 1900     		movs	r1, r3
 131 007e FFF7FEFF 		bl	pixel
 132              	.LBE3:
  38:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsx = o->geo->px[i].x;
 133              		.loc 1 38 0 discriminator 3
 134 0082 7B69     		ldr	r3, [r7, #20]
 135 0084 0133     		adds	r3, r3, #1
 136 0086 7B61     		str	r3, [r7, #20]
 137              	.L3:
  38:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsx = o->geo->px[i].x;
 138              		.loc 1 38 0 is_stmt 0 discriminator 1
 139 0088 7B68     		ldr	r3, [r7, #4]
 140 008a 1B68     		ldr	r3, [r3]
 141 008c 1A68     		ldr	r2, [r3]
 142 008e 7B69     		ldr	r3, [r7, #20]
 143 0090 9A42     		cmp	r2, r3
 144 0092 D2DC     		bgt	.L4
 145              	.LBE2:
  43:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	}
  44:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** }
 146              		.loc 1 44 0 is_stmt 1
 147 0094 C046     		nop
 148 0096 BD46     		mov	sp, r7
 149 0098 06B0     		add	sp, sp, #24
 150              		@ sp needed
 151 009a 80BD     		pop	{r7, pc}
 152              		.cfi_endproc
 153              	.LFE1:
 155              		.align	1
 156              		.global	clear_object
 157              		.syntax unified
 158              		.code	16
 159              		.thumb_func
 160              		.fpu softvfp
 162              	clear_object:
 163              	.LFB2:
  45:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
  46:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** // clears the object from the screen through the pixel() function
  47:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** void clear_object(POBJECT o) {
 164              		.loc 1 47 0
 165              		.cfi_startproc
 166              		@ args = 0, pretend = 0, frame = 32
 167              		@ frame_needed = 1, uses_anonymous_args = 0
 168 009c 80B5     		push	{r7, lr}
 169              		.cfi_def_cfa_offset 8
 170              		.cfi_offset 7, -8
 171              		.cfi_offset 14, -4
 172 009e 88B0     		sub	sp, sp, #32
 173              		.cfi_def_cfa_offset 40
 174 00a0 00AF     		add	r7, sp, #0
 175              		.cfi_def_cfa_register 7
 176 00a2 7860     		str	r0, [r7, #4]
  48:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	int xx,yy,offsx,offsy;
  49:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	xx = o->posx;
 177              		.loc 1 49 0
 178 00a4 7B68     		ldr	r3, [r7, #4]
 179 00a6 DB68     		ldr	r3, [r3, #12]
 180 00a8 BB61     		str	r3, [r7, #24]
  50:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	yy = o->posy;
 181              		.loc 1 50 0
 182 00aa 7B68     		ldr	r3, [r7, #4]
 183 00ac 1B69     		ldr	r3, [r3, #16]
 184 00ae 7B61     		str	r3, [r7, #20]
 185              	.LBB4:
  51:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
  52:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	for (int i = 0; i < o->geo->numpoints; i++) {
 186              		.loc 1 52 0
 187 00b0 0023     		movs	r3, #0
 188 00b2 FB61     		str	r3, [r7, #28]
 189 00b4 1EE0     		b	.L6
 190              	.L7:
 191              	.LBB5:
  53:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsx = o->geo->px[i].x;
 192              		.loc 1 53 0 discriminator 3
 193 00b6 7B68     		ldr	r3, [r7, #4]
 194 00b8 1A68     		ldr	r2, [r3]
 195 00ba FB69     		ldr	r3, [r7, #28]
 196 00bc 0433     		adds	r3, r3, #4
 197 00be 5B00     		lsls	r3, r3, #1
 198 00c0 D318     		adds	r3, r2, r3
 199 00c2 0433     		adds	r3, r3, #4
 200 00c4 1B78     		ldrb	r3, [r3]
 201 00c6 3B61     		str	r3, [r7, #16]
  54:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsy = o->geo->px[i].y;
 202              		.loc 1 54 0 discriminator 3
 203 00c8 7B68     		ldr	r3, [r7, #4]
 204 00ca 1A68     		ldr	r2, [r3]
 205 00cc FB69     		ldr	r3, [r7, #28]
 206 00ce 0433     		adds	r3, r3, #4
 207 00d0 5B00     		lsls	r3, r3, #1
 208 00d2 D318     		adds	r3, r2, r3
 209 00d4 0533     		adds	r3, r3, #5
 210 00d6 1B78     		ldrb	r3, [r3]
 211 00d8 FB60     		str	r3, [r7, #12]
  55:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		
  56:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		pixel(xx+offsx,yy+offsy, 0);
 212              		.loc 1 56 0 discriminator 3
 213 00da BA69     		ldr	r2, [r7, #24]
 214 00dc 3B69     		ldr	r3, [r7, #16]
 215 00de D018     		adds	r0, r2, r3
 216 00e0 7A69     		ldr	r2, [r7, #20]
 217 00e2 FB68     		ldr	r3, [r7, #12]
 218 00e4 D318     		adds	r3, r2, r3
 219 00e6 0022     		movs	r2, #0
 220 00e8 1900     		movs	r1, r3
 221 00ea FFF7FEFF 		bl	pixel
 222              	.LBE5:
  52:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsx = o->geo->px[i].x;
 223              		.loc 1 52 0 discriminator 3
 224 00ee FB69     		ldr	r3, [r7, #28]
 225 00f0 0133     		adds	r3, r3, #1
 226 00f2 FB61     		str	r3, [r7, #28]
 227              	.L6:
  52:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		offsx = o->geo->px[i].x;
 228              		.loc 1 52 0 is_stmt 0 discriminator 1
 229 00f4 7B68     		ldr	r3, [r7, #4]
 230 00f6 1B68     		ldr	r3, [r3]
 231 00f8 1A68     		ldr	r2, [r3]
 232 00fa FB69     		ldr	r3, [r7, #28]
 233 00fc 9A42     		cmp	r2, r3
 234 00fe DADC     		bgt	.L7
 235              	.LBE4:
  57:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	}
  58:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** }
 236              		.loc 1 58 0 is_stmt 1
 237 0100 C046     		nop
 238 0102 BD46     		mov	sp, r7
 239 0104 08B0     		add	sp, sp, #32
 240              		@ sp needed
 241 0106 80BD     		pop	{r7, pc}
 242              		.cfi_endproc
 243              	.LFE2:
 245              		.align	1
 246              		.global	move_object
 247              		.syntax unified
 248              		.code	16
 249              		.thumb_func
 250              		.fpu softvfp
 252              	move_object:
 253              	.LFB3:
  59:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 
  60:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** // clears from pos A and then moves to pos B, taking in consideration walls (or in this case the ed
  61:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** void move_object(POBJECT o) {
 254              		.loc 1 61 0
 255              		.cfi_startproc
 256              		@ args = 0, pretend = 0, frame = 8
 257              		@ frame_needed = 1, uses_anonymous_args = 0
 258 0108 80B5     		push	{r7, lr}
 259              		.cfi_def_cfa_offset 8
 260              		.cfi_offset 7, -8
 261              		.cfi_offset 14, -4
 262 010a 82B0     		sub	sp, sp, #8
 263              		.cfi_def_cfa_offset 16
 264 010c 00AF     		add	r7, sp, #0
 265              		.cfi_def_cfa_register 7
 266 010e 7860     		str	r0, [r7, #4]
  62:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	clear_object(o);
 267              		.loc 1 62 0
 268 0110 7B68     		ldr	r3, [r7, #4]
 269 0112 1800     		movs	r0, r3
 270 0114 FFF7FEFF 		bl	clear_object
  63:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	o->posx += o->dirx;
 271              		.loc 1 63 0
 272 0118 7B68     		ldr	r3, [r7, #4]
 273 011a DA68     		ldr	r2, [r3, #12]
 274 011c 7B68     		ldr	r3, [r7, #4]
 275 011e 5B68     		ldr	r3, [r3, #4]
 276 0120 D218     		adds	r2, r2, r3
 277 0122 7B68     		ldr	r3, [r7, #4]
 278 0124 DA60     		str	r2, [r3, #12]
  64:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	o->posy += o->diry;
 279              		.loc 1 64 0
 280 0126 7B68     		ldr	r3, [r7, #4]
 281 0128 1A69     		ldr	r2, [r3, #16]
 282 012a 7B68     		ldr	r3, [r7, #4]
 283 012c 9B68     		ldr	r3, [r3, #8]
 284 012e D218     		adds	r2, r2, r3
 285 0130 7B68     		ldr	r3, [r7, #4]
 286 0132 1A61     		str	r2, [r3, #16]
  65:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	
  66:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	if(o->posx < 1 || o->posx + o->geo->sizex > 128)
 287              		.loc 1 66 0
 288 0134 7B68     		ldr	r3, [r7, #4]
 289 0136 DB68     		ldr	r3, [r3, #12]
 290 0138 002B     		cmp	r3, #0
 291 013a 07DD     		ble	.L9
 292              		.loc 1 66 0 is_stmt 0 discriminator 1
 293 013c 7B68     		ldr	r3, [r7, #4]
 294 013e DA68     		ldr	r2, [r3, #12]
 295 0140 7B68     		ldr	r3, [r7, #4]
 296 0142 1B68     		ldr	r3, [r3]
 297 0144 5B68     		ldr	r3, [r3, #4]
 298 0146 D318     		adds	r3, r2, r3
 299 0148 802B     		cmp	r3, #128
 300 014a 04DD     		ble	.L10
 301              	.L9:
  67:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		o->dirx = -o->dirx;
 302              		.loc 1 67 0 is_stmt 1
 303 014c 7B68     		ldr	r3, [r7, #4]
 304 014e 5B68     		ldr	r3, [r3, #4]
 305 0150 5A42     		rsbs	r2, r3, #0
 306 0152 7B68     		ldr	r3, [r7, #4]
 307 0154 5A60     		str	r2, [r3, #4]
 308              	.L10:
  68:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	if(o->posy < 1 || o->posy + o->geo->sizey > 64)
 309              		.loc 1 68 0
 310 0156 7B68     		ldr	r3, [r7, #4]
 311 0158 1B69     		ldr	r3, [r3, #16]
 312 015a 002B     		cmp	r3, #0
 313 015c 07DD     		ble	.L11
 314              		.loc 1 68 0 is_stmt 0 discriminator 1
 315 015e 7B68     		ldr	r3, [r7, #4]
 316 0160 1A69     		ldr	r2, [r3, #16]
 317 0162 7B68     		ldr	r3, [r7, #4]
 318 0164 1B68     		ldr	r3, [r3]
 319 0166 9B68     		ldr	r3, [r3, #8]
 320 0168 D318     		adds	r3, r2, r3
 321 016a 402B     		cmp	r3, #64
 322 016c 04DD     		ble	.L12
 323              	.L11:
  69:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 		o->diry = -o->diry;
 324              		.loc 1 69 0 is_stmt 1
 325 016e 7B68     		ldr	r3, [r7, #4]
 326 0170 9B68     		ldr	r3, [r3, #8]
 327 0172 5A42     		rsbs	r2, r3, #0
 328 0174 7B68     		ldr	r3, [r7, #4]
 329 0176 9A60     		str	r2, [r3, #8]
 330              	.L12:
  70:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	
  71:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** 	draw_object(o);
 331              		.loc 1 71 0
 332 0178 7B68     		ldr	r3, [r7, #4]
 333 017a 1800     		movs	r0, r3
 334 017c FFF7FEFF 		bl	draw_object
  72:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\object.c **** }...
 335              		.loc 1 72 0
 336 0180 C046     		nop
 337 0182 BD46     		mov	sp, r7
 338 0184 02B0     		add	sp, sp, #8
 339              		@ sp needed
 340 0186 80BD     		pop	{r7, pc}
 341              		.cfi_endproc
 342              	.LFE3:
 344              	.Letext0:
