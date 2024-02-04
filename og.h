#include "structs.h"


void level();



char strx[16];



char *r_name = "ROB";

char sscore[16];
char srec[16];

int handle;

int dr_oneup, dr_bonus, dr_powerup;
int lives, score_changed, hit_ship;
int score, record = 5000;

int enemy_center, e_y, pup_x, oneup_x, bonus_x;
int enemy_count, hit_enemy, br_record;
float enemy_x, pup_y, oneup_y, bonus_y;
float enemy_y;


char *letra = "   ";

TSprite sprBonus, sprPowerup, sprOneup;
TSprite *sprites[3];

TImage imgShip, imgEnemy;
