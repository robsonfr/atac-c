#include <graphics.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

char *aguarde = "\n Aguarde o carregamento dos desenhos...";
int handle;
char buffer[350];
#define SHIP 0
#define ENEMY 70
char titulo[5500];
char subtitulo[19825];

const float DEG_TO_RAD = 57.29577951308232;

void wait_key() {
	int code;
	code = getch();
	if (code == 0) {
		code = getch();
	}
	if (code == 3) {
		closegraph();
		exit(0);
	}
}

void intro() {
	int i,j;
	int c,d;
	cleardevice();
	settextstyle(1,0,3);
	outtextxy(40,10,"ETE LAURO GOMES");
	for(i=0;i<220;i++) {
		for(j=0;j<25;j++) {
			titulo[i*25+j]=getpixel(i+40,j+10);
		}
	}
	cleardevice();
	setcolor(2);
	settextstyle(4,0,8);
	outtextxy(20,100, "30 anos");
	for(i=0;i<305;i++) {
		for(j=0;j<65;j++) {
	/*		subtitulo[i*65+j]=getpixel(i+20,j+100); */
			subtitulo[i*65+j]=getpixel(i+10,j+120); /* ???? */	
			c=3-subtitulo[i*65+j];
			putpixel(i+10,j+120,c);
		}
	}
	cleardevice();	
}

int comp_cond(int a0, int a2, int a4) {
	if (a0 < 0) {
		if (a2 >= a4) {
			return 1;
		}
	} else {
		if (a2 <= a4) {
			return 1;
		}
	}
	return 0;
}

int powered_up, ship_x;
int draw_laser(int p, int q, int r, int s, int t) {
	int i,l,c,d;
	d=0;
	for(i=q+8;comp_cond(s,i,r) != 0;i+=s) {
		for(l=0;l<2;l++) {
			if(powered_up != 0) {
				c=getpixel(ship_x+3,i);
				if (c==0) {
					c=getpixel(ship_x+12,i);
					if (c != 0) {
						d = 1;
					} 
				} else {
					d = 1;
				}
				putpixel(ship_x+3, i,rand() % 4);
				putpixel(ship_x+12, i,rand() % 4);	
			} 

			if (comp_cond(-s,i,q) != 0) {
				c=getpixel(p+l,i);
				if (c != 0) {
					d = 1;
				}
				putpixel(p+l, i, rand() % 4);
			}
			if (t != 0) {
				sound(300+(rand() % 500));
				delay(1);
				nosound();
			}
		}
	}
	i=getcolor();
	setcolor(0);
	line(p,q,p,r);
	line(p+1,q,p+1,r);
	if (powered_up != 0) {
		line(ship_x+3,q+8,ship_x+3,r);	
		line(ship_x+12,q+8,ship_x+12,r);		
	}
	setcolor(i);
	return d;
}

void circ_explosion(int x, int y) {
	int i,j,c;
	float k,l,m,n,o,p;
	for(i=0;i<=8;i++) {
		for(j=0;j<15;j++) {
			k = j * 24;
			l = k / DEG_TO_RAD;
			m = cos(l) * i + x;
			n = sin(l) * i + y;
			if (i > 2) {
				o = cos(l) * (i - 2) + x;
				p = sin(l) * (i - 2) + y;
				putpixel((int) o, (int) p,0);	
			}
			putpixel((int) m, (int) n, rand() % 4);

		}
	}

	for(i=6;i<=8;i++) {
		for(j=0;j<15;j++) {
			k = j * 24;
			l = k / DEG_TO_RAD;
			m = cos(l) * i + x;
			n = sin(l) * i + y;
			putpixel((int) m, (int) n, 0);
		}
	}
	c=getcolor();
	setcolor(0);
	setfillstyle(1,0);
	for(i=0;i<=8;i++) {
		for(j=0;j<16;j++) {
			setfillstyle(1, rand() % 4);
			bar(x-i,y-i,x+i,y+i);	
		}
		setfillstyle(1,0);
		bar(x-i,y-i,x+i,y+i);
	}
	setcolor(c);
	setfillstyle(1,2);
}

void outro() {
	int i,j,k,l,m;
	cleardevice();
	/* First the ship and the ETE Lauro Gomes */
	/* After that, the enemy and the 30 anos */
	for(i=0;i<219;i++) {
		if (i > 0) {
			putimage(i+39,40,&buffer[SHIP],XOR_PUT);
		}
		putimage(i+40,40,&buffer[SHIP],XOR_PUT);
		setcolor(3);
		draw_laser(i+47,35,11,-1,1);
		for(k=25;k>0;k--) {
			for(l=0;l<2;l++) {
				for(j=0;j<2;j++) {
					putpixel(i+j+47,k+10,rand() % 4);		
				}
			}
			for(j=0;j<2;j++) {
				putpixel(i+j+47,k+10,titulo[i*25+k]);	
			}
		}
	}
	putimage(258,40,&buffer[SHIP],XOR_PUT);
	for(l=258;l>=152;l--) {
		if (l<258) {
			putimage(l+1,40,&buffer[SHIP],XOR_PUT);
			putimage(l+1,60,&buffer[ENEMY],XOR_PUT);
		}
		putimage(l,40,&buffer[SHIP],XOR_PUT);
		putimage(l,60,&buffer[ENEMY],XOR_PUT);
	}
	draw_laser(160,58,39,-1,1);
	circ_explosion(160,48);
	putimage(152,60,&buffer[ENEMY],XOR_PUT);
	for(j=0;j<304;j++) {
		if (j > 0) {
			putimage(j+2,100,&buffer[ENEMY],XOR_PUT);
		}
		putimage(j+3,100,&buffer[ENEMY],XOR_PUT);
		for(i=65;i>=0;i--) {
			for(l=0;l<5;l++) {
				putpixel(j+10,i+120,(rand() % 3)+1);
				sound((rand() % 500) + 300);
				delay(1);
				nosound();
			}
			putpixel(j+10,i+120,subtitulo[j*65+i]);
		}
	}
}

void main() {
	int g1, g2;
	float v4;
	g1 = CGA;
	g2 = CGAC0;
	printf(aguarde);
	handle = open("ATAC-C.BMP",1);
	read(handle, &buffer[0], 0x15E);
	close(handle);
	printf("\n Carregamento concluido");
	printf("\n Aperte qualquer tecla para iniciar");
	wait_key();
	initgraph(&g1,&g2,NULL);
	intro();
	outro();
/*	bb9();
	f1d96();
	f1b84();
	f132b();*/

}
