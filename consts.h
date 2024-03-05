#include <graphics.h>

#ifndef __CONSTS_H__
#define __CONSTS_H__
int colors[4];

#define SHIP 0
#define ENEMY 1032
#define POWERUP 2064
#define ONEUP 3096
#define BONUS 4128

#define DEG_TO_RAD  57.29577951308232

int powered_up, ship_x;
int score, record;
char letra[4];
int velocity;
int difficulty;

int velos[3];

void init_consts();

unsigned char buffer[5160];

char strx[16];



char r_name[4];

char sscore[16];
char srec[16];

#endif
