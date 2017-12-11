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
  15              		.global	ball_geometry
  16              		.data
  17              		.align	2
  20              	ball_geometry:
  21 0000 0C000000 		.word	12
  22 0004 04000000 		.word	4
  23 0008 04000000 		.word	4
  24 000c 00       		.byte	0
  25 000d 01       		.byte	1
  26 000e 00       		.byte	0
  27 000f 02       		.byte	2
  28 0010 01       		.byte	1
  29 0011 00       		.byte	0
  30 0012 01       		.byte	1
  31 0013 01       		.byte	1
  32 0014 01       		.byte	1
  33 0015 02       		.byte	2
  34 0016 01       		.byte	1
  35 0017 03       		.byte	3
  36 0018 02       		.byte	2
  37 0019 00       		.byte	0
  38 001a 02       		.byte	2
  39 001b 01       		.byte	1
  40 001c 02       		.byte	2
  41 001d 02       		.byte	2
  42 001e 02       		.byte	2
  43 001f 03       		.byte	3
  44 0020 03       		.byte	3
  45 0021 01       		.byte	1
  46 0022 03       		.byte	3
  47 0023 02       		.byte	2
  48 0024 00000000 		.space	16
  48      00000000 
  48      00000000 
  48      00000000 
  49              		.align	2
  52              	ball:
  53 0034 00000000 		.word	ball_geometry
  54 0038 00000000 		.word	0
  55 003c 00000000 		.word	0
  56 0040 01000000 		.word	1
  57 0044 01000000 		.word	1
  58 0048 00000000 		.word	draw_object
  59 004c 00000000 		.word	clear_object
  60 0050 00000000 		.word	move_object
  61 0054 00000000 		.word	set_object_speed
  62              		.section	.start_section,"ax",%progbits
  63              		.align	1
  64              		.global	startup
  65              		.syntax unified
  66              		.code	16
  67              		.thumb_func
  68              		.fpu softvfp
  70              	startup:
  71              	.LFB0:
  72              		.file 1 "Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay/startup.c"
   1:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** /*
   2:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c ****  * 	startup.c
   3:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c ****  *
   4:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c ****  */
   5:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c ****  
   6:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** #include "graphicdisplay.h"
   7:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** #include "object.h"
   8:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** #include "keyboard.h"
   9:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 
  10:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** GEOMETRY ball_geometry =
  11:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** {
  12:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	12,
  13:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	4,4,
  14:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	{
  15:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		{0,1}, {0,2}, {1,0}, {1,1},
  16:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		{1,2}, {1,3}, {2,0}, {2,1},
  17:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		{2,2}, {2,3}, {3,1}, {3,2}
  18:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	}
  19:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** };
  20:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 
  21:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** static OBJECT ball =
  22:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** {
  23:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	&ball_geometry,
  24:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	0,0,
  25:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	1,1,
  26:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	draw_object,
  27:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	clear_object,
  28:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	move_object,
  29:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	set_object_speed
  30:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** };
  31:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 
  32:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  33:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 
  34:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** void startup (void) {
  73              		.loc 1 34 0
  74              		.cfi_startproc
  75              		@ Naked Function: prologue and epilogue provided by programmer.
  76              		@ args = 0, pretend = 0, frame = 0
  77              		@ frame_needed = 1, uses_anonymous_args = 0
  35:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** __asm volatile(
  78              		.loc 1 35 0
  79              		.syntax divided
  80              	@ 35 "Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay/startup.c" 1
  81 0000 0248     		 LDR R0,=0x2001C000
  82 0002 8546     	 MOV SP,R0
  83 0004 FFF7FEFF 	 BL main
  84 0008 FEE7     	_exit: B .
  85              	
  86              	@ 0 "" 2
  36:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  37:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	" MOV SP,R0\n"
  38:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	" BL main\n"				/* call main */
  39:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  40:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	) ;
  41:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** }
  87              		.loc 1 41 0
  88              		.thumb
  89              		.syntax unified
  90 000a C046     		nop
  91              		.cfi_endproc
  92              	.LFE0:
  94              		.text
  95              		.align	1
  96              		.global	init_app
  97              		.syntax unified
  98              		.code	16
  99              		.thumb_func
 100              		.fpu softvfp
 102              	init_app:
 103              	.LFB1:
  42:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 
  43:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** void init_app(void) {
 104              		.loc 1 43 0
 105              		.cfi_startproc
 106              		@ args = 0, pretend = 0, frame = 0
 107              		@ frame_needed = 1, uses_anonymous_args = 0
 108 0000 80B5     		push	{r7, lr}
 109              		.cfi_def_cfa_offset 8
 110              		.cfi_offset 7, -8
 111              		.cfi_offset 14, -4
 112 0002 00AF     		add	r7, sp, #0
 113              		.cfi_def_cfa_register 7
  44:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	PORT_MODER = 0x55555555;
 114              		.loc 1 44 0
 115 0004 084B     		ldr	r3, .L3
 116 0006 094A     		ldr	r2, .L3+4
 117 0008 1A60     		str	r2, [r3]
  45:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	
  46:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	GPIO_MODER = 0x55005555;
 118              		.loc 1 46 0
 119 000a 094B     		ldr	r3, .L3+8
 120 000c 094A     		ldr	r2, .L3+12
 121 000e 1A60     		str	r2, [r3]
  47:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	GPIO_PUPDR = 0x00AA0000;
 122              		.loc 1 47 0
 123 0010 094B     		ldr	r3, .L3+16
 124 0012 AA22     		movs	r2, #170
 125 0014 1204     		lsls	r2, r2, #16
 126 0016 1A60     		str	r2, [r3]
  48:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	GPIO_ODR_HIGH &= 0x00FF;
 127              		.loc 1 48 0
 128 0018 084B     		ldr	r3, .L3+20
 129 001a 084A     		ldr	r2, .L3+20
 130 001c 1278     		ldrb	r2, [r2]
 131 001e D2B2     		uxtb	r2, r2
 132 0020 1A70     		strb	r2, [r3]
  49:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** }
 133              		.loc 1 49 0
 134 0022 C046     		nop
 135 0024 BD46     		mov	sp, r7
 136              		@ sp needed
 137 0026 80BD     		pop	{r7, pc}
 138              	.L4:
 139              		.align	2
 140              	.L3:
 141 0028 00100240 		.word	1073876992
 142 002c 55555555 		.word	1431655765
 143 0030 000C0240 		.word	1073875968
 144 0034 55550055 		.word	1426085205
 145 0038 0C0C0240 		.word	1073875980
 146 003c 150C0240 		.word	1073875989
 147              		.cfi_endproc
 148              	.LFE1:
 150              		.align	1
 151              		.global	main
 152              		.syntax unified
 153              		.code	16
 154              		.thumb_func
 155              		.fpu softvfp
 157              	main:
 158              	.LFB2:
  50:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 
  51:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** int main(int argc, char **argv) {
 159              		.loc 1 51 0
 160              		.cfi_startproc
 161              		@ args = 0, pretend = 0, frame = 16
 162              		@ frame_needed = 1, uses_anonymous_args = 0
 163 0040 90B5     		push	{r4, r7, lr}
 164              		.cfi_def_cfa_offset 12
 165              		.cfi_offset 4, -12
 166              		.cfi_offset 7, -8
 167              		.cfi_offset 14, -4
 168 0042 85B0     		sub	sp, sp, #20
 169              		.cfi_def_cfa_offset 32
 170 0044 00AF     		add	r7, sp, #0
 171              		.cfi_def_cfa_register 7
 172 0046 7860     		str	r0, [r7, #4]
 173 0048 3960     		str	r1, [r7]
  52:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	char c,hspd,vspd;
  53:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	POBJECT p = &ball;
 174              		.loc 1 53 0
 175 004a 264B     		ldr	r3, .L16
 176 004c FB60     		str	r3, [r7, #12]
  54:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	
  55:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	init_app();
 177              		.loc 1 55 0
 178 004e FFF7FEFF 		bl	init_app
  56:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	graphic_initialize();
 179              		.loc 1 56 0
 180 0052 FFF7FEFF 		bl	graphic_initialize
  57:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	
  58:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	#ifndef SIMULATOR
  59:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		graphic_clear_screen();
 181              		.loc 1 59 0
 182 0056 FFF7FEFF 		bl	graphic_clear_screen
  60:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	#endif
  61:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	
  62:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	p->set_speed(p,4,1);
 183              		.loc 1 62 0
 184 005a FB68     		ldr	r3, [r7, #12]
 185 005c 1B6A     		ldr	r3, [r3, #32]
 186 005e F868     		ldr	r0, [r7, #12]
 187 0060 0122     		movs	r2, #1
 188 0062 0421     		movs	r1, #4
 189 0064 9847     		blx	r3
 190              	.LVL0:
 191              	.L14:
 192              	.LBB2:
  63:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 	while(1) {
  64:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		p->move(p);
 193              		.loc 1 64 0
 194 0066 FB68     		ldr	r3, [r7, #12]
 195 0068 DB69     		ldr	r3, [r3, #28]
 196 006a FA68     		ldr	r2, [r7, #12]
 197 006c 1000     		movs	r0, r2
 198 006e 9847     		blx	r3
 199              	.LVL1:
  65:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		delay_milli(40);
 200              		.loc 1 65 0
 201 0070 2820     		movs	r0, #40
 202 0072 FFF7FEFF 		bl	delay_milli
  66:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		c = keyboard();
 203              		.loc 1 66 0
 204 0076 0B23     		movs	r3, #11
 205 0078 FC18     		adds	r4, r7, r3
 206 007a FFF7FEFF 		bl	keyboard
 207 007e 0300     		movs	r3, r0
 208 0080 2370     		strb	r3, [r4]
  67:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		
  68:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		switch(c) {
 209              		.loc 1 68 0
 210 0082 0B23     		movs	r3, #11
 211 0084 FB18     		adds	r3, r7, r3
 212 0086 1B78     		ldrb	r3, [r3]
 213 0088 082B     		cmp	r3, #8
 214 008a 22D8     		bhi	.L6
 215 008c 9A00     		lsls	r2, r3, #2
 216 008e 164B     		ldr	r3, .L16+4
 217 0090 D318     		adds	r3, r2, r3
 218 0092 1B68     		ldr	r3, [r3]
 219 0094 9F46     		mov	pc, r3
 220              		.section	.rodata
 221              		.align	2
 222              	.L8:
 223 0000 D2000000 		.word	.L6
 224 0004 D2000000 		.word	.L6
 225 0008 B4000000 		.word	.L7
 226 000c D2000000 		.word	.L6
 227 0010 A4000000 		.word	.L9
 228 0014 E0000000 		.word	.L15
 229 0018 96000000 		.word	.L11
 230 001c D2000000 		.word	.L6
 231 0020 C4000000 		.word	.L12
 232              		.text
 233              	.L11:
  69:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 			case 6: p->set_speed(p,2,0); break;
 234              		.loc 1 69 0
 235 0096 FB68     		ldr	r3, [r7, #12]
 236 0098 1B6A     		ldr	r3, [r3, #32]
 237 009a F868     		ldr	r0, [r7, #12]
 238 009c 0022     		movs	r2, #0
 239 009e 0221     		movs	r1, #2
 240 00a0 9847     		blx	r3
 241              	.LVL2:
 242 00a2 1EE0     		b	.L13
 243              	.L9:
  70:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 			case 4: p->set_speed(p,-2,0); break;
 244              		.loc 1 70 0
 245 00a4 FB68     		ldr	r3, [r7, #12]
 246 00a6 1B6A     		ldr	r3, [r3, #32]
 247 00a8 0222     		movs	r2, #2
 248 00aa 5142     		rsbs	r1, r2, #0
 249 00ac F868     		ldr	r0, [r7, #12]
 250 00ae 0022     		movs	r2, #0
 251 00b0 9847     		blx	r3
 252              	.LVL3:
 253 00b2 16E0     		b	.L13
 254              	.L7:
  71:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 			case 2: p->set_speed(p,0,-2); break;
 255              		.loc 1 71 0
 256 00b4 FB68     		ldr	r3, [r7, #12]
 257 00b6 1B6A     		ldr	r3, [r3, #32]
 258 00b8 0222     		movs	r2, #2
 259 00ba 5242     		rsbs	r2, r2, #0
 260 00bc F868     		ldr	r0, [r7, #12]
 261 00be 0021     		movs	r1, #0
 262 00c0 9847     		blx	r3
 263              	.LVL4:
 264 00c2 0EE0     		b	.L13
 265              	.L12:
  72:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 			case 8: p->set_speed(p,0,2); break;
 266              		.loc 1 72 0
 267 00c4 FB68     		ldr	r3, [r7, #12]
 268 00c6 1B6A     		ldr	r3, [r3, #32]
 269 00c8 F868     		ldr	r0, [r7, #12]
 270 00ca 0222     		movs	r2, #2
 271 00cc 0021     		movs	r1, #0
 272 00ce 9847     		blx	r3
 273              	.LVL5:
 274 00d0 07E0     		b	.L13
 275              	.L6:
  73:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 			case 5: break;
  74:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 			default: p->set_speed(p,0,0);
 276              		.loc 1 74 0
 277 00d2 FB68     		ldr	r3, [r7, #12]
 278 00d4 1B6A     		ldr	r3, [r3, #32]
 279 00d6 F868     		ldr	r0, [r7, #12]
 280 00d8 0022     		movs	r2, #0
 281 00da 0021     		movs	r1, #0
 282 00dc 9847     		blx	r3
 283              	.LVL6:
 284 00de C2E7     		b	.L14
 285              	.L15:
  73:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 			case 5: break;
 286              		.loc 1 73 0
 287 00e0 C046     		nop
 288              	.L13:
 289              	.LBE2:
  63:Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay\startup.c **** 		p->move(p);
 290              		.loc 1 63 0 discriminator 1
 291 00e2 C0E7     		b	.L14
 292              	.L17:
 293              		.align	2
 294              	.L16:
 295 00e4 34000000 		.word	ball
 296 00e8 00000000 		.word	.L8
 297              		.cfi_endproc
 298              	.LFE2:
 300              	.Letext0:
 301              		.file 2 "Z:/IT/Ar2/MaskinorienteradProgrammering/Lab3/graphicdisplay/object.h"
