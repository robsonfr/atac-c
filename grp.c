#include "structs.h"
#include <graphics.h>

void grp_draw_image(TImage *img, int newX, float newY) {
    if ((img->x != newX) || (img->y != newY)) {
        putimage(img->x,img->y, img->image, XOR_PUT);
        img->x = newX;
        img->y = newY;
        putimage(img->x,img->y, img->image, XOR_PUT);
    }
}
