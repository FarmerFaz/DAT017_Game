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
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.global	player_geometry
  16              		.data
  17              		.align	2
  20              	player_geometry:
  21 0000 0D000000 		.word	13
  22 0004 05000000 		.word	5
  23 0008 04000000 		.word	4
  24 000c 00       		.byte	0
  25 000d 00       		.byte	0
  26 000e 00       		.byte	0
  27 000f 01       		.byte	1
  28 0010 01       		.byte	1
  29 0011 01       		.byte	1
  30 0012 02       		.byte	2
  31 0013 01       		.byte	1
  32 0014 03       		.byte	3
  33 0015 01       		.byte	1
  34 0016 01       		.byte	1
  35 0017 02       		.byte	2
  36 0018 02       		.byte	2
  37 0019 02       		.byte	2
  38 001a 04       		.byte	4
  39 001b 02       		.byte	2
  40 001c 00       		.byte	0
  41 001d 03       		.byte	3
  42 001e 01       		.byte	1
  43 001f 03       		.byte	3
  44 0020 02       		.byte	2
  45 0021 03       		.byte	3
  46 0022 03       		.byte	3
  47 0023 03       		.byte	3
  48 0024 04       		.byte	4
  49 0025 03       		.byte	3
  50 0026 00000000 		.space	14
  50      00000000 
  50      00000000 
  50      0000
  51              		.global	proj_geometry
  52              		.align	2
  55              	proj_geometry:
  56 0034 04000000 		.word	4
  57 0038 02000000 		.word	2
  58 003c 02000000 		.word	2
  59 0040 00       		.byte	0
  60 0041 00       		.byte	0
  61 0042 00       		.byte	0
  62 0043 01       		.byte	1
  63 0044 01       		.byte	1
  64 0045 00       		.byte	0
  65 0046 01       		.byte	1
  66 0047 01       		.byte	1
  67 0048 00000000 		.space	32
  67      00000000 
  67      00000000 
  67      00000000 
  67      00000000 
  68              		.global	enemy_geometry
  69              		.align	2
  72              	enemy_geometry:
  73 0068 08000000 		.word	8
  74 006c 03000000 		.word	3
  75 0070 07000000 		.word	7
  76 0074 00       		.byte	0
  77 0075 00       		.byte	0
  78 0076 01       		.byte	1
  79 0077 01       		.byte	1
  80 0078 02       		.byte	2
  81 0079 02       		.byte	2
  82 007a 01       		.byte	1
  83 007b 03       		.byte	3
  84 007c 02       		.byte	2
  85 007d 03       		.byte	3
  86 007e 02       		.byte	2
  87 007f 04       		.byte	4
  88 0080 01       		.byte	1
  89 0081 05       		.byte	5
  90 0082 00       		.byte	0
  91 0083 06       		.byte	6
  92 0084 00000000 		.space	24
  92      00000000 
  92      00000000 
  92      00000000 
  92      00000000 
  93              		.align	2
  96              	player:
  97 009c 00000000 		.word	player_geometry
  98 00a0 00000000 		.word	0
  99 00a4 00000000 		.word	0
 100 00a8 01000000 		.word	1
 101 00ac 01000000 		.word	1
 102 00b0 00000000 		.word	draw_object
 103 00b4 00000000 		.word	clear_object
 104 00b8 00000000 		.word	move_object
 105 00bc 00000000 		.word	set_object_speed
 106              		.align	2
 109              	projectile:
 110 00c0 00000000 		.word	proj_geometry
 111 00c4 0A000000 		.word	10
 112 00c8 00000000 		.word	0
 113 00cc 00000000 		.word	0
 114 00d0 40000000 		.word	64
 115 00d4 00000000 		.word	draw_object
 116 00d8 00000000 		.word	clear_object
 117 00dc 00000000 		.word	move_object
 118 00e0 00000000 		.word	set_object_speed
 119              		.section	.start_section,"ax",%progbits
 120              		.align	1
 121              		.global	startup
 122              		.syntax unified
 123              		.code	16
 124              		.thumb_func
 125              		.fpu softvfp
 127              	startup:
 128              	.LFB0:
 129              		.file 1 "C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/
   1:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** /*
   2:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c ****  * 	startup.c
   3:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c ****  *
   4:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c ****  */
   5:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c ****  
   6:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** #include "graphicdisplay.h"
   7:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** #include "object.h"
   8:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** #include "keyboard.h"
   9:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  10:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** GEOMETRY player_geometry = {
  11:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	13,
  12:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	5,4,
  13:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	{
  14:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		{0,0}, 	{0,1}, 
  15:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 				{1,1}, 	{2,1}, 	{3,1},
  16:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 				{1,2}, 	{2,2}, 			{4,2}, 
  17:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		{0,3}, 	{1,3}, 	{2,3}, 	{3,3}, 	{4,3}
  18:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	}
  19:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** };
  20:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  21:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** GEOMETRY proj_geometry = {
  22:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	4,
  23:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	2,2,
  24:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	{
  25:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		{0,0},	{0,1},
  26:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		{1,0},	{1,1}
  27:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	}
  28:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** };
  29:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  30:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** GEOMETRY enemy_geometry = {
  31:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	8,
  32:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	3,7,
  33:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	{
  34:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		{0,0},
  35:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 				{1,1},
  36:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 						{2,2},
  37:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 				{1,3}, 	{2,3},
  38:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 						{2,4},
  39:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 				{1,5},
  40:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		{0,6}
  41:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	}
  42:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** };
  43:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  44:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** static OBJECT player = {
  45:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	&player_geometry,
  46:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	0,0,
  47:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	1,1,
  48:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	draw_object,
  49:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	clear_object,
  50:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	move_object,
  51:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	set_object_speed
  52:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** };
  53:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  54:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** static OBJECT projectile = {
  55:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	&proj_geometry,
  56:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	10, 0,
  57:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	0, 64,
  58:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	draw_object,
  59:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	clear_object,
  60:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	move_object,
  61:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	set_object_speed
  62:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** };
  63:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  64:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  65:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  66:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** void startup (void) {
 130              		.loc 1 66 0
 131              		.cfi_startproc
 132              		@ Naked Function: prologue and epilogue provided by programmer.
 133              		@ args = 0, pretend = 0, frame = 0
 134              		@ frame_needed = 1, uses_anonymous_args = 0
  67:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** __asm volatile(
 135              		.loc 1 67 0
 136              		.syntax divided
 137              	@ 67 "C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT0
 138 0000 0248     		 LDR R0,=0x2001C000
 139 0002 8546     	 MOV SP,R0
 140 0004 FFF7FEFF 	 BL main
 141 0008 FEE7     	_exit: B .
 142              	
 143              	@ 0 "" 2
  68:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  69:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	" MOV SP,R0\n"
  70:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	" BL main\n"				/* call main */
  71:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	"_exit: B .\n"				/* never return */
  72:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	) ;
  73:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** }
 144              		.loc 1 73 0
 145              		.thumb
 146              		.syntax unified
 147 000a C046     		nop
 148              		.cfi_endproc
 149              	.LFE0:
 151              		.text
 152              		.align	1
 153              		.global	init_app
 154              		.syntax unified
 155              		.code	16
 156              		.thumb_func
 157              		.fpu softvfp
 159              	init_app:
 160              	.LFB1:
  74:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  75:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** void init_app(void) {
 161              		.loc 1 75 0
 162              		.cfi_startproc
 163              		@ args = 0, pretend = 0, frame = 0
 164              		@ frame_needed = 1, uses_anonymous_args = 0
 165 0000 80B5     		push	{r7, lr}
 166              		.cfi_def_cfa_offset 8
 167              		.cfi_offset 7, -8
 168              		.cfi_offset 14, -4
 169 0002 00AF     		add	r7, sp, #0
 170              		.cfi_def_cfa_register 7
  76:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	PORT_MODER = 0x55555555;
 171              		.loc 1 76 0
 172 0004 084B     		ldr	r3, .L3
 173 0006 094A     		ldr	r2, .L3+4
 174 0008 1A60     		str	r2, [r3]
  77:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	
  78:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	GPIO_MODER = 0x55005555;
 175              		.loc 1 78 0
 176 000a 094B     		ldr	r3, .L3+8
 177 000c 094A     		ldr	r2, .L3+12
 178 000e 1A60     		str	r2, [r3]
  79:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	GPIO_PUPDR = 0x00AA0000;
 179              		.loc 1 79 0
 180 0010 094B     		ldr	r3, .L3+16
 181 0012 AA22     		movs	r2, #170
 182 0014 1204     		lsls	r2, r2, #16
 183 0016 1A60     		str	r2, [r3]
  80:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	GPIO_ODR_HIGH &= 0x00FF;
 184              		.loc 1 80 0
 185 0018 084B     		ldr	r3, .L3+20
 186 001a 084A     		ldr	r2, .L3+20
 187 001c 1278     		ldrb	r2, [r2]
 188 001e D2B2     		uxtb	r2, r2
 189 0020 1A70     		strb	r2, [r3]
  81:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** }
 190              		.loc 1 81 0
 191 0022 C046     		nop
 192 0024 BD46     		mov	sp, r7
 193              		@ sp needed
 194 0026 80BD     		pop	{r7, pc}
 195              	.L4:
 196              		.align	2
 197              	.L3:
 198 0028 00100240 		.word	1073876992
 199 002c 55555555 		.word	1431655765
 200 0030 000C0240 		.word	1073875968
 201 0034 55550055 		.word	1426085205
 202 0038 0C0C0240 		.word	1073875980
 203 003c 150C0240 		.word	1073875989
 204              		.cfi_endproc
 205              	.LFE1:
 207              		.align	1
 208              		.global	main
 209              		.syntax unified
 210              		.code	16
 211              		.thumb_func
 212              		.fpu softvfp
 214              	main:
 215              	.LFB2:
  82:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 
  83:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** int main(int argc, char **argv) {
 216              		.loc 1 83 0
 217              		.cfi_startproc
 218              		@ args = 0, pretend = 0, frame = 24
 219              		@ frame_needed = 1, uses_anonymous_args = 0
 220 0040 90B5     		push	{r4, r7, lr}
 221              		.cfi_def_cfa_offset 12
 222              		.cfi_offset 4, -12
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 0042 87B0     		sub	sp, sp, #28
 226              		.cfi_def_cfa_offset 40
 227 0044 00AF     		add	r7, sp, #0
 228              		.cfi_def_cfa_register 7
 229 0046 7860     		str	r0, [r7, #4]
 230 0048 3960     		str	r1, [r7]
  84:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	char c;
  85:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	POBJECT player = &player;
 231              		.loc 1 85 0
 232 004a 1023     		movs	r3, #16
 233 004c FB18     		adds	r3, r7, r3
 234 004e 3B61     		str	r3, [r7, #16]
  86:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	POBJECT proj = &proj;
 235              		.loc 1 86 0
 236 0050 0C23     		movs	r3, #12
 237 0052 FB18     		adds	r3, r7, r3
 238 0054 FB60     		str	r3, [r7, #12]
  87:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	
  88:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	init_app();
 239              		.loc 1 88 0
 240 0056 FFF7FEFF 		bl	init_app
  89:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	graphic_initialize();
 241              		.loc 1 89 0
 242 005a FFF7FEFF 		bl	graphic_initialize
  90:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	
  91:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	#ifndef SIMULATOR
  92:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		graphic_clear_screen();
 243              		.loc 1 92 0
 244 005e FFF7FEFF 		bl	graphic_clear_screen
  93:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	#endif
  94:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	
  95:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	player->set_speed(player,4,1);
 245              		.loc 1 95 0
 246 0062 3B69     		ldr	r3, [r7, #16]
 247 0064 1B6A     		ldr	r3, [r3, #32]
 248 0066 3869     		ldr	r0, [r7, #16]
 249 0068 0122     		movs	r2, #1
 250 006a 0421     		movs	r1, #4
 251 006c 9847     		blx	r3
 252              	.LVL0:
 253              	.L10:
 254              	.LBB2:
  96:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 	while(1) {
  97:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		player->move(player);
 255              		.loc 1 97 0
 256 006e 3B69     		ldr	r3, [r7, #16]
 257 0070 DB69     		ldr	r3, [r3, #28]
 258 0072 3A69     		ldr	r2, [r7, #16]
 259 0074 1000     		movs	r0, r2
 260 0076 9847     		blx	r3
 261              	.LVL1:
  98:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		proj->move(proj);
 262              		.loc 1 98 0
 263 0078 FB68     		ldr	r3, [r7, #12]
 264 007a DB69     		ldr	r3, [r3, #28]
 265 007c FA68     		ldr	r2, [r7, #12]
 266 007e 1000     		movs	r0, r2
 267 0080 9847     		blx	r3
 268              	.LVL2:
  99:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		delay_milli(40);
 269              		.loc 1 99 0
 270 0082 2820     		movs	r0, #40
 271 0084 FFF7FEFF 		bl	delay_milli
 100:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		c = keyboard();
 272              		.loc 1 100 0
 273 0088 1723     		movs	r3, #23
 274 008a FC18     		adds	r4, r7, r3
 275 008c FFF7FEFF 		bl	keyboard
 276 0090 0300     		movs	r3, r0
 277 0092 2370     		strb	r3, [r4]
 101:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		
 102:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		switch(c) {
 278              		.loc 1 102 0
 279 0094 1723     		movs	r3, #23
 280 0096 FB18     		adds	r3, r7, r3
 281 0098 1B78     		ldrb	r3, [r3]
 282 009a 022B     		cmp	r3, #2
 283 009c 02D0     		beq	.L7
 284 009e 082B     		cmp	r3, #8
 285 00a0 08D0     		beq	.L8
 286 00a2 0EE0     		b	.L11
 287              	.L7:
 103:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 			case 2: player->set_speed(player,0,-2); break;
 288              		.loc 1 103 0
 289 00a4 3B69     		ldr	r3, [r7, #16]
 290 00a6 1B6A     		ldr	r3, [r3, #32]
 291 00a8 3869     		ldr	r0, [r7, #16]
 292 00aa 0222     		movs	r2, #2
 293 00ac 5242     		rsbs	r2, r2, #0
 294 00ae 0021     		movs	r1, #0
 295 00b0 9847     		blx	r3
 296              	.LVL3:
 297 00b2 0CE0     		b	.L9
 298              	.L8:
 104:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 			case 8: player->set_speed(player,0,2); break;
 299              		.loc 1 104 0
 300 00b4 3B69     		ldr	r3, [r7, #16]
 301 00b6 1B6A     		ldr	r3, [r3, #32]
 302 00b8 3869     		ldr	r0, [r7, #16]
 303 00ba 0222     		movs	r2, #2
 304 00bc 0021     		movs	r1, #0
 305 00be 9847     		blx	r3
 306              	.LVL4:
 307 00c0 05E0     		b	.L9
 308              	.L11:
 105:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 			//case 5: break;
 106:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 			default: player->set_speed(player,0,0);
 309              		.loc 1 106 0
 310 00c2 3B69     		ldr	r3, [r7, #16]
 311 00c4 1B6A     		ldr	r3, [r3, #32]
 312 00c6 3869     		ldr	r0, [r7, #16]
 313 00c8 0022     		movs	r2, #0
 314 00ca 0021     		movs	r1, #0
 315 00cc 9847     		blx	r3
 316              	.LVL5:
 317              	.L9:
 318              	.LBE2:
  96:C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/DAT017_Game/SideScroller\startup.c **** 		player->move(player);
 319              		.loc 1 96 0
 320 00ce CEE7     		b	.L10
 321              		.cfi_endproc
 322              	.LFE2:
 324              	.Letext0:
 325              		.file 2 "C:/Users/Mr Cornholio/Documents/TheBeesKnees/Ar2/DAT017_Maskinorienterad_Programmering/C/
