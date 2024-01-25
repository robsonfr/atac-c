#include <graphics.h>
#include "consts.h"
#include "intro.h"
#include "input.h"
#include "vfx.h"
#include "ui.h"

char *lScore = "SCORE :";
char *lRecord = "RECORD:";

char *selvel = "Selecione a velocidade";
char *lento = "1. Lento";
char *medio = "2. Medio";
char *rapido = "3. Rapido";

char *seldif = "Escolha a dificuldade";
char *facil = "1. Facil";
char *dificil = "2. Dificil";


void speed() {
	int i;
	cleardevice();
	puttextcentered(selvel, 20, TRIPLEX_FONT, 1);
	outtextxy(15,40,lento);
	outtextxy(15,60,medio);
	outtextxy(15,80,rapido);
	i = getch();
	if ((i>=49) && (i<=51)) {
		velocity = velos[i-49];
	} else {
		velocity = 30;
	}
	puttextcentered(press2, 140, TRIPLEX_FONT, 1);
	wait_key();
	level();
}

void level() {
	int i;
	cleardevice();
	puttextcentered(seldif, 20, GOTHIC_FONT, 4);
	outtextxy(20,60,facil);
	outtextxy(20,100,dificil);
	i = getch();
	if ((i>=49) && (i<=50)) {
		difficulty = i-49;
	} else {
		difficulty = 0;
	}
	puttextcentered(press2, 140, TRIPLEX_FONT, 1);
}


char *etelg;
char *anos30;

void hud() {
	cleardevice();
	setcolor(colors[1]);
	setfillstyle(SOLID_FILL,colors[2]);
	bar(0,0,319,199);
	setfillstyle(SOLID_FILL,colors[0]);
	bar(10,10,240,160);
	setcolor(colors[0]);
	settextstyle(TRIPLEX_FONT,1,2);
	outtextxy(270,190,etelg);
	settextstyle(GOTHIC_FONT,1,2);
	outtextxy(290,190,anos30);
	settextstyle(DEFAULT_FONT,0,1);
	outtextxy(20,180,lScore);
	outtextxy(20,191,lRecord);

}
