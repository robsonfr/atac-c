#include "structs.h"

void clear_flags(TSprite **spr, int qtd) {
    for(int i=0;i<qtd;spr[i++]->flag = 0);
}

int test_all_flags_false(TSprite **spr, int qtd) {
    for(int i=0;i<qtd;i++) {
        if (spr[i]->flag) {
            return 0;
        }
    }
    return 1;
}
