#ifndef __STRUCTS_H__

#define __STRUCTS_H__

typedef struct {
    char flag;
    int x;
    float y;
    int chance;
    int score;
    int lives;
    char powerup;
    void *image;
} TSprite;


typedef struct {
    void *image;
    int x;
    float y;
    int old_x;
    float old_y;
} TImage;

void clear_flags(TSprite **spr, int qtd);
int test_all_flags_false(TSprite **spr, int qtd);

#endif // __STRUCTS_H__
