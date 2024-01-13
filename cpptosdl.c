#include<graphics.h>
#include<stdio.h>


#define NEARW(n) ((n >> 2) + (n & 3 != 0 ? 1 : 0))

void outputint(short num, FILE *o) {
    int value;
    value = num;
    fwrite(&value,sizeof(int),1,o);
}

int main(int argc, char **argv) {
    FILE *inp, *out, *o2;
    unsigned char dados[1600];
    unsigned char *saida;
    char numero[2];
    unsigned char byt;
    short larg, alt;
    int tam,p,q;
    int w,h;
    int g1,g2,i,f;
    int x,y,xx;
    unsigned int l,ll;
    g1=CGA;
    g2=CGAC0;
    initgraph(&g1,&g2,NULL);
    cleardevice();

    if (argc == 3) {
        inp = fopen(argv[1],"rb");
        out = fopen(argv[2],"wb");
        o2 = fopen("indices.txt","wt");
        tam = 399;
        tam = fread(dados, 1, tam, inp);
        fclose(inp);
        q=0;
        xx = 0;
        l=0;
        ll=0;
        for(p=0;p<tam;p++) {
            switch(q) {
            case 0:
                larg = dados[p] + (((int) dados[++p]) << 8);
                q = 1;
                break;
            case 1:
                alt = dados[p] + (((int) dados[++p]) << 8);
                q = 2;
                p += 3;
                break;
            case 2:
                fprintf(o2,"LARG %d\n", larg);
                fprintf(o2,"ALT %d\n", alt);
                q = 3;
                break;
            case 3:
                w = NEARW(larg);
                for(y=0;y<alt;y++) {
                    for(x=0;x<w;x++) {
                        unsigned char v;
                        v = dados[p++];
                        for(i=0;i<4;i++) {
                            putpixel(xx+x*4+i,y,colors[(v >> 6) & 3]);
                            v <<= 2;
                        }
                    }
                }
                p += 1;
                l=imagesize(xx,y,xx+larg,y+alt);
                saida=malloc(l);
                getimage(xx,0,xx+larg,alt,saida);
                fwrite(saida,1,l,out);
                free(saida);
                fprintf(o2, "indice: %d\n", ll);
                ll += l;
                xx += 18;
                q = 0;
            }
        }
       // fwrite(dados,1,tam,out);
        fclose(o2);
        fclose(out);
    }
    getch();
    closegraph();
    return 0;
}

