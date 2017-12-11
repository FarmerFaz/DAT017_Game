# 1 "delay.c"
# 1 "Z:\\IT\\Ar2\\MaskinorienteradProgrammering\\Lab3\\graphicdisplay//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "delay.c"
# 9 "delay.c"
void delay_250ns(void) {
 *((volatile unsigned int *) (0xE000E010)) = 0;
 *((volatile unsigned int *) (0xE000E010 +0x4)) = 41;
 *((volatile unsigned int *) (0xE000E010 +0x8)) = 0;
 *((volatile unsigned int *) (0xE000E010)) = 5;
 while(!(*((volatile unsigned int *) (*((volatile unsigned int *) (0xE000E010))+0xF)) & 1)) {}
 *((volatile unsigned int *) (0xE000E010)) = 0;
}


void delay_500ns() {
 *((volatile unsigned int *) (0xE000E010)) = 0;
 *((volatile unsigned int *) (0xE000E010 +0x4)) = 83;
 *((volatile unsigned int *) (0xE000E010 +0x8)) = 0;
 *((volatile unsigned int *) (0xE000E010)) = 5;
 while(!(*((volatile unsigned int *) (*((volatile unsigned int *) (0xE000E010))+0xF)) & 1)) {}
 *((volatile unsigned int *) (0xE000E010)) = 0;
}


void delay_mikro(unsigned int us) {
 for(int i = 0; i < 4*us; i++) {
  delay_250ns();
 }
}


void delay_milli(unsigned int ms) {

  ms = ms / 1000;
  ms++;


 delay_mikro(1000*ms);
}
