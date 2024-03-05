@echo off
dasm "atacatari.asm" -I"%bB%"/includes -f3 -l"atacatari.lst" -o"atacatari.bin" 
d:\emu\stella\stella.exe atacatari.bin