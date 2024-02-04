#include <graphics.h>
#include "vfx.h"
#include "sound.h"
#include "consts.h"


int comp_cond(int a0, int a2, int a4) {
	return ((a0 < 0 ? 1 : 0) ^ (a2 <= a4 ? 1 : 0));

}

int draw_laser(int p, int q, int r, int s, int t) {
	int i,l,c,d;
	d=0;
	for(i=q-1;comp_cond(s,i,r) != 0;i+=s) {
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
				putpixel(ship_x+3, i,colors[rand() % 4]);
				putpixel(ship_x+12, i,colors[rand() % 4]);
			}

			if (comp_cond(-s,i,q) != 0) {
				c=getpixel(p+l,i);
				if (c != 0) {
					d = 1;
				}
				putpixel(p+l, i, colors[rand() % 4]);
			}
			if (t != 0) {
				sound(300+(rand() % 500));
				delay(1);
				nosound();
			}
		}
	}
	i=getcolor();
	setcolor(colors[0]);
	line(p,q-1,p,r);
	line(p+1,q-1,p+1,r);
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
			putpixel((int) m, (int) n, colors[rand() % 4]);

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
	setcolor(colors[0]);
	setfillstyle(1,0);
	for(i=0;i<=8;i++) {
		for(j=0;j<16;j++) {
			setfillstyle(1, colors[rand() % 4]);
			bar(x-i,y-i,x+i,y+i);
		}
		setfillstyle(1,0);
		bar(x-i,y-i,x+i,y+i);
	}
	setcolor(c);
	setfillstyle(1,colors[2]);
}

int puttextcentered(char *texto, int y, int fonte, int tamanho) {
	int i,tw;
	settextstyle(fonte,0,tamanho);
	i = textwidth(texto);
	tw = (getmaxx() - i) / 2;
	outtextxy(tw,y,texto);
	return i;
}

