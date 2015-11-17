#include <graphics.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <dos.h>

void level();

char *etelg = "ETE LAURO GOMES";
char *anos30 = "30 anos";
char *aguarde = "\n Aguarde o carregamento dos desenhos...";
char *autores = "Robson dos Santos Franca";
char *autores2 = "Ricardo S. Silva";
char *autores3 = "e Roger Alvarenga";
char *apresentam = "APRESENTAM ...";

char *atacc = "ATAC-C";
char *direitos = "ATAC-C(c) Todos os direitos reservados";
char *direitos2 = "... a turma 2o. O da area de PD e";
char *direitos3 = " a ETE LAURO GOMES pelos seus 30 anos";
char *pressione = "Pressione uma tecla para seguir...";

char *pers = "Personagens e valores";
char *nave = "Nave";
char *inimigo = "O Inimigo: 100 pontos";
char *powerup = "Power Up: 50 pontos + poder de fogo";
char *extra_life = "Vida Extra: Mais uma vida";
char *bonus = "Bonus: 1000 pontos";
char *press2 = "Pressione qualquer tecla...";

char *selvel = "Selecione a velocidade";
char *lento = "1. Lento";
char *medio = "2. Medio";
char *rapido = "3. Rapido";

char *seldif = "Escolha a dificuldade";
char *facil = "1. Facil";
char *dificil = "2. Dificil";


char *lScore = "SCORE :";
char *lRecord = "RECORD:";
char *instrucoes = "Instrucoes";
char *instr01 = "Seu objetivo e' destruir as naves";
char *instr02 = "inimigas que sobrevoam sobre voce.";
char *instr03 = ".Para isso voce dispoe de um canhao";
char *instr04 = " de longo alcance. Aperte <ALT> p/ ";
char *instr05 = "atirar. Utilize tambem as teclas";
char *instr06 = "SHIFT para se mover.Se destruir o";
char *instr07 = "(P) obtera mais dois tiros extras.";
char *instr08 = "Ha', entretanto, um porem... se 5 ";
char *instr09 = "naves descerem para o fim da tela...";
char *instr10 = "GAME OVER!! Tem um indicador abaixo ";
char *instr11 = "que indica as naves que desceram,so";
char *instr12 = "que ao contrario... Assim se tem 2 ";
char *instr13 = "naves significa que 3 ja desceram...";
char *instr14 = "De vez em quando esse simbolo cai na";
char *instr15 = "tela. Se destrui-lo, voce \"ganha\" 3 vi-";
char *instr16 = "das extras. Tem tambem um (B) que da ";
char *instr17 = "1000 pontos se voce destrui-lo";
char *instr18 = "B O A   S O R T E   ! ! !";
char *instr19 = "Pressione qualquer tecla para comecar...";

int handle;
char buffer[350];

#define SHIP 0
#define ENEMY 70
#define POWERUP 140
#define ONEUP 210
#define BONUS 280

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
	settextstyle(TRIPLEX_FONT,0,3);
	outtextxy(40,10,etelg);
	for(i=0;i<220;i++) {
		for(j=0;j<25;j++) {
			titulo[i*25+j]=getpixel(i+40,j+10);
		}
	}
	cleardevice();
	setcolor(2);
	settextstyle(GOTHIC_FONT,0,8);
	outtextxy(20,100, anos30);
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

int puttextcentered(char *texto, int y, int fonte, int tamanho) {
	int i,tw;
	settextstyle(fonte,0,tamanho);
	i = textwidth(texto);
	tw = (getmaxx() - i) / 2;
	outtextxy(tw,y,texto);
	return i;
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
	putimage(306,100,&buffer[ENEMY],XOR_PUT);
	setcolor(3);
	wait_key();
	setcolor(0);
	line(0,100,319,100);
	for(m=0;m<100;m++) {
		line(0,m,319,m);
		line(0,200-m,319,200-m);
	}
	setcolor(3);
	i=puttextcentered(autores,40,GOTHIC_FONT,2);
	k=textheight("H");
	m=k+42;
	puttextcentered(autores2,m,GOTHIC_FONT,2);
	puttextcentered(autores3,k+m+2,GOTHIC_FONT,2);
	puttextcentered(apresentam,150,TRIPLEX_FONT,3);
	wait_key();
	cleardevice();
	setcolor(2);
	puttextcentered(atacc,20, TRIPLEX_FONT, 5);
	i=textheight("H");
	line(10,i+23,300,i+23);
	line(10,i+26,300,i+26);
	settextstyle(DEFAULT_FONT,0,1);
	k=textheight("H");
	setcolor(3);
	outtextxy(5,80,direitos);
	outtextxy(5,82+k,direitos2);
	outtextxy(5,84+(k<<1),direitos3);
	puttextcentered(pressione,150,DEFAULT_FONT,1);
	wait_key();
	cleardevice();

}

void instructions() {
	puttextcentered(pers,10,DEFAULT_FONT,1);

	putimage(10,40,&buffer[SHIP],COPY_PUT);
	outtextxy(40,40,nave);

	putimage(10,60,&buffer[ENEMY],COPY_PUT);
	outtextxy(40,60,inimigo);

	putimage(10,80,&buffer[POWERUP],COPY_PUT);
	outtextxy(40,85,powerup);

	putimage(10,100,&buffer[ONEUP],COPY_PUT);
	outtextxy(40,105,extra_life);

	putimage(10,120,&buffer[BONUS],COPY_PUT);
	outtextxy(40,125,bonus);

	puttextcentered(press2, 160, SANS_SERIF_FONT, 1);

	wait_key();
	cleardevice();
}

int velocity;
int difficulty;

int velos[] = {60,30,10};

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

struct textsettingstype tset;

void story() {
	cleardevice();
	gettextsettings(&tset);
	setcolor(1);
	settextjustify(CENTER_TEXT,BOTTOM_TEXT);
	settextstyle(DEFAULT_FONT,0,1);
	outtextxy(160,10,instrucoes);
	settextjustify(LEFT_TEXT,BOTTOM_TEXT);
	outtextxy(2,20, instr01);
	outtextxy(2,28, instr02);
	outtextxy(2,36, instr03);
	outtextxy(2,44, instr04);
	outtextxy(2,52, instr05);
	outtextxy(2,60, instr06);
	outtextxy(2,68, instr07);
	outtextxy(2,76, instr08);
	outtextxy(2,84, instr09);
	outtextxy(2,92, instr10);
	outtextxy(2,100, instr11);
	outtextxy(2,108, instr12);
	outtextxy(2,116, instr13);
	outtextxy(2,124, instr14);
	outtextxy(2,132, instr15);
	outtextxy(2,140, instr16);
	outtextxy(2,148, instr17);
	outtextxy(42,156, instr18);
	settextjustify(CENTER_TEXT,BOTTOM_TEXT);
	outtextxy(160,170,instr19);	
	wait_key();
	settextjustify(tset.horiz, tset.vert);

}

void hud() {
	cleardevice();
	setfillstyle(SOLID_FILL,2);
	bar(0,0,319,199);
	setfillstyle(SOLID_FILL,0);
	bar(10,10,240,160);
	setcolor(0);
	settextstyle(TRIPLEX_FONT,1,2);
	outtextxy(270,0,etelg);
	settextstyle(GOTHIC_FONT,1,2);
	outtextxy(290,0,anos30);
	settextstyle(DEFAULT_FONT,0,1);
	outtextxy(20,180,lScore);
	outtextxy(20,191,lRecord);
	wait_key();	
}

int check_collision() {
	int i;
	i = enemy_y;
	if ((dr_bonus != 0) && (bonus_y < enemy_y) &&  (bonus_y < pup_y)  && (bonus_y < oneup_y)) { 
		i = bonus_y;
	}

	if ((dr_powerup != 0) && (pup_y < enemy_y) &&  (pup_y < bonus_y)  && (pup_y < oneup_y)) { 
		i = pup_y;
	}

	if ((dr_oneup != 0) && (oneup_y < enemy_y) &&  (oneup_y < pup_y)  && (oneup_y < bonus_y)) { 
		i = oneup_y;
	}

	return i;
}

int shoot() {
	int sx, d[4];
	int ex, e[4];
	int i,j;
	int ret = 0;
	float fx, gx;
	sx = ship_x + 8;
	ex = ship_x + 3;
	fx = sx;
	gx = ex;
	d[0] = abs(fx - (enemy_x + 8.0));
	d[1] = abs(sx - (pup_x + 8));
	d[2] = abs(sx - (oneup_x + 8));
	d[3] = 	abs(sx - (bonus_x + 8));

	e[0] = abs(gx - (enemy_x + 8.0));
	e[1] = abs(ex - (pup_x + 8));
	e[2] = abs(ex - (oneup_x + 8));
	e[3] = abs(ex - (bonus_x + 8));

	j = check_collision();

	if (draw_laser(ship_x + 7, 144, j, -1, 1) != 0) {
		for(i=0;i<4;i++) {
			if (d[i] <= 8) {
				ret = i + 1;
				break;
			} 
		}
	} else {
		ret = 0;
	}
	return ret;
}

int dr_oneup, dr_bonus, dr_powerup, v5a, v1c;
int lives, score_changed, hit_ship;
float score, record;

int enemy_center, e_y, pup_x, oneup_x, bonus_x;
int enemy_count, hit_enemy;
float enemy_x, pup_y, oneup_y, bonus_y;
float enemy_y;



void main(int argc, char **argv) {
	int g1, g2;
	int i;
	char c;
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
	instructions();
	speed();
	story();
	hud();

	dr_oneup = dr_bonus = dr_powerup = enemy_count = v1c = 0;
	hit_ship = 0;
	v4 = 0;
	powered_up = 0;
	hit_enemy = 0;
	ship_x = 152;
	putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
	lives = 5;
	setfillstyle(SOLID_FILL, 2);
	score = 0;
	do {
		srand(time(0));
		enemy_center = (rand() % 214) + 10;
		hit_enemy = 0;
		i=rand() % 1000;
		if (i < (100 / (difficulty + 1))) {
			if ((dr_powerup == 0) && (dr_bonus == 0) && (dr_oneup == 0)) {
				dr_oneup = 1;
				oneup_y = 14.0;
				do {
					oneup_x = (rand() % 214) + 10;
				} while (oneup_x == enemy_center);
			}
		}
	
		i=rand() % 1000;
		if (i < (200 / (difficulty + 1))) {
			if ((dr_powerup == 0) && (dr_bonus == 0) && (dr_oneup == 0)) {
				dr_powerup = 1;
				pup_y = 14.0;
				do {
					pup_x = (rand() % 214) + 10;
				} while (pup_x == enemy_center);
			}
		}

		i=rand() % 1000;
		if (i < (200 / (difficulty + 1))) {
			if ((dr_powerup == 0) && (dr_bonus == 0) && (dr_oneup == 0)) {
				dr_bonus = 1;
				bonus_y = 14.0;
				do {
					bonus_x = (rand() % 214) + 10;
				} while (bonus_x == enemy_center);
			}
		}
		for(enemy_y = 10.0; enemy_y <= 128.0 && hit_enemy == 0; enemy_y += 1.0) {
			e_y = enemy_y;
			if (e_y > 10) {
				putimage((int)enemy_x, e_y - 1, &buffer[ENEMY], XOR_PUT);
			}
			enemy_x = cos(enemy_y * 4.0 / DEG_TO_RAD) * 20 + enemy_center;
			if (enemy_x < 11.0) {
				enemy_x = 11.0;
			}		
			if (enemy_x > 224.0) {
				enemy_x = 224.0;
			}
			putimage(enemy_x, e_y, &buffer[ENEMY], XOR_PUT);
			if ((difficulty != 0) && ((rand() % 1000) < 50) && (e_y <= 112)) {
				int t, j;
				t = powered_up;
				powered_up = 0;
				j = draw_laser(enemy_x + 7.0, e_y + 10, 150, 1, 1);
				powered_up = t;
				if ((j != 0) && (abs(ship_x - enemy_x) < 8)) {
					circ_explosion(ship_x + 8, 152);
					lives--;
					ship_x = 152;
					if (lives != 0){
						putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
					}
				}
			}
			
			if ((dr_oneup == 1) && (oneup_y < 128.0)) {
				if (oneup_y > 14.0) {
					putimage(oneup_x, oneup_y, &buffer[ONEUP], XOR_PUT);
				}
				oneup_y += 1.0;
				putimage(oneup_x, oneup_y, &buffer[ONEUP], XOR_PUT);
			}
			if ((dr_oneup == 1) && (oneup_y >= 128.0)) {
				dr_oneup = 0;
				putimage(oneup_x, oneup_y, &buffer[ONEUP], XOR_PUT);
				oneup_y = 14.0;		
			}

			if ((dr_powerup == 1) && (pup_y < 128.0)) {
				if (pup_y > 14.0) {
					putimage(pup_x, pup_y, &buffer[POWERUP], XOR_PUT);
				}
				pup_y += 1.0;
				putimage(pup_x, pup_y, &buffer[POWERUP], XOR_PUT);
			}
			if ((dr_powerup == 1) && (pup_y >= 128.0)) {
				dr_powerup = 0;
				putimage(pup_x, pup_y, &buffer[POWERUP], XOR_PUT);
				pup_y = 14.0;		
			}

			if ((dr_bonus == 1) && (bonus_y < 128.0)) {
				if (bonus_y > 14.0) {
					putimage(bonus_x, bonus_y, &buffer[BONUS], XOR_PUT);
				}
				bonus_y += 1.0;
				putimage(bonus_x, bonus_y, &buffer[BONUS], XOR_PUT);
			}
			if ((dr_bonus == 1) && (bonus_y >= 128.0)) {
				dr_bonus = 0;
				putimage(bonus_x, bonus_y, &buffer[BONUS], XOR_PUT);
				bonus_y = 14.0;		
			}
			c=peekb(0x0040,0x0017) & 0x0f;
			if (c == 2) {
				if (ship_x > 10) {
					putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
					ship_x--;
					putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
				}
			} else if (c == 1) {
				if (ship_x < 224) {
					putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
					ship_x++;
					putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
				}
			} 
			score_changed = 0;
			if ((c & 8) != 0) {
				switch(shoot()) {
					case 0: 
						score_changed = 1;
						circ_explosion(enemy_x + 8.0, enemy_y + 8);

					break;
					case 1:

					break;

					case 2:

					break;

					case 3:

					break;
					default:
				}
			}
			if (lives > 5) {
				lives = 5;
			}
			bar(170, 162, 260, 178);
			for(i=0;i<lives;i++) {
				putimage(i * 16 + 170, 162, &buffer[ONEUP], COPY_PUT);
			}
			if (score_changed != 0) {

			}
			delay(velocity);
			enemy_y += 1.0;
		}
		if (hit_enemy == 0) {
			powered_up = 0;
			lives--;
			putimage(enemy_x, 128, &buffer[ENEMY], XOR_PUT);
		} 
	} while ((lives > 0) && (enemy_count < 50));
	/* END */
}
