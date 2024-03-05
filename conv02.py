import PIL.Image as Image
import sys

figura=Image.open(sys.argv[1])
cores = [None, None]
pf = [[4,5,6,7],[7,6,5,4,3,2,1,0],[0,1,2,3,4,5,6,7]]
for y in range(figura.size[1]):
    d,e,f=0,0,0
    s=""
    for x in range(figura.size[0]):
        g = len(pf[d])
        c = figura.getpixel((x,y))
        if cores[0] == None:
            cores[0] = c
        else:
            if cores[0] != c:
                cores[1] = c        
        if c != cores[0]:
            f += (1 << pf[d][e])
            s = s + "X"
        else:
            s = s + "."
        e += 1
        if e == len(pf[d]):
            print (f"   ldx #${f:02X}")
            print (f"   stx PF{d}")
            e = 0
            d += 1
            f = 0
    if e > 0:
        print (f"   ldx #${f:02X}")
        print (f"   stx PF{d}")
    print("   sta WSYNC ",end="")
    print(f";{s}")
    print("   sta WSYNC")
    print("   sta WSYNC")
    print("   sta WSYNC")
