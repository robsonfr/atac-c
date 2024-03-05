#include "structs.h"

#ifndef __GAME_H__
#define __GAME_H__

int dr_oneup, dr_bonus, dr_powerup;
int lives, score_changed, hit_ship;


int enemy_center, e_y, pup_x, oneup_x, bonus_x;
int enemy_count, hit_enemy, br_record;
float enemy_x, pup_y, oneup_y, bonus_y;
float enemy_y;


TSprite sprBonus, sprPowerup, sprOneup;
TSprite *sprites[3];

TImage imgShip, imgEnemy;

int loop();
void init();
#endif // __GAME_H__
