import PIL.Image as Image
import sys

figura=Image.open(sys.argv[1])
print("playfield: ")
cores = [None, None]
for y in range(figura.size[1]):
    print("   ", end="")
    for x in range(figura.size[0]):
        c = figura.getpixel((x,y))
        if cores[0] == None:
            cores[0] = c
        else:
            if cores[0] != c:
                cores[1] = c        
        p = "X" if c == cores[1] else "."
        print(p, end=" ")
    print("")
print("end")
