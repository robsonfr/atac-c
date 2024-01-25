#include <SDL2/SDL.h>
#include <graphics.h>
#include "input.h"

void wait_key() {
	int code;
	code = getch();
	if (code == 0) {
		code = getch();
	}
	if (code == 27) {
		closegraph();
		exit(0);
	}
}


void eventos() {
  SDL_Event evento;
  teclas[0] = 0;
  teclas[1] = 0;
  teclas[2] = 0;
  while(SDL_PollEvent(&evento)) {
    int t;
    t = -1;
    if ((evento.type == SDL_KEYDOWN) || (evento.type == SDL_KEYUP)) {
        switch (evento.key.keysym.scancode) {
        case SDL_SCANCODE_LSHIFT:
            t = 0;
            break;
        case SDL_SCANCODE_RSHIFT:
            t = 1;
            break;
        case SDL_SCANCODE_SPACE:
            t = 2;
            break;
        default:
            t = -1;
        }
    }
    if (t != -1) {
        teclas[t] = (evento.type == SDL_KEYDOWN ? 1 : 0);
    }
  }
}

int get_key() {
    if (event() && eventtype() == SDL_KEYDOWN) {
        return lastkey();
    }
    return 0;
}

int get_shift_keys() {
    return 0;
}

