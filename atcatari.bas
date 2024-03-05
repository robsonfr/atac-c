
 rem ** atac atari
 rem ** por Robson Franca
 rem ** vamos ver como fica
 rem ** vamos fazer o contorno do logo usando o play field
 set romsize 32kSC
 set tv ntsc
 set kernel_options no_blank_lines
 set smartbranching on

   const noscore = 1
   const pfres=32
   const pfrowheight=2



 playfield:
 ..........
 ....XX....
 ...XXXX...
 ...XXXX...
 .XXXXXXXX.
 .XX.XX.XX.
 ..XX..XX..
 ...XXXX...
 ..X....X..
 .X......X.
 .X......X.
 .X......X.
 .XX....XX.
 .XX....XX.
 .XX....XX.
 .XX....XX.
 .XX....XX.
 .X.X..X.X.
 XX.X..X.XX
 XX.X..X.XX
 X..X..X..X
 X..X..X..X
 X..X..X..X
 X..X..X..X
 X..X..X..X
 X...XX...X
 X...XX...X
 X...XX...X
 X...XX...X
 X..X..X..X
 X.X....X.X
 X........X
 X..X..X..X
 X..X..X..X
 X...XX...X
 X...XX...X
 X...XX...X
 X...XX...X
 X..X..X..X
 X.X....X.X
 X........X
end



  
  COLUPF=$F0
  COLUBK=$2A

mainloop
  drawscreen
 goto mainloop

