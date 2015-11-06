#include <graphics.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *aguarde = "\n Aguarde o carregamento dos desenhos...";
int handle;
char buffer[350];
char titulo[5500];
char subtitulo[19825];

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
	outtextxy(40,10,"ETE Lauro Gomes");
	for(i=0;i<220;i++) {
		for(j=0;j<25;j++) {
			titulo[i*25+j]=getpixel(i+40,j+10);
		}
	}
	cleardevice();
	setcolor(2);
	settextstyle(4,0,8);
	outtextxy(20,100, "20 anos");
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

int bfd_6272, bfd_620c;
int draw_laser(int p, int q, int r, int s, int t) {
	int i,j,k,l,c,d;
	j=p;
	d=0;
	for(i=q+8,k=0;;i++) {
		for(l=0;;l++) {
			if(bfd_6272 != 0) {
				c=getpixel(bfd_620c+3,i);
				if (c==0) {
					c=getpixel(bfd_620c+12,i);
					if (c != 0) {
						d = 1;
					} 
				} else {
					d = 1;
				}
				
			} 
		}
	}
}

void outro() {
	int i,j;
	cleardevice();
	/* First the ship and the ETE Lauro Gomes */

	/* After that, the enemy and the 20 anos */
}

void main() {
	int g1, g2;
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

}
