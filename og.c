#define SDL_MAIN_HANDLED

#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <dos.h>
#include "og.h"
#include "ui.h"
#include "intro.h"
#include "consts.h"
#include "game.h"

int main(int argc, char **argv) {
	int i;
	int do_intro;
	init_consts();
	//do_loop = 0;
	do_intro = 0;

	if (argc > 1) {

		for(i=1;i<argc;i++) {
			if (strcmp(argv[i],"-s") == 0) {
				do_intro = 0;
			}
			/*if (strcmp(argv[i],"-l") == 0) {
				do_loop = 1;
			}*/
		}
	}
	init();
	if (do_intro == 0) {
		intro();
		outro();
		instructions();
	}
    loop();
	closegraph();
	exit(0);
}
