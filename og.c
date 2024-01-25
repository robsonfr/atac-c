#define SDL_MAIN_HANDLED

#include <SDL2/SDL.h>
#include <graphics.h>
#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <dos.h>
#include "og.h"
#include "ui.h"
#include "intro.h"
#include "input.h"
#include "sound.h"
#include "vfx.h"
#include "consts.h"





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
	d[2] = abs(sx - (bonus_x + 8));
	d[3] = 	abs(sx - (oneup_x + 8));

	e[0] = abs(gx - (enemy_x + 8.0));
	e[1] = abs(ex - (pup_x + 8));
	e[2] = abs(ex - (bonus_x + 8));
	e[3] = abs(ex - (oneup_x + 8));

	j = check_collision();

	if (draw_laser(ship_x + 7, 144, j, -1, 1) != 0) {
		for(i=0;i<4;i++) {
			if (d[i] <= 8) {
				ret = i + 1;
				break;
			}
			if (powered_up != 0) {
				if (e[i] <= 8) {
					ret = i + 1;
					break;
				}
			}
		}
	} else {
		ret = 0;
	}
	return ret;
}

int main(int argc, char **argv) {
	int g1, g2;
	int i;
	char c;
	int do_loop, do_intro;
	int state;
	state = 0;
	init_consts();
	FILE *arq;
	g1 = CGA;
	g2 = CGAC0;
	do_loop = 0;
	do_intro = 1;
	//printf(aguarde);
	arq = fopen("ATAC-C-SDL.BMP","rb");
	fread(buffer, 1, 5160, arq);
	fclose(arq);

	//printf("\n Carregamento concluido");
	//printf("\n Aperte qualquer tecla para iniciar");
	//wait_key();
	setwinoptions("ATAC-C",-1,-1,SDL_WINDOW_FULLSCREEN);
	initwindow(320,200);
	initgraph(&g1,&g2,NULL);
	cleardevice();

	if (argc > 1) {

		for(i=1;i<argc;i++) {
			if (strcmp(argv[i],"-s") == 0) {
				do_intro = 0;
			}
			if (strcmp(argv[i],"-l") == 0) {
				do_loop = 1;
			}
		}
	}
	if (do_intro == 1) {
		intro();
		outro();
		instructions();
	}
    srand(0);
	do {

		speed();
		story();
		//hud(etelg, anos30);
		hud();

		dr_oneup = dr_bonus = dr_powerup = enemy_count = 0;
		hit_ship = 0;
		powered_up = 0;
		hit_enemy = 0;
		ship_x = 152;
		score = 0;
		putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
		lives = 5;
		setfillstyle(SOLID_FILL, 2);
		br_record = 0;
		do {
            if (state == 0) {
                hit_enemy = 0;
                enemy_center = (rand() % 214) + 10;
                state = 1;

                // Oneup
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

                // Powerup
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

                // Bonus
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
                enemy_x = 0.0;
                enemy_y = 10.0;
			}

            eventos();
            if (get_key() == KEY_ESC) {
                goto the_end;
            }
			if (state == 1) {
                enemy_y += 1.0;
                if ((enemy_y > 128.0) || (hit_enemy)) {
                    state = 2;
                }
                e_y = (int)enemy_y;
                if (e_y > 10) {
                    putimage((int)enemy_x, e_y - 1, &buffer[ENEMY], XOR_PUT);
                }
                enemy_x = cos(enemy_y * 4.0 / DEG_TO_RAD) * 20.0 + enemy_center;
                if (enemy_x < 11.0) {
                    enemy_x = 11.0;
                }
                if (enemy_x > 224.0) {
                    enemy_x = 224.0;
                }
                putimage((int)enemy_x, e_y, &buffer[ENEMY], XOR_PUT);

                // Enemy shoot
                if ((difficulty != 0) && ((rand() % 1000) < 50) && (e_y <= 112)) {
                    int t, j;
                    t = powered_up;
                    powered_up = 0;
                    j = draw_laser(enemy_x + 7.0, e_y + 10, 150, 1, 1);
                    powered_up = t;
                    if ((j != 0) && (abs((int)(ship_x - enemy_x)) < 8)) {
                        circ_explosion(ship_x + 8, 152);
                        lives--;
                        ship_x = 152;
                        if (lives != 0){
                            putimage(ship_x, 144, &buffer[SHIP], XOR_PUT);
                        }
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
            c=0;
            if (teclas[0] == 1) {
                c = 2;
            }
            if (teclas[1] == 1) {
                c = 1;
            }
            //c=peekb(0x0040,0x0017) & 0x0f;
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
            score_changed = 1;
            if (teclas[2] == 1) {
                int d = shoot() - 1;
                switch(d) {
                    case 0: /* Enemy */
                        score_changed = 1;
                        circ_explosion(enemy_x + 8.0, enemy_y + 8);
                        score += 100;
                        enemy_count++;
                        hit_enemy = 1;
                        state = 0;
                        break;

                    case 1: /* Powerup */
                        if (dr_powerup == 1) {
                            score_changed = 1;
                            circ_explosion(pup_x + 8, pup_y + 8);
                            score += 50;
                            powered_up = 1;
                            dr_powerup = 0;
                        }
                        break;

                    case 2:
                        if (dr_bonus == 1) {
                            score_changed = 1;
                            circ_explosion(bonus_x + 8, bonus_y + 8);
                            dr_bonus = 0;
                            score += 1000;
                        }
                        break;

                    case 3:
                        if (dr_oneup == 1) {
                            score_changed = 1;
                            circ_explosion(oneup_x + 8, oneup_y + 8);
                            dr_oneup = 0;
                            score += 500;
                            lives += 3;
                        }
                    break;
                }
            }
            /*if (lives > 5) {
                lives = 5;
            }*/
            setfillstyle(SOLID_FILL, colors[2]);
            bar(170, 162, 260, 178);
            for(i=0;i<lives && i <5;i++) {
                putimage(i * 16 + 170, 162, &buffer[ONEUP], 2);
            }
            if (score_changed != 0) {
                if (score > record) {
                    bar(190, 191, 218, 199);
                    br_record = 1;
                    record = score;
                    r_name[0] = 'H';
                    r_name[1] = 'I';
                    r_name[2] = ' ';
                    r_name[3] = 0;
                }
                setcolor(colors[(powered_up & 1) * 2 + 1]);
                outtextxy(190,191,r_name);
                snprintf(sscore,8,"%07d",score);
                bar(100,180,180,190);
                setcolor(colors[0]);
                outtextxy(100,180,sscore);
                bar(100,191,180,199);
                snprintf(srec,8,"%07d", record);
                outtextxy(100,191,srec);
            }
            delay(velocity);

			if ((hit_enemy == 0) && (state == 2)) {
				powered_up = 0;
				lives--;
				putimage(enemy_x, 128, &buffer[ENEMY], XOR_PUT);
				state = 0;
			}
			if (get_key() == KEY_ESC) {
                goto the_end;
			}
		} while ((lives > 0) && (enemy_count < 50));
		/* END */
		gettextsettings(&tset);
		settextjustify(1,1);
		setcolor(colors[2]);
		settextstyle(1,0,4);
		if (enemy_count == 50) {
			outtextxy(0x7D, 0x4B, "PARABENS !");
		} else {
			outtextxy(0x7D,0x4B,"GAME OVER");
		}
		settextjustify(tset.horiz, tset.vert);
		settextstyle(0,0,1);
		if (br_record != 0) {
			outtextxy(24, 136, "Entre seu nome :");
			printf("\x1B[18;20f");
			gets(letra);
			for(i=0;i<3;i++) {
				r_name[i]=letra[i];
			}
		}
		setcolor(colors[1]);
		puttextcentered("Aperte qualquer tecla para recomecar...",150,2,3);
		wait_key();
	} while (do_loop == 1);
the_end:
	closegraph();
	exit(0);
}
