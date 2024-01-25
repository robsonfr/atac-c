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


int velocity;
int difficulty;

int velos[3];

void init_consts();

#endif
