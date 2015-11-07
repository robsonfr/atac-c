;;; Segment Image base (0800:0000)

fn0800_0000()
	mov	dx,13FD
	mov	cs:[0205],dx
	mov	ah,30
	int	21
	mov	bp,[0002]
	mov	bx,[002C]
	mov	ds,dx
	mov	[0092],ax
	mov	[0090],es
	mov	[008C],bx
	mov	[00AC],bp
	mov	word ptr [0096],FFFF
	call	016D
	les	di,[008A]
	mov	ax,di
	mov	bx,ax
	mov	cx,7FFF

l0800_0039:
	cmp	word ptr es:[di],3738
	jnz	0059

l0800_0040:
	mov	dx,es:[di+02]
	cmp	dl,3D
	jnz	0059

l0800_0049:
	and	dh,DF
	inc	word ptr [0096]
	cmp	dh,59
	jnz	0059

l0800_0055:
	inc	word ptr [0096]

l0800_0059:
	repne	
	scasb	

l0800_005B:
	jcxz	00BE

l0800_005D:
	inc	bx
	cmp	es:[di],al
	jnz	0039

l0800_0063:
	or	ch,80
	neg	cx
	mov	[008A],cx
	mov	cx,0001
	shl	bx,cl
	add	bx,08
	and	bx,F8
	mov	[008E],bx
	mov	dx,ds
	sub	bp,dx
	mov	di,[10E2]
	cmp	di,0200
	jnc	0090

l0800_0089:
	mov	di,0200
	mov	[10E2],di

l0800_0090:
	add	di,7A0E
	jc	00BE

l0800_0096:
	add	di,[10E0]
	jc	00BE

l0800_009C:
	mov	cl,04
	shr	di,cl
	inc	di
	cmp	bp,di
	jc	00BE

l0800_00A5:
	cmp	word ptr [10E2],00
	jz	00B3

l0800_00AC:
	cmp	word ptr [10E0],00
	jnz	00C1

l0800_00B3:
	mov	di,1000
	cmp	bp,di
	ja	00C1

l0800_00BA:
	mov	di,bp
	jmp	00C1

l0800_00BE:
	jmp	01ED

l0800_00C1:
	mov	bx,di
	add	bx,dx
	mov	[00A4],bx
	mov	[00A8],bx
	mov	ax,[0090]
	sub	bx,ax
	mov	es,ax
	mov	ah,4A
	push	di
	int	21
	pop	di
	shl	di,cl
	cli	
	mov	ss,dx
	mov	sp,di
	sti	
	xor	ax,ax
	mov	es,cs:[0205]
	mov	di,1490
	mov	cx,7A0E
	sub	cx,di

l0800_00F1:
	rep	
	stosb	

l0800_00F3:
	push	cs
	call	word ptr [146A]
	call	far 0800:41F8
	call	far 0800:42EA
	mov	ah,00
	int	1A
	mov	[0098],dx
	mov	[009A],cx
	push	cs
	call	word ptr [146E]
	push	word ptr [0088]
	push	word ptr [0086]
	push	word ptr [0084]
	call	far 0C56:0006
	push	ax
	call	far 118C:000A

fn0800_012A()
	mov	ds,cs:[0205]
	call	far 0800:01B0
	push	cs
	call	word ptr [146C]
	xor	ax,ax
	mov	si,ax
	mov	cx,002F
	nop	
	cld	

l0800_0142:
	add	al,[si]
	adc	ah,00
	inc	si
	loop	0142

l0800_014A:
	sub	ax,0D37
	nop	
	jz	015A

l0800_0150:
	mov	cx,0019
	nop	
	mov	dx,002F
	call	01E5

l0800_015A:
	mov	bp,sp
	mov	ah,4C
	mov	al,[bp+04]
	int	21
0800:0163          B9 0E 00 90 BA 48 00 E9 87 00             .....H....  

fn0800_016D()
	push	ds
	mov	ax,3500
	int	21
	mov	[0074],bx
	mov	[0076],es
	mov	ax,3504
	int	21
	mov	[0078],bx
	mov	[007A],es
	mov	ax,3505
	int	21
	mov	[007C],bx
	mov	[007E],es
	mov	ax,3506
	int	21
	mov	[0080],bx
	mov	[0082],es
	mov	ax,2500
	mov	dx,cs
	mov	ds,dx
	mov	dx,0163
	int	21
	pop	ds
	ret	

fn0800_01B0()
	push	ds
	mov	ax,2500
	lds	dx,[0074]
	int	21
	pop	ds
	push	ds
	mov	ax,2504
	lds	dx,[0078]
	int	21
	pop	ds
	push	ds
	mov	ax,2505
	lds	dx,[007C]
	int	21
	pop	ds
	push	ds
	mov	ax,2506
	lds	dx,[0080]
	int	21
	pop	ds
	retf	
0800:01DD                                        C7 06 96              ...
0800:01E0 00 00 00 CB CB                                  .....          

fn0800_01E5()
	mov	ah,40
	mov	bx,0002
	int	21
	ret	

fn0800_01ED()
	mov	cx,001E
	nop	
	mov	dx,0056
	mov	ds,cs:[0205]
	call	01E5
	mov	ax,0003
	push	ax
	call	far 0800:012A
	add	[bx+si],al
	push	bp
	mov	bp,sp
	sub	sp,02
	push	sp
	pop	ax
	cmp	ax,sp
	jnz	0246

l0800_0213:
	int	11
	and	ax,0002
	jz	027E

l0800_021A:
	xor	ax,ax
	out	F0,al
	illegal	
	wait	
	fld1	
	wait	
	fldz	
	wait	
	fdivp	st(1),st(0)
	wait	
	fld	st(0)
	wait	
	fchs	
	wait	
	fcompp	
	wait	
	fstsw	word ptr [bp-02]
	mov	ax,[bp-02]
	sahf	
	jnz	0241
	mov	ax,0002
	jmp	027E
	mov	ax,0003
	jmp	027E

l0800_0246:
	xor	ax,ax
	out	F0,al
	illegal	
	mov	word ptr [bp-02],0000
	fstcw	word ptr [bp-02]
	mov	cx,0014
	loop	0257
	mov	ax,[bp-02]
	and	ax,0F3F
	cmp	ax,033F
	mov	ax,0000
	jnz	027E
	mov	word ptr [bp-02],FFFF
	fstsw	word ptr [bp-02]
	mov	cx,0014
	loop	0272
	test	word ptr [bp-02],B8BF
	jnz	027E
	mov	ax,0001

l0800_027E:
	mov	sp,bp
	pop	bp
	ret	
0800:0282       00 00 00 00 00 00 00 00 00 00 00 00 00 00   ..............
0800:0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:02B0 00 00 50 32 C0 E6 F0 B0 20 E6 A0 E6 20 58 CD 02 ..P2.... ... X..
0800:02C0 CF 57 06 9A DC 05 00 08 B8 34 35 B9 0B 00 BF 82 .W.......45.....
0800:02D0 02 CD 21 2E 89 1D 2E 8C 45 02 83 C7 04 40 E2 F1 ..!.....E....@..
0800:02E0 B8 75 35 CD 21 2E 89 1D 2E 8C 45 02 07 5F 83 3E .u5.!.....E.._.>
0800:02F0 96 00 FF 75 06 E8 0F FF A3 96 00 1E 55 8B EC 83 ...u........U...
0800:0300 EC 08 B8 FD 13 8E D8 8B D8 83 3E 96 00 00 C7 46 ..........>....F
0800:0310 FC EB 02 C7 46 FE A3 10 C7 46 F8 6B 03 C7 46 FA ....F....F.k..F.
0800:0320 A3 10 75 14 C7 46 FC A7 20 C7 46 FE 43 0E C7 46 ..u..F.. .F.C..F
0800:0330 F8 77 1D C7 46 FA 43 0E B8 34 25 B9 0A 00 C5 56 .w..F.C..4%....V
0800:0340 FC CD 21 40 E2 FB B8 3E 25 C5 56 F8 CD 21 8E DB ..!@...>%.V..!..
0800:0350 83 3E 96 00 00 74 19 A1 92 00 86 E0 3D 10 03 7C .>...t......=..|
0800:0360 0F 3D 00 0A 7D 0A B8 75 25 0E 1F BA B2 02 CD 21 .=..}..u%......!
0800:0370 CD 37 E3 C7 46 FE 30 13 CD 35 6E FE 8B E5 5D 1F .7..F.0..5n...].
0800:0380 CB 9A F7 05 00 08 1E B8 34 25 BB 82 02 B9 0B 00 ........4%......
0800:0390 2E C5 17 CD 21 83 C3 04 40 E2 F5 B8 75 25 2E C5 ....!...@...u%..
0800:03A0 17 CD 21 1F CB E8 A8 01 FB 51 06 53 BB 10 08 8B ..!......Q.S....
0800:03B0 4C 0A 89 4F 06 8B 4C 0C 89 4F 08 8B 4C 06 89 4F L..O..L..O..L..O
0800:03C0 0A 8B 4C 08 89 4F 0C 81 67 0C 00 F0 80 E5 07 80 ..L..O..g.......
0800:03D0 CD D8 89 4F 04 C7 47 02 01 00 8B 4C 08 80 E5 07 ...O..G....L....
0800:03E0 8B D9 80 E3 C0 80 FB C0 74 03 80 E1 38 83 3E 96 ........t...8.>.
0800:03F0 00 00 74 1D A8 05 74 05 E8 6F 01 EB 14 A8 02 74 ..t...t..o.....t
0800:0400 05 E8 3F 00 EB 31 A8 18 74 07 50 E8 84 01 58 EB ..?..1..t.P...X.
0800:0410 00 25 3D 00 74 21 52 33 D2 8B D8 42 D1 EB 73 FB .%=.t!R3...B..s.
0800:0420 89 16 10 08 C7 06 12 08 01 00 BE 10 08 56 9A 05 .............V..
0800:0430 00 E9 10 83 C4 02 5A 5B 07 59 5E 58 1F 0E E8 01 ......Z[.Y^X....
0800:0440 00 90 CF 83 3E 96 00 03 7D 72 E8 EC 00 8B C1 24 ....>...}r.....$
0800:0450 F8 81 F9 00 01 74 65 81 F9 00 05 74 5F 81 F9 28 .....te....t_..(
0800:0460 03 74 59 3D C0 01 74 54 3D E4 01 74 4F 3D 10 00 .tY=..tT=..tO=..
0800:0470 74 4A 3D 18 00 74 45 3D 10 04 74 40 3D 18 04 74 tJ=..tE=..t@=..t
0800:0480 3B 3D D0 00 74 36 3D D8 00 74 31 3D D9 06 74 2C ;=..t6=..t1=..t,
0800:0490 3D 10 06 74 27 3D 18 06 74 22 3D 10 02 74 1D 3D =..t'=..t"=..t.=
0800:04A0 18 02 74 18 C4 5C 0A 3D 30 00 75 11 E8 F5 00 CD ..t..\.=0.u.....
0800:04B0 3C D9 07 E8 26 00 CD 3A F9 E8 FD 00 C3 3D 30 04 <...&..:.....=0.
0800:04C0 75 13 E8 DF 00 50 CD 3C DD 07 E8 0F 00 CD 3A F9 u....P.<......:.
0800:04D0 58 E8 E5 00 C3 E8 92 00 E8 5E 00 C3 CD 35 E5 CD X........^...5..
0800:04E0 39 3E 04 08 CD 3D A1 04 08 25 00 47 A9 00 40 74 9>...=...%.G..@t
0800:04F0 06 A9 00 01 74 01 C3 A9 00 45 74 0D A9 00 40 75 ....t....Et...@u
0800:0500 01 C3 CD 39 D8 CD 35 EE C3 CD 37 3E 06 08 52 CD ...9..5...7>..R.
0800:0510 3B 2E 06 08 A1 0E 08 8B D0 81 E2 00 80 CD 37 3E ;.............7>
0800:0520 06 08 33 C2 CD 3D 03 06 0E 08 2D 3E 40 33 C2 A3 ..3..=....->@3..
0800:0530 0E 08 CD 37 2E 06 08 5A C3 51 50 B9 08 00 E8 9B ...7...Z.QP.....
0800:0540 FF 83 3E 96 00 00 74 05 CD 35 F7 E2 F1 58 59 C3 ..>...t..5...XY.
0800:0550 CD 37 E2 50 8A 04 8A 64 02 0C 40 22 E0 80 E4 7F .7.P...d..@"....
0800:0560 88 64 02 CD 35 24 58 CD 3D C3 80 FB C0 74 03 80 .d..5$X.=....t..
0800:0570 C9 07 80 CD D8 86 E9 89 0E 70 08 E8 BB FF E8 23 .........p.....#
0800:0580 00 1E C5 5C 0A 9A 6F 08 FD 13 1F E8 2B 00 E8 A8 ...\..o.....+...
0800:0590 FF C3 8B C1 25 F8 FF 25 D0 01 3D 10 01 74 01 C3 ....%..%..=..t..
0800:05A0 E8 C7 FF C3 CD 35 3E 04 08 CD 3D A1 04 08 83 0E .....5>...=.....
0800:05B0 04 08 3F CD 35 2E 04 08 C3 51 CD 35 34 CD 37 E2 ..?.5....Q.54.7.
0800:05C0 89 04 8A 64 02 8B C8 F6 D1 22 E9 80 E5 3F 2A E5 ...d....."...?*.
0800:05D0 88 64 02 CD 35 24 8A C5 2A E4 59 C3 B8 02 35 CD .d..5$..*.Y...5.
0800:05E0 21 8C 06 F4 07 89 1E F2 07 8C 0E 60 08 BA 1E 08 !..........`....
0800:05F0 B8 02 25 CD 21 F8 CB 1E C5 16 F2 07 B8 02 25 CD ..%.!.........%.
0800:0600 21 F8                                           !.             

fn0800_0602()
	pop	ds
	retf	

fn0800_0604()
	push	bp
	mov	bp,sp
	sub	sp,0C
	int	35
	jle	0602

l0800_060E:
	int	3D
	mov	ax,[bp-0C]
	or	ax,0C00
	mov	[bp-0A],ax

l0800_0619:
	int	35
	outsb	
	test	ch,3B
	jle	0619

l0800_0621:
	int	35
	outsb	
	hlt	
0800:0625                8B 56 FA 8B 46 F8 8B E5 5D CB 55      .V..F...].U
0800:0630 8B EC 56 57 8B 7E 04 BE 80 0D C6 06 80 0D 00 4E ..VW.~.........N
0800:0640 8B C7 BB 0A 00 33 D2 F7 F3 80 C2 30 88 14 8B C7 .....3.....0....
0800:0650 33 D2 F7 F3 8B F8 0B FF 75 E5 8B C6 5F 5E 5D C2 3.......u..._^].
0800:0660 02 00                                           ..             

fn0800_0662()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	lds	si,[bp+04]
	les	di,[bp+08]

l0800_066E:
	lodsb	
	stosb	
	and	al,al
	jnz	066E

l0800_0674:
	pop	ds
	mov	dx,[bp+0A]
	mov	ax,[bp+08]
	pop	di
	pop	si
	pop	bp
	ret	0008

fn0800_0681()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	cld	
	lds	si,[bp+0A]
	les	di,[bp+06]
	mov	cx,[bp+04]

l0800_0691:
	rep	
	cmpsb	

l0800_0693:
	mov	al,[si-01]
	sub	al,es:[di-01]
	cbw	
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	000A
0800:06A2       55 8B EC 56 C4 76 04 26 8A 04 0A C0 74 10   U..V.v.&....t.
0800:06B0 3C 61 72 09 3C 7A 7F 05 24 5F 26 88 04 46 EB E9 <ar.<z..$_&..F..
0800:06C0 5E 5D C2 04 00                                  ^]...          

fn0800_06C5()
	push	bp
	mov	bp,sp
	push	si
	push	di
	les	di,[bp+04]
	mov	cx,FFFF
	xor	al,al
	cld	

l0800_06D3:
	repne	
	scasb	

l0800_06D5:
	dec	di
	mov	ax,di
	mov	dx,es
	pop	di
	pop	si
	pop	bp
	ret	0004

fn0800_06E0()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	les	di,[bp+0C]
	lds	si,[bp+08]
	mov	ax,ds
	or	ax,si
	jz	06F9

l0800_06F2:
	lodsb	
	stosb	
	and	al,al
	jnz	06F2

l0800_06F8:
	dec	di

l0800_06F9:
	lds	si,[bp+04]

l0800_06FC:
	lodsb	
	stosb	
	and	al,al
	jnz	06FC

l0800_0702:
	dec	di
	pop	ds
	mov	ax,di
	mov	dx,es
	pop	di
	pop	si
	pop	bp
	ret	000C

fn0800_070E()
	push	bp
	mov	bp,sp
	push	ds
	lds	dx,[bp+04]
	mov	ah,09
	int	21
	pop	ds
	pop	bp
	ret	0004

fn0800_071E()
	mov	bx,[0D81]
	mov	ah,3E
	int	21
	ret	

fn0800_0727()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	lds	dx,[bp+0A]
	mov	ax,3D00
	int	21
	pop	ds
	jnc	073D

l0800_0738:
	mov	ax,FFFD
	jmp	0768

l0800_073D:
	mov	[0D81],ax
	mov	bx,ax
	xor	cx,cx
	xor	dx,dx
	mov	ax,4202
	int	21
	jc	075A

l0800_074D:
	and	ax,ax
	jz	075A

l0800_0751:
	and	dx,dx
	jnz	075A

l0800_0755:
	cmp	ax,7FFF
	jbe	0762

l0800_075A:
	call	071E
	mov	ax,[bp+04]
	jmp	0768

l0800_0762:
	les	di,[bp+06]
	stosw	
	xor	ax,ax

l0800_0768:
	pop	di
	pop	si
	pop	bp
	ret	000A

fn0800_076E()
	push	bp
	mov	bp,sp
	mov	bx,[0D81]
	xor	cx,cx
	mov	dx,[bp+0A]
	mov	ax,4200
	int	21
	jc	0797

l0800_0781:
	push	ds
	mov	bx,[0D81]
	mov	cx,[bp+08]
	lds	dx,[bp+04]
	mov	ah,3F
	int	21
	pop	ds
	jc	0797

l0800_0793:
	xor	ax,ax
	jmp	07A3

l0800_0797:
	call	071E
	mov	word ptr [0C24],FFF4
	mov	ax,0001

l0800_07A3:
	pop	bp
	ret	0008

fn0800_07A7()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	si
	push	di
	push	ds
	lds	si,[bp+08]
	les	di,[bp+04]
	mov	cx,[bp+0C]
	cld	

l0800_07B9:
	rep	
	movsb	

l0800_07BB:
	pop	ds
	pop	di
	pop	si
	pop	di
	pop	si
	pop	bp
	ret	
0800:07C2       55 8B EC 83 EC 08 1E B8 FD 13 8E D8 C7 46   U............F
0800:07D0 FE 00 00 C7 46 FC 00 00 8B 46 06 2D EE FF 3D 12 ....F....F.-..=.
0800:07E0 00 76 03 E9 FA 00 8B D8 D1 E3 2E FF A7 EF 07 D6 .v..............
0800:07F0 08 CC 08 C2 08 E0 08 B8 08 A6 08 9C 08 92 08 88 ................
0800:0800 08 7E 08 74 08 69 08 5E 08 53 08 40 08 36 08 2B .~.t.i.^.S.@.6.+
0800:0810 08 20 08 15 08 8C 5E FA C7 46 F8 17 0E E9 D8 00 . ....^..F......
0800:0820 8C 5E FA C7 46 F8 20 0E E9 CD 00 8C 5E FA C7 46 .^..F. .....^..F
0800:0830 F8 3D 0E E9 C2 00 8C 5E FA C7 46 F8 5C 0E EB 08 .=.....^..F.\...
0800:0840 8C 5E FA C7 46 F8 7B 0E 8C 5E FE C7 46 FC 1F 0A .^..F.{..^..F...
0800:0850 E9 A5 00 8C 5E FA C7 46 F8 98 0E E9 9A 00 8C 5E ....^..F.......^
0800:0860 FA C7 46 F8 B9 0E E9 8F 00 8C 5E FA C7 46 F8 D4 ..F.......^..F..
0800:0870 0E E9 84 00 8C 5E FA C7 46 F8 F0 0E EB 30 8C 5E .....^..F....0.^
0800:0880 FA C7 46 F8 06 0F EB 70 8C 5E FA C7 46 F8 25 0F ..F....p.^..F.%.
0800:0890 EB 66 8C 5E FA C7 46 F8 4F 0F EB 5C 8C 5E FA C7 .f.^..F.O..\.^..
0800:08A0 46 F8 5E 0F EB 52 8C 5E FA C7 46 F8 71 0F 8C 5E F.^..R.^..F.q..^
0800:08B0 FE C7 46 FC 16 0A EB 40 8C 5E FA C7 46 F8 85 0F ..F....@.^..F...
0800:08C0 EB 36 8C 5E FA C7 46 F8 99 0F EB 2C 8C 5E FA C7 .6.^..F....,.^..
0800:08D0 46 F8 B4 0F EB 22 8C 5E FA C7 46 F8 CE 0F EB 18 F....".^..F.....
0800:08E0 8C 5E FA C7 46 F8 EA 0F FF 76 06 E8 41 FD 8B D8 .^..F....v..A...
0800:08F0 1E 07 8C 46 FE 89 5E FC 8B 46 FC 0B 46 FE 74 25 ...F..^..F..F.t%
0800:0900 1E B8 83 0D 50 FF 76 FA FF 76 F8 FF 76 FE FF 76 ....P.v..v..v..v
0800:0910 FC E8 CC FD 52 50 1E B8 FB 0F 50 E8 44 FD B8 83 ....RP....P.D...
0800:0920 0D 8C DA EB 0E 1E B8 83 0D 50 FF 76 FA FF 76 F8 .........P.v..v.
0800:0930 E8 2F FD 1F 8B E5 5D CB 56 1E B8 FD 13 8E D8 8B ./....].V.......
0800:0940 36 24 0C C7 06 24 0C 00 00 8B C6 1F 5E CB       6$...$......^. 

fn0800_094E()
	cmp	word ptr [0C37],00
	jz	095F

l0800_0955:
	push	ds
	mov	ax,0FFD
	push	ax
	call	070E
	jmp	0967

l0800_095F:
	push	ds
	mov	ax,1024
	push	ax
	call	070E

l0800_0967:
	mov	ax,FFFF
	push	ax
	call	far 0800:4499
	pop	cx
	retf	

fn0800_0972()
	push	bp
	mov	bp,sp
	push	word ptr [bp+08]
	call	far 1314:000B
	pop	cx
	mov	cx,ax
	or	cx,dx
	jz	0992

l0800_0984:
	or	ax,ax
	jnz	0992

l0800_0988:
	mov	bx,ds
	cmp	bx,dx
	jnz	0992

l0800_098E:
	xor	cx,cx
	xor	dx,dx

l0800_0992:
	les	bx,[bp+04]
	mov	es:[bx],ax
	mov	es:[bx+02],dx
	mov	ax,0001
	jcxz	09A2

l0800_09A1:
	dec	ax

l0800_09A2:
	pop	bp
	ret	

fn0800_09A4()
	push	bp
	mov	bp,sp
	les	bx,[bp+04]
	mov	ax,es:[bx]
	or	ax,es:[bx+02]
	jz	09CA

l0800_09B3:
	cmp	word ptr [bp+08],00
	jz	09CA

l0800_09B9:
	push	word ptr [bp+08]
	push	word ptr es:[bx+02]
	push	word ptr es:[bx]
	call	far 1313:000D
	mov	sp,bp

l0800_09CA:
	les	bx,[bp+04]
	mov	word ptr es:[bx+02],0000
	mov	word ptr es:[bx],0000
	pop	bp
	ret	

fn0800_09DA()
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,[bp+0A]
	les	bx,[bp+06]
	add	si,es:[bx]
	mov	ax,si
	and	ax,000F
	sub	es:[bx],ax
	mov	dx,[bp+0C]
	mov	ax,si
	mov	cl,04
	shr	ax,cl
	add	dx,ax
	and	si,0F
	jz	0A0E

l0800_0A00:
	mov	cx,[bp+04]
	push	ds
	mov	ds,dx
	mov	es,dx
	xor	di,di
	cld	

l0800_0A0B:
	rep	
	movsb	

l0800_0A0D:
	pop	ds

l0800_0A0E:
	xor	ax,ax
	pop	di
	pop	si
	pop	bp
	ret	000A

fn0800_0A16()
	push	bp
	mov	bp,sp
	sub	sp,04
	push	si
	push	ds
	mov	ax,13FD
	mov	ds,ax
	les	bx,[bp+06]
	add	bx,0080
	mov	[bp-02],es
	mov	[bp-04],bx
	cmp	word ptr [0C37],03
	jnz	0A3A

l0800_0A37:
	jmp	0AC8

l0800_0A3A:
	mov	bx,[bp+06]
	cmp	word ptr es:[bx],6B70
	jz	0A4D

l0800_0A44:
	mov	ax,FFFC
	mov	[0C24],ax
	jmp	0ACE

l0800_0A4D:
	les	bx,[bp-04]
	cmp	byte ptr es:[bx+06],02
	jc	0A5E

l0800_0A57:
	cmp	byte ptr es:[bx+08],01
	jbe	0A66

l0800_0A5E:
	mov	ax,FFEE
	mov	[0C24],ax
	jmp	0ACE

l0800_0A66:
	xor	si,si
	jmp	0AC2

l0800_0A6A:
	mov	dx,[bp-02]
	mov	ax,[bp-04]
	add	ax,000B
	push	dx
	push	ax
	push	ds
	mov	ax,si
	mov	dx,001A
	mul	dx
	add	ax,0C7F
	push	ax
	mov	ax,0008
	push	ax
	call	0681
	or	ax,ax
	jnz	0AC1

l0800_0A8C:
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	word ptr [bp-02]
	push	word ptr [bp-04]
	les	bx,[bp-04]
	push	word ptr es:[bx+04]
	call	09DA
	push	dx
	push	ax
	mov	ax,si
	mov	dx,001A
	mul	dx
	mov	bx,ax
	pop	ax
	pop	dx
	mov	[bx+0C8E],dx
	mov	[bx+0C8C],ax
	mov	word ptr [0C24],0000
	mov	ax,si
	jmp	0ACE

l0800_0AC1:
	inc	si

l0800_0AC2:
	cmp	si,[0C74]
	jl	0A6A

l0800_0AC8:
	mov	ax,FFF5
	mov	[0C24],ax

l0800_0ACE:
	pop	ds
	pop	si
	mov	sp,bp
	pop	bp
	retf	

fn0800_0AD4()
	push	bp
	mov	bp,sp
	sub	sp,0E
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	les	bx,[bp+06]
	cmp	word ptr es:[bx],4B50
	jnz	0B0E

l0800_0AEC:
	les	di,[bp+06]
	mov	cx,FFFF
	mov	al,1A
	cld	

l0800_0AF5:
	repne	
	scasb	

l0800_0AF7:
	mov	[bp-0E],di
	mov	[bp-0C],es
	les	bx,[bp-0E]
	cmp	byte ptr es:[bx+08],01
	jc	0B0E

l0800_0B07:
	cmp	byte ptr es:[bx+0A],01
	jbe	0B17

l0800_0B0E:
	mov	ax,FFF3
	mov	[0C24],ax
	jmp	0BB3

l0800_0B17:
	les	bx,[bp-0E]
	inc	bx
	inc	bx
	mov	[bp-08],es
	mov	[bp-0A],bx
	mov	word ptr [bp-06],0A8B
	mov	word ptr [bp-04],0000
	jmp	0BA5
0800:0B2E                                           90                  .

l0800_0B2F:
	les	bx,[bp-0A]
	mov	dx,es:[bx+02]
	mov	ax,es:[bx]
	mov	bx,[bp-06]
	push	dx
	push	ax
	push	ds
	pop	es
	pop	ax
	pop	dx
	cmp	dx,es:[bx+02]
	jnz	0B9E

l0800_0B48:
	cmp	ax,es:[bx]
	jnz	0B9E

l0800_0B4D:
	mov	ax,[bp-04]
	mov	dx,000F
	mul	dx
	add	ax,0A81
	mov	[bp-02],ax
	mov	bx,ax
	push	word ptr [bx+08]
	push	ds
	push	ax
	call	09A4
	add	sp,06
	mov	bx,[bp-02]
	mov	word ptr [bx+02],0000
	mov	word ptr [bx],0000
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	word ptr [bp-0C]
	push	word ptr [bp-0E]
	les	bx,[bp-0E]
	push	word ptr es:[bx+06]
	call	09DA
	mov	bx,[bp-02]
	mov	[bx+06],dx
	mov	[bx+04],ax
	mov	word ptr [bx+08],0000
	mov	ax,[bp-04]
	inc	ax
	jmp	0BB3

l0800_0B9E:
	add	word ptr [bp-06],0F
	inc	word ptr [bp-04]

l0800_0BA5:
	cmp	word ptr [bp-04],14
	jnc	0BAD

l0800_0BAB:
	jmp	0B2F

l0800_0BAD:
	mov	ax,FFF5
	mov	[0C24],ax

l0800_0BB3:
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	
0800:0BBA                               55 8B EC 56 1E B8           U..V..
0800:0BC0 FD 13 8E D8 8B 36 7D 0A 83 3E 37 0C 00 75 07 81 .....6}..>7..u..
0800:0BD0 7E 06 00 01 73 08 C7 06 24 0C F5 FF EB 06 8B 46 ~...s...$......F
0800:0BE0 06 A3 7D 0A 8B C6 1F 5E 5D CB 55 8B EC 1E B8 FD ..}....^].U.....
0800:0BF0 13 8E D8 C4 5E 08 26 C7 07 00 00 8B 46 06 40 3D ....^.&.....F.@=
0800:0C00 0B 00 77 72 8B D8 D1 E3 2E FF A7 0D 0C 69 0C 76 ..wr.........i.v
0800:0C10 0C 25 0C 2F 0C 5F 0C 5F 0C 43 0C 5F 0C 55 0C 2F .%./._._.C._.U./
0800:0C20 0C 39 0C 55 0C C4 5E 0C 26 C7 07 04 00 EB 57 C4 .9.U..^.&.....W.
0800:0C30 5E 0C 26 C7 07 05 00 EB 4D C4 5E 0C 26 C7 07 02 ^.&.....M.^.&...
0800:0C40 00 EB 43 C4 5E 08 26 C7 07 03 00 C4 5E 0C 26 C7 ..C.^.&.....^.&.
0800:0C50 07 03 00 EB 31 C4 5E 0C 26 C7 07 00 00 EB 27 C4 ....1.^.&.....'.
0800:0C60 5E 0C 26 C7 07 01 00 EB 1D 9A 02 24 00 08 C4 5E ^.&........$...^
0800:0C70 0C 26 89 07 EB 10 C4 5E 08 26 C7 07 FF FF C4 5E .&.....^.&.....^
0800:0C80 0C 26 C7 07 FF FF 1F 5D CB 55 8B EC 1E B8 FD 13 .&.....].U......
0800:0C90 8E D8 FF 76 0C FF 76 0A FF 76 08 FF 76 06 9A 2F ...v..v..v..v../
0800:0CA0 21 00 08 83 C4 08 C4 5E 06 26 83 3F 00 7D 09 B8 !......^.&.?.}..
0800:0CB0 FE FF 26 89 07 A3 24 0C 1F 5D CB                ..&...$..].    

fn0800_0CBB()
	mov	word ptr [0BB3],0800
	mov	word ptr [0BB1],094E
	mov	word ptr [0BAF],0800
	mov	word ptr [0BAD],094E
	mov	word ptr [0C0A],0BC8
	mov	word ptr [0C12],0000
	mov	word ptr [0C10],0000
	mov	word ptr [0C28],0000
	mov	word ptr [0C26],0000
	mov	word ptr [0C16],0000
	mov	word ptr [0C14],0000
	mov	word ptr [0C1C],0000
	mov	word ptr [0C1A],0000
	mov	bx,[0C0A]
	mov	word ptr [bx+0E],0000
	mov	word ptr [bx+0C],0000
	mov	word ptr [bx+10],0000
	mov	word ptr [bx+28],0000
	mov	word ptr [bx+26],0000
	mov	word ptr [bx+2A],0000
	mov	byte ptr [bx+16],00
	mov	ax,0001
	mov	[0C20],ax
	mov	[0C1E],ax
	mov	word ptr [0C3B],0000
	mov	word ptr [0C37],0000
	ret	

fn0800_0D45()
	push	bp
	mov	bp,sp
	sub	sp,64
	les	bx,[bp+06]
	mov	word ptr es:[bx],0000
	push	ss
	lea	ax,[bp-64]
	push	ax
	push	word ptr [bp+10]
	push	word ptr [bp+0E]
	push	word ptr [bp+0C]
	push	word ptr [bp+0A]
	call	06E0
	push	ss
	lea	ax,[bp-64]
	push	ax
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	word ptr [bp+04]
	call	0727
	mov	[0C24],ax
	or	ax,ax
	jz	0DA9

l0800_0D7F:
	push	ss
	lea	ax,[bp-64]
	push	ax
	xor	ax,ax
	push	ax
	push	ax
	push	word ptr [bp+0C]
	push	word ptr [bp+0A]
	call	06E0
	push	ss
	lea	ax,[bp-64]
	push	ax
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	word ptr [bp+04]
	call	0727
	mov	[0C24],ax
	or	ax,ax
	jnz	0DAD

l0800_0DA9:
	xor	ax,ax
	jmp	0DB0

l0800_0DAD:
	mov	ax,0001

l0800_0DB0:
	mov	sp,bp
	pop	bp
	ret	000E

fn0800_0DB6()
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+08]
	push	ds
	mov	ax,0A1F
	push	ax
	push	ds
	mov	ax,si
	mov	dx,001A
	mul	dx
	add	ax,0C76
	push	ax
	push	ds
	mov	ax,1061
	push	ax
	call	06E0
	mov	ax,si
	mov	dx,001A
	mul	dx
	mov	bx,ax
	mov	dx,[bx+0C8E]
	mov	ax,[bx+0C8C]
	mov	[0BB3],dx
	mov	[0BB1],ax
	or	dx,ax
	jz	0E07

l0800_0DF2:
	mov	word ptr [0C16],0000
	mov	word ptr [0C14],0000
	mov	word ptr [0C18],0000
	jmp	0E9C

l0800_0E07:
	push	word ptr [bp+06]
	push	word ptr [bp+04]
	push	ds
	mov	ax,0A1F
	push	ax
	push	ds
	mov	ax,0C18
	push	ax
	mov	ax,FFFC
	push	ax
	call	0D45
	or	ax,ax
	jnz	0E80

l0800_0E22:
	push	word ptr [0C18]
	push	ds
	mov	ax,0C14
	push	ax
	call	0972
	add	sp,06
	or	ax,ax
	jz	0E40

l0800_0E35:
	call	071E
	mov	word ptr [0C24],FFFB
	jmp	0E80

l0800_0E40:
	xor	ax,ax
	push	ax
	push	word ptr [0C18]
	push	word ptr [0C16]
	push	word ptr [0C14]
	call	076E
	or	ax,ax
	jnz	0E71

l0800_0E56:
	push	word ptr [0C16]
	push	word ptr [0C14]
	push	cs
	call	0A16
	pop	cx
	pop	cx
	cmp	ax,si
	jz	0E84

l0800_0E68:
	call	071E
	mov	word ptr [0C24],FFFC

l0800_0E71:
	push	word ptr [0C18]
	push	ds
	mov	ax,0C14
	push	ax
	call	09A4
	add	sp,06

l0800_0E80:
	xor	ax,ax
	jmp	0E9F

l0800_0E84:
	mov	ax,si
	mov	dx,001A
	mul	dx
	mov	bx,ax
	les	bx,[bx+0C8C]
	mov	[0BB3],es
	mov	[0BB1],bx
	call	071E

l0800_0E9C:
	mov	ax,0001

l0800_0E9F:
	pop	si
	pop	bp
	ret	0006

fn0800_0EA4()
	push	bp
	mov	bp,sp
	sub	sp,04
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	cmp	word ptr [0C37],00
	jnz	0EBD

l0800_0EB9:
	push	cs
	call	094E

l0800_0EBD:
	mov	ax,0001
	push	ax
	mov	bx,[0C08]
	push	word ptr [bx+04]
	push	word ptr [bx+02]
	xor	ax,ax
	push	ax
	push	ax
	call	far 0800:1520
	add	sp,0A
	call	far 0800:23C4
	mov	[bp-02],dx
	mov	[bp-04],ax
	push	si
	push	di
	push	ds
	pop	es
	lds	si,[bp-04]
	lea	di,[0C59]
	mov	cx,0011
	cld	

l0800_0EF1:
	rep	
	movsb	

l0800_0EF3:
	push	es
	pop	ds
	pop	di
	pop	si
	push	ds
	mov	ax,0C59
	push	ax
	call	far 0800:19F1
	pop	cx
	pop	cx
	call	far 0800:23A9
	cmp	ax,0001
	jz	0F16

l0800_0F0D:
	xor	ax,ax
	push	ax
	call	far 0800:199D
	pop	cx

l0800_0F16:
	mov	byte ptr [0C30],00
	call	far 0800:238E
	push	ax
	call	far 0800:236D
	pop	cx
	call	far 0800:238E
	push	ax
	push	ds
	mov	ax,0DE7
	push	ax
	call	far 0800:186D
	add	sp,06
	call	far 0800:238E
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	push	ax
	call	far 0800:1768
	add	sp,06
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	push	ax
	call	far 0800:1C58
	add	sp,06
	mov	ax,0002
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:1C17
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	call	far 0800:2003
	pop	cx
	xor	ax,ax
	push	ax
	push	ax
	call	far 0800:1631
	pop	cx
	pop	cx
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	

fn0800_0F94()
	push	bp
	mov	bp,sp
	sub	sp,08
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	word ptr [bp-02],0000
	mov	ax,13FD
	mov	es,ax
	mov	dx,es:[0A12]
	mov	ax,13FD
	mov	es,ax
	mov	ax,es:[0A10]
	add	ax,0020
	mov	cl,04
	shr	ax,cl
	add	dx,ax
	xor	ax,ax
	mov	[0BAF],dx
	mov	[0BAD],ax
	les	bx,[bp+06]
	cmp	es:[bx],ax
	jnz	102E

l0800_0FD4:
	jmp	101C

l0800_0FD6:
	mov	ax,[bp-02]
	mov	dx,001A
	mul	dx
	mov	bx,ax
	mov	ax,[bx+0C88]
	or	ax,[bx+0C8A]
	jz	1019

l0800_0FEA:
	mov	ax,[bp-02]
	mov	dx,001A
	mul	dx
	mov	bx,ax
	call	dword ptr [bx+0C88]
	mov	[bp-04],ax
	or	ax,ax
	jl	1019

l0800_0FFF:
	mov	ax,[bp-02]
	mov	[0C0C],ax
	add	ax,0080
	les	bx,[bp+06]
	mov	es:[bx],ax
	mov	ax,[bp-04]
	les	bx,[bp+0A]
	mov	es:[bx],ax
	jmp	102E

l0800_1019:
	inc	word ptr [bp-02]

l0800_101C:
	mov	ax,[bp-02]
	cmp	ax,[0C74]
	jge	102E

l0800_1025:
	les	bx,[bp+06]
	cmp	word ptr es:[bx],00
	jz	0FD6

l0800_102E:
	push	word ptr [bp+0C]
	push	word ptr [bp+0A]
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	ds
	mov	ax,0C0C
	push	ax
	call	far 0800:20C8
	add	sp,0C
	les	bx,[bp+06]
	cmp	word ptr es:[bx],00
	jge	105E

l0800_1050:
	mov	word ptr [0C24],FFFE
	mov	word ptr es:[bx],FFFE
	jmp	11BC

l0800_105E:
	les	bx,[bp+0A]
	mov	ax,es:[bx]
	mov	[0C0E],ax
	mov	ax,[bp+0E]
	or	ax,[bp+10]
	jnz	1076

l0800_106F:
	mov	byte ptr [0A2C],00
	jmp	10BC

l0800_1076:
	push	ds
	mov	ax,0A2C
	push	ax
	push	word ptr [bp+10]
	push	word ptr [bp+0E]
	call	0662
	cmp	byte ptr [0A2C],00
	jz	10BC

l0800_108B:
	push	ds
	mov	ax,0A2C
	push	ax
	call	06C5
	mov	[bp-06],dx
	mov	[bp-08],ax
	les	bx,[bp-08]
	dec	bx
	cmp	byte ptr es:[bx],3A
	jz	10BC

l0800_10A3:
	mov	bx,ax
	dec	bx
	cmp	byte ptr es:[bx],5C
	jz	10BC

l0800_10AC:
	mov	bx,ax
	mov	byte ptr es:[bx],5C
	inc	word ptr [bp-08]
	mov	bx,[bp-08]
	mov	byte ptr es:[bx],00

l0800_10BC:
	les	bx,[bp+06]
	cmp	word ptr es:[bx],0080
	jle	10CF

l0800_10C6:
	mov	ax,es:[bx]
	and	ax,007F
	mov	[0C0C],ax

l0800_10CF:
	push	word ptr [0C0C]
	push	ds
	mov	ax,0A2C
	push	ax
	call	0DB6
	or	ax,ax
	jnz	10EB

l0800_10DF:
	mov	ax,[0C24]
	les	bx,[bp+06]
	mov	es:[bx],ax
	jmp	11BC

l0800_10EB:
	push	si
	push	di
	push	ds
	pop	es
	cld	
	mov	di,0BC8
	mov	ds,[0C2C]
	mov	cx,003F
	xor	al,al

l0800_10FC:
	rep	
	stosb	

l0800_10FE:
	mov	ax,es
	mov	ds,ax
	pop	di
	pop	si
	push	word ptr [0A7D]
	push	ds
	mov	ax,0BD4
	push	ax
	call	0972
	add	sp,06
	or	ax,ax
	jz	1137

l0800_1117:
	mov	word ptr [0C24],FFFB
	les	bx,[bp+06]
	mov	word ptr es:[bx],FFFB
	push	word ptr [0C18]
	push	ds
	mov	ax,0C14
	push	ax
	call	09A4
	add	sp,06
	jmp	11BC

l0800_1137:
	mov	byte ptr [0BC9],00
	mov	byte ptr [0BDE],00
	les	bx,[0BD4]
	mov	[0C1C],es
	mov	[0C1A],bx
	mov	[0BF0],es
	mov	[0BEE],bx
	mov	ax,[0A7D]
	mov	[0BD8],ax
	mov	[0BF2],ax
	mov	[0BE4],ds
	mov	word ptr [0BE2],0C24
	cmp	byte ptr [0C07],00
	jz	117D

l0800_116F:
	push	ds
	mov	ax,0BC8
	push	ax
	call	far 0800:1ED5
	pop	cx
	pop	cx
	jmp	1189

l0800_117D:
	push	ds
	mov	ax,0BC8
	push	ax
	call	far 0800:1ED0
	pop	cx
	pop	cx

l0800_1189:
	mov	ax,0013
	push	ax
	mov	dx,[0C2C]
	mov	ax,[0C2A]
	push	dx
	push	ax
	push	ds
	mov	ax,0BB5
	push	ax
	call	07A7
	add	sp,0A
	push	ds
	mov	ax,0BC8
	push	ax
	call	far 0800:216C
	pop	cx
	pop	cx
	cmp	byte ptr [0BB5],00
	jz	11C1

l0800_11B4:
	mov	al,[0BB5]
	mov	ah,00
	mov	[0C24],ax

l0800_11BC:
	call	0CBB
	jmp	11F5

l0800_11C1:
	mov	word ptr [0C0A],0BC8
	mov	word ptr [0C08],0BB5
	call	far 0800:2402
	mov	[0C22],ax
	mov	ax,[0BC3]
	mov	[0C1E],ax
	mov	word ptr [0C20],2710
	mov	al,03
	mov	[0C07],al
	mov	ah,00
	mov	[0C37],ax
	push	cs
	call	0EA4
	mov	word ptr [0C24],0000

l0800_11F5:
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	
0800:11FC                                     55 8B EC 83             U...
0800:1200 EC 04 56 1E B8 FD 13 8E D8 FF 76 08 FF 76 06 E8 ..V.......v..v..
0800:1210 B3 F4 48 89 56 FE 89 46 FC EB 0A C4 5E FC 26 C6 ..H.V..F....^.&.
0800:1220 07 00 FF 4E FC C4 5E FC 26 80 3F 20 75 07 8B C3 ...N..^.&.? u...
0800:1230 3B 46 06 73 E6 FF 76 08 FF 76 06 E8 64 F4 33 F6 ;F.s..v..v..d.3.
0800:1240 EB 3E FF 76 08 FF 76 06 1E 8B C6 BA 1A 00 F7 E2 .>.v..v.........
0800:1250 05 76 0C 50 B8 08 00 50 E8 26 F4 0B C0 75 20 8B .v.P...P.&...u .
0800:1260 56 0C 8B 46 0A 52 50 8B C6 BA 1A 00 F7 E2 8B D8 V..F.RP.........
0800:1270 58 5A 89 97 8A 0C 89 87 88 0C 8B C6 40 EB 65 46 XZ..........@.eF
0800:1280 3B 36 74 0C 7C BC 83 3E 74 0C 0A 7C 08 B8 F5 FF ;6t.|..>t..|....
0800:1290 A3 24 0C EB 4F 1E A1 74 0C BA 1A 00 F7 E2 05 76 .$..O..t.......v
0800:12A0 0C 50 FF 76 08 FF 76 06 E8 B7 F3 1E A1 74 0C BA .P.v..v......t..
0800:12B0 1A 00 F7 E2 05 7F 0C 50 FF 76 08 FF 76 06 E8 A1 .......P.v..v...
0800:12C0 F3 8B 56 0C 8B 46 0A 52 50 A1 74 0C BA 1A 00 F7 ..V..F.RP.t.....
0800:12D0 E2 8B D8 58 5A 89 97 8A 0C 89 87 88 0C A1 74 0C ...XZ.........t.
0800:12E0 FF 06 74 0C 1F 5E 8B E5 5D CB 55 8B EC 83 EC 04 ..t..^..].U.....
0800:12F0 56 1E B8 FD 13 8E D8 FF 76 08 FF 76 06 E8 C5 F3 V.......v..v....
0800:1300 48 89 56 FE 89 46 FC EB 0A C4 5E FC 26 C6 07 00 H.V..F....^.&...
0800:1310 FF 4E FC C4 5E FC 26 80 3F 20 75 07 8B C3 3B 46 .N..^.&.? u...;F
0800:1320 06 73 E6 FF 76 08 FF 76 06 E8 76 F3 33 F6 EB 23 .s..v..v..v.3..#
0800:1330 FF 76 08 FF 76 06 1E 8B C6 BA 0F 00 F7 E2 05 8B .v..v...........
0800:1340 0A 50 B8 04 00 50 E8 38 F3 0B C0 75 05 8B C6 40 .P...P.8...u...@
0800:1350 EB 3B 46 3B 36 7F 0A 7C D7 83 3E 7F 0A 14 7C 08 .;F;6..|..>...|.
0800:1360 B8 F5 FF A3 24 0C EB 25 8B 5E 06 8B 57 02 8B 07 ....$..%.^..W...
0800:1370 52 50 A1 7F 0A BA 0F 00 F7 E2 8B D8 58 5A 89 97 RP..........XZ..
0800:1380 8D 0A 89 87 8B 0A FF 06 7F 0A A1 7F 0A 1F 5E 8B ..............^.
0800:1390 E5 5D CB 55 8B EC 56 1E B8 FD 13 8E D8 8B 76 06 .].U..V.......v.
0800:13A0 83 3E 37 0C 02 74 6E 3B 36 22 0C 7E 08 C7 06 24 .>7..tn;6".~...$
0800:13B0 0C F6 FF EB 60 A1 10 0C 0B 06 12 0C 74 18 C4 1E ....`.......t...
0800:13C0 10 0C 8C 06 AF 0B 89 1E AD 0B C7 06 12 0C 00 00 ................
0800:13D0 C7 06 10 0C 00 00 89 36 0E 0C 56 9A 45 1F 00 08 .......6..V.E...
0800:13E0 59 B8 02 00 50 8B 16 2C 0C A1 2A 0C 52 50 1E B8 Y...P..,..*.RP..
0800:13F0 B5 0B 50 E8 B1 F3 83 C4 0A C7 06 08 0C B5 0B C7 ..P.............
0800:1400 06 0A 0C C8 0B A1 C3 0B A3 1E 0C C7 06 20 0C 10 ............. ..
0800:1410 27 0E E8 8F FA 1F 5E 5D CB 1E B8 FD 13 8E D8 80 '.....^]........
0800:1420 3E 07 0C 00 75 0B C7 06 24 0C FF FF B8 FF FF EB >...u...$.......
0800:1430 03 A1 0E 0C 1F CB                               ......         

fn0800_1436()
	push	ds
	mov	ax,13FD
	mov	ds,ax
	call	far 0800:1F7B
	mov	ax,[0C10]
	or	ax,[0C12]
	jnz	1462

l0800_144A:
	les	bx,[0BAD]
	mov	[0C12],es
	mov	[0C10],bx
	mov	word ptr [0BAF],0800
	mov	word ptr [0BAD],094E

l0800_1462:
	pop	ds
	retf	

fn0800_1464()
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	cmp	byte ptr [0C07],00
	jnz	147C

l0800_1473:
	mov	word ptr [0C24],FFFF
	jmp	1504

l0800_147C:
	mov	byte ptr [0C07],00
	push	cs
	call	1436
	push	word ptr [0A7D]
	push	ds
	mov	ax,0C1A
	push	ax
	call	09A4
	add	sp,06
	mov	ax,[0C14]
	or	ax,[0C16]
	jz	14C2

l0800_149D:
	push	word ptr [0C18]
	push	ds
	mov	ax,0C14
	push	ax
	call	09A4
	add	sp,06
	mov	ax,[0C0C]
	mov	dx,001A
	mul	dx
	mov	bx,ax
	mov	word ptr [bx+0C8E],0000
	mov	word ptr [bx+0C8C],0000

l0800_14C2:
	call	0CBB
	xor	di,di
	mov	si,0A81
	jmp	14FF

l0800_14CC:
	cmp	byte ptr [si+0A],00
	jz	14FB

l0800_14D2:
	cmp	word ptr [si+08],00
	jz	14FB

l0800_14D8:
	push	word ptr [si+08]
	push	ds
	push	si
	call	09A4
	add	sp,06
	mov	word ptr [si+02],0000
	mov	word ptr [si],0000
	mov	word ptr [si+06],0000
	mov	word ptr [si+04],0000
	mov	word ptr [si+08],0000

l0800_14FB:
	inc	di
	add	si,0F

l0800_14FF:
	cmp	di,14
	jc	14CC

l0800_1504:
	pop	ds
	pop	di
	pop	si
	retf	

fn0800_1508()
	push	ds
	mov	ax,13FD
	mov	ds,ax
	call	far 0800:2191
	xor	ax,ax
	push	ax
	push	ax
	call	far 0800:1631
	pop	cx
	pop	cx
	pop	ds
	retf	

fn0800_1520()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	di,[bp+08]
	mov	si,[bp+06]
	or	si,si
	jl	155B

l0800_1535:
	or	di,di
	jl	155B

l0800_1539:
	mov	bx,[0C08]
	mov	ax,[bx+02]
	cmp	ax,[bp+0A]
	jc	155B

l0800_1545:
	mov	ax,[bx+04]
	cmp	ax,[bp+0C]
	jc	155B

l0800_154D:
	mov	ax,[bp+0A]
	cmp	ax,si
	jl	155B

l0800_1554:
	mov	ax,[bp+0C]
	cmp	ax,di
	jge	1563

l0800_155B:
	mov	word ptr [0C24],FFF5
	jmp	1599

l0800_1563:
	mov	[0C3D],si
	mov	[0C3F],di
	mov	ax,[bp+0A]
	mov	[0C41],ax
	mov	ax,[bp+0C]
	mov	[0C43],ax
	mov	ax,[bp+0E]
	mov	[0C45],ax
	push	ax
	push	word ptr [bp+0C]
	push	word ptr [bp+0A]
	push	di
	push	si
	call	far 0800:1F19
	add	sp,0A
	xor	ax,ax
	push	ax
	push	ax
	call	far 0800:1631
	pop	cx
	pop	cx

l0800_1599:
	pop	ds
	pop	di
	pop	si
	pop	bp
	retf	
0800:159E                                           55 8B               U.
0800:15A0 EC 1E B8 FD 13 8E D8 C4 5E 06 06 53 BB 3D 0C 1E ........^..S.=..
0800:15B0 53 B9 0A 00 9A 4A 45 00 08 1F 5D CB 55 8B EC 83 S....JE...].U...
0800:15C0 EC 04 1E B8 FD 13 8E D8 8B 16 4F 0C A1 4D 0C 89 ..........O..M..
0800:15D0 56 FE 89 46 FC 33 C0 50 50 9A 1C 18 00 08 59 59 V..F.3.PP.....YY
0800:15E0 A1 43 0C 2B 06 3F 0C 50 A1 41 0C 2B 06 3D 0C 50 .C.+.?.P.A.+.=.P
0800:15F0 33 C0 50 50 9A 45 22 00 08 83 C4 08 83 7E FC 0C 3.PP.E"......~..
0800:1600 75 12 FF 76 FE 1E B8 51 0C 50 9A 6D 18 00 08 83 u..v...Q.P.m....
0800:1610 C4 06 EB 0D FF 76 FE FF 76 FC 9A 1C 18 00 08 59 .....v..v......Y
0800:1620 59 33 C0 50 50 9A 31 16 00 08 59 59 1F 8B E5 5D Y3.PP.1...YY...]
0800:1630 CB                                              .              

fn0800_1631()
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,13FD
	mov	ds,ax
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	call	far 0800:21A8
	pop	cx
	pop	cx
	mov	ax,[bp+06]
	mov	[0C33],ax
	mov	ax,[bp+08]
	mov	[0C35],ax
	pop	ds
	pop	bp
	retf	
0800:1656                   55 8B EC 1E B8 FD 13 8E D8 A1       U.........
0800:1660 35 0C 03 46 08 50 A1 33 0C 03 46 06 50 0E E8 C0 5..F.P.3..F.P...
0800:1670 FF 59 59 1F 5D CB 1E B8 FD 13 8E D8 A1 33 0C 1F .YY.]........3..
0800:1680 CB 1E B8 FD 13 8E D8 A1 35 0C 1F CB             ........5...   

fn0800_168C()
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	bx,[0C08]
	mov	ax,[bx+02]
	pop	ds
	retf	
0800:169B                                  1E B8 FD 13 8E            .....
0800:16A0 D8 8B 1E 08 0C 8B 47 04 1F CB 1E B8 FD 13 8E D8 ......G.........
0800:16B0 83 3E 37 0C 03 74 06 33 D2 8B C2 EB 0D A1 0C 0C .>7..t.3........
0800:16C0 BA 1A 00 F7 E2 05 7F 0C 8C DA 1F CB 55 8B EC 1E ............U...
0800:16D0 B8 FD 13 8E D8 1E B8 EF 0D 50 FF 76 06 9A E1 23 .........P.v...#
0800:16E0 00 08 59 52 50 E8 7A EF B8 EF 0D 8C DA 1F 5D CB ..YRP.z.......].
0800:16F0 55 8B EC 1E B8 FD 13 8E D8 FF 76 08 FF 76 06 9A U.........v..v..
0800:1700 C5 21 00 08 59 59 FF 76 08 FF 76 06 0E E8 21 FF .!..YY.v..v...!.
0800:1710 59 59 1F 5D CB 55 8B EC 1E B8 FD 13 8E D8 A1 35 YY.].U.........5
0800:1720 0C 03 46 08 50 A1 33 0C 03 46 06 50 9A C5 21 00 ..F.P.3..F.P..!.
0800:1730 08 59 59 A1 35 0C 03 46 08 50 A1 33 0C 03 46 06 .YY.5..F.P.3..F.
0800:1740 50 0E E8 EC FE 59 59 1F 5D CB 55 8B EC 1E B8 FD P....YY.].U.....
0800:1750 13 8E D8 C4 5E 06 06 53 BB 47 0C 1E 53 B9 06 00 ....^..S.G..S...
0800:1760 9A 4A 45 00 08 1F 5D CB                         .JE...].       

fn0800_1768()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	di,[bp+0A]
	mov	si,[bp+06]
	cmp	si,04
	ja	1783

l0800_177E:
	cmp	di,03
	jbe	178B

l0800_1783:
	mov	word ptr [0C24],FFF5
	jmp	17A4

l0800_178B:
	mov	[0C47],si
	mov	ax,[bp+08]
	mov	[0C49],ax
	mov	[0C4B],di
	push	di
	push	ax
	push	si
	call	far 0800:249D
	add	sp,06

l0800_17A4:
	pop	ds
	pop	di
	pop	si
	pop	bp
	retf	
0800:17A9                            55 8B EC 56 57 1E B8          U..VW..
0800:17B0 FD 13 8E D8 8B 7E 08 8B 76 06 57 FF 76 0A 57 56 .....~..v.W.v.WV
0800:17C0 9A E2 21 00 08 83 C4 08 FF 76 0C FF 76 0A 57 FF ..!......v..v.W.
0800:17D0 76 0A 9A E2 21 00 08 83 C4 08 FF 76 0C 56 FF 76 v...!......v.V.v
0800:17E0 0C FF 76 0A 9A E2 21 00 08 83 C4 08 57 56 FF 76 ..v...!.....WV.v
0800:17F0 0C 56 9A E2 21 00 08 83 C4 08 1F 5F 5E 5D CB 55 .V..!......_^].U
0800:1800 8B EC 1E B8 FD 13 8E D8 8B 16 4F 0C A1 4D 0C C4 ..........O..M..
0800:1810 5E 06 26 89 57 02 26 89 07 1F 5D CB             ^.&.W.&...].   

fn0800_181C()
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	si,[bp+06]
	cmp	si,0B
	jbe	1836

l0800_182E:
	mov	word ptr [0C24],FFF5
	jmp	1849

l0800_1836:
	mov	[0C4D],si
	mov	ax,[bp+08]
	mov	[0C4F],ax
	push	ax
	push	si
	call	far 0800:250B
	pop	cx
	pop	cx

l0800_1849:
	pop	ds
	pop	si
	pop	bp
	retf	
0800:184D                                        55 8B EC              U..
0800:1850 56 57 1E B8 FD 13 8E D8 56 57 BE 51 0C C4 7E 06 VW......VW.Q..~.
0800:1860 B9 08 00 FC F3 A4 5F 5E 1F 5F 5E 5D CB          ......_^._^].  

fn0800_186D()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	call	far 0800:238E
	cmp	ax,[bp+0A]
	jnc	188A

l0800_1882:
	mov	word ptr [0C24],FFF5
	jmp	18BD

l0800_188A:
	mov	word ptr [0C4D],000C
	mov	ax,[bp+0A]
	mov	[0C4F],ax
	push	si
	push	di
	mov	ax,ds
	mov	es,ax
	lds	si,[bp+06]
	mov	di,0C51
	mov	cx,0008
	cld	

l0800_18A6:
	rep	
	movsb	

l0800_18A8:
	mov	ds,ax
	pop	di
	pop	si
	push	word ptr [bp+0A]
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	call	far 0800:2026
	add	sp,06

l0800_18BD:
	pop	ds
	pop	di
	pop	si
	pop	bp
	retf	
0800:18C2       55 8B EC A1 20 0C 99 52 50 8B 46 04 33 D2   U... ..RP.F.3.
0800:18D0 52 50 A1 1E 0C 99 5B 59 9A 3A 43 00 08 52 50 9A RP....[Y.:C..RP.
0800:18E0 A7 44 00 08 5D C2 02 00 55 8B EC 1E B8 FD 13 8E .D..]...U.......
0800:18F0 D8 FF 76 0E E8 CB FF 50 FF 76 0E FF 76 0C FF 76 ..v....P.v..v..v
0800:1900 0A FF 76 08 FF 76 06 9A A7 22 00 08 83 C4 0C 1F ..v..v..."......
0800:1910 5D CB 55 8B EC 1E B8 FD 13 8E D8 FF 76 0A E8 A1 ].U.........v...
0800:1920 FF 50 FF 76 0A B8 68 01 50 33 C0 50 FF 76 08 FF .P.v..h.P3.P.v..
0800:1930 76 06 9A A7 22 00 08 83 C4 0C 1F 5D CB 55 8B EC v..."......].U..
0800:1940 1E B8 FD 13 8E D8 A1 1E 0C C4 5E 06 26 89 07 A1 ..........^.&...
0800:1950 20 0C C4 5E 0A 26 89 07 1F 5D CB 55 8B EC 1E B8  ..^.&...].U....
0800:1960 FD 13 8E D8 8B 46 06 A3 1E 0C 8B 46 08 A3 20 0C .....F.....F.. .
0800:1970 1F 5D CB 55 8B EC 1E B8 FD 13 8E D8 FF 76 0E E8 .].U.........v..
0800:1980 40 FF 50 FF 76 0E FF 76 0C FF 76 0A FF 76 08 FF @.P.v..v..v..v..
0800:1990 76 06 9A 14 23 00 08 83 C4 0C 1F 5D CB          v...#......].  

fn0800_199D()
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,13FD
	mov	ds,ax
	cmp	word ptr [bp+06],0F
	ja	19D4

l0800_19AC:
	mov	al,[bp+06]
	mov	[0C30],al
	cmp	word ptr [bp+06],00
	jnz	19BF

l0800_19B8:
	mov	byte ptr [0C5A],00
	jmp	19C9

l0800_19BF:
	mov	bx,[bp+06]
	mov	al,[bx+0C5A]
	mov	[0C5A],al

l0800_19C9:
	mov	al,[0C5A]
	cbw	
	push	ax
	call	far 0800:241E
	pop	cx

l0800_19D4:
	pop	ds
	pop	bp
	retf	

fn0800_19D7()
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	al,[0C2E]
	mov	ah,00
	pop	ds
	retf	
0800:19E4             1E B8 FD 13 8E D8 A0 30 0C B4 00 1F     .......0....
0800:19F0 CB                                              .              

fn0800_19F1()
	push	bp
	mov	bp,sp
	sub	sp,1A
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	les	bx,[bp+06]
	mov	[bp-14],es
	mov	[bp-16],bx
	cmp	word ptr [0C37],00
	jnz	1A12

l0800_1A0F:
	jmp	1A8E
0800:1A11    90                                            .             

l0800_1A12:
	les	bx,[bp-16]
	cmp	byte ptr es:[bx],10
	jbe	1A20

l0800_1A1B:
	mov	ax,0010
	jmp	1A28

l0800_1A20:
	les	bx,[bp-16]
	mov	al,es:[bx]
	mov	ah,00

l0800_1A28:
	mov	[bp-18],ax
	mov	word ptr [bp-1A],0000
	jmp	1A53

l0800_1A32:
	les	bx,[bp-16]
	add	bx,[bp-1A]
	cmp	byte ptr es:[bx+01],FF
	jle	1A50

l0800_1A3F:
	mov	bx,[bp-16]
	add	bx,[bp-1A]
	mov	al,es:[bx+01]
	mov	bx,[bp-1A]
	mov	[bx+0C5A],al

l0800_1A50:
	inc	word ptr [bp-1A]

l0800_1A53:
	mov	ax,[bp-1A]
	cmp	ax,[bp-18]
	jc	1A32

l0800_1A5B:
	les	bx,[bp-16]
	cmp	byte ptr es:[bx+01],FF
	jz	1A6A

l0800_1A65:
	mov	byte ptr [0C30],00

l0800_1A6A:
	push	si
	push	di
	push	ss
	pop	es
	mov	si,0C59
	lea	di,[bp-12]
	mov	cx,0011
	cld	

l0800_1A78:
	rep	
	movsb	

l0800_1A7A:
	pop	di
	pop	si
	mov	al,[0C39]
	mov	[bp-01],al
	push	ss
	lea	ax,[bp-12]
	push	ax
	call	far 0800:2482
	pop	cx
	pop	cx

l0800_1A8E:
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	
0800:1A95                55 8B EC 56 1E B8 FD 13 8E D8 8B      U..V.......
0800:1AA0 76 06 83 3E 37 0C 00 74 2B A0 59 0C B4 00 48 3B v..>7..t+.Y...H;
0800:1AB0 C6 72 21 83 7E 08 00 7C 1B 8A 46 08 88 84 5A 0C .r!.~..|..F...Z.
0800:1AC0 0B F6 75 05 C6 06 30 0C 00 FF 76 08 56 9A 63 24 ..u...0...v.V.c$
0800:1AD0 00 08 59 59 1F 5E 5D CB 55 8B EC 1E B8 FD 13 8E ..YY.^].U.......
0800:1AE0 D8 C4 5E 06 06 53 BB 59 0C 1E 53 B9 11 00 9A 4A ..^..S.Y..S....J
0800:1AF0 45 00 08 1F 5D CB 55 8B EC 56 1E B8 FD 13 8E D8 E...].U..V......
0800:1B00 FF 76 0C FF 76 0A FF 76 08 FF 76 06 9A 76 20 00 .v..v..v..v..v .
0800:1B10 08 83 C4 08 8B F0 83 FE FF 75 06 C7 06 24 0C F5 .........u...$..
0800:1B20 FF 8B C6 1F 5E 5D CB                            ....^].        

fn0800_1B27()
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	les	bx,[bp+0A]
	mov	ax,es:[bx]
	mov	[bp-02],ax
	mov	si,es:[bx+02]
	mov	di,si
	mov	bx,[0C08]
	mov	si,[bx+04]
	mov	ax,[bp+08]
	add	ax,[0C3F]
	sub	si,ax
	cmp	si,di
	jbe	1B5A

l0800_1B58:
	mov	si,di

l0800_1B5A:
	mov	ax,[bp+06]
	add	ax,[0C3D]
	add	ax,[bp-02]
	mov	bx,[0C08]
	cmp	ax,[bx+02]
	ja	1BA6

l0800_1B6D:
	mov	ax,[bp+06]
	add	ax,[0C3D]
	jl	1BA6

l0800_1B76:
	or	si,si
	jc	1BA6

l0800_1B7A:
	mov	ax,[bp+08]
	add	ax,[0C3F]
	jl	1BA6

l0800_1B83:
	les	bx,[bp+0A]
	mov	es:[bx+02],si
	push	word ptr [bp+0E]
	push	word ptr [bp+0C]
	push	bx
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	call	far 0800:26B4
	add	sp,0A
	les	bx,[bp+0A]
	mov	es:[bx+02],di

l0800_1BA6:
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	

fn0800_1BAD()
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,13FD
	mov	ds,ax
	les	bx,[bp+06]
	push	es
	push	bx
	mov	bx,0C6A
	push	ds
	push	bx
	mov	cx,000A
	call	far 0800:454A
	pop	ds
	pop	bp
	retf	
0800:1BCB                                  55 8B EC 1E B8            U....
0800:1BD0 FD 13 8E D8 FF 76 08 FF 76 06 FF 36 35 0C FF 36 .....v..v..65..6
0800:1BE0 33 0C 9A 3B 25 00 08 83 C4 08 83 3E 70 0C 00 75 3..;%......>p..u
0800:1BF0 23 83 3E 6C 0C 00 75 1C FF 36 35 0C FF 76 08 FF #.>l..u..65..v..
0800:1C00 76 06 9A E8 25 00 08 59 59 03 06 33 0C 50 0E E8 v...%..YY..3.P..
0800:1C10 1F FA 59 59 1F 5D CB                            ..YY.].        

fn0800_1C17()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	di,[bp+08]
	mov	si,[bp+06]
	or	si,si
	jl	1C3A

l0800_1C2C:
	cmp	si,02
	jg	1C3A

l0800_1C31:
	or	di,di
	jl	1C3A

l0800_1C35:
	cmp	di,02
	jle	1C42

l0800_1C3A:
	mov	word ptr [0C24],FFF5
	jmp	1C53

l0800_1C42:
	mov	[0C70],si
	mov	[0C72],di
	push	di
	push	si
	call	far 0800:2059
	pop	cx
	pop	cx

l0800_1C53:
	pop	ds
	pop	di
	pop	si
	pop	bp
	retf	

fn0800_1C58()
	push	bp
	mov	bp,sp
	sub	sp,0C
	push	si
	push	di
	push	ds
	mov	ax,13FD
	mov	ds,ax
	mov	si,[bp+06]
	mov	bx,[0C08]
	cmp	byte ptr [bx+01],03
	jnz	1C76

l0800_1C73:
	jmp	1DF8

l0800_1C76:
	or	si,si
	jnz	1C7D

l0800_1C7A:
	jmp	1DF8

l0800_1C7D:
	or	si,si
	jl	1C87

l0800_1C81:
	cmp	si,[0A7F]
	jle	1C90

l0800_1C87:
	mov	word ptr [0C24],FFF2
	jmp	1DF1

l0800_1C90:
	cmp	si,[0C6A]
	jnz	1C99

l0800_1C96:
	jmp	1DF8

l0800_1C99:
	mov	ax,si
	dec	ax
	mov	dx,000F
	mul	dx
	mov	di,ax
	add	di,0A81
	cmp	si,[0C3B]
	jnz	1CB0

l0800_1CAD:
	jmp	1DDE

l0800_1CB0:
	mov	ax,[0C3B]
	dec	ax
	mov	dx,000F
	mul	dx
	mov	bx,ax
	cmp	word ptr [bx+0A89],00
	jz	1CF9

l0800_1CC2:
	mov	ax,[0C3B]
	dec	ax
	mov	dx,000F
	mul	dx
	add	ax,0A81
	mov	[bp-02],ax
	mov	bx,ax
	push	word ptr [bx+08]
	push	ds
	push	ax
	call	09A4
	add	sp,06
	mov	bx,[bp-02]
	mov	word ptr [bx+02],0000
	mov	word ptr [bx],0000
	mov	word ptr [bx+06],0000
	mov	word ptr [bx+04],0000
	mov	word ptr [bx+08],0000

l0800_1CF9:
	mov	ax,[di+04]
	or	ax,[di+06]
	jz	1D04

l0800_1D01:
	jmp	1DDA

l0800_1D04:
	push	ds
	mov	ax,0A16
	push	ax
	push	ds
	mov	ax,di
	add	ax,000A
	push	ax
	push	ds
	mov	ax,1066
	push	ax
	call	06E0
	push	ds
	mov	ax,0A2C
	push	ax
	push	ds
	mov	ax,0A16
	push	ax
	push	ss
	lea	ax,[bp-0C]
	push	ax
	mov	ax,FFF3
	push	ax
	call	0D45
	or	ax,ax
	jz	1D45

l0800_1D32:
	cmp	word ptr [0C24],FD
	jz	1D3C

l0800_1D39:
	jmp	1DF1

l0800_1D3C:
	mov	word ptr [0C24],FFF8
	jmp	1DF1

l0800_1D45:
	mov	ax,[bp-0C]
	add	ax,0010
	push	ax
	push	ss
	lea	ax,[bp-0A]
	push	ax
	call	0972
	add	sp,06
	or	ax,ax
	jz	1D67

l0800_1D5B:
	call	071E
	mov	word ptr [0C24],FFF7
	jmp	1DF1

l0800_1D67:
	mov	dx,[bp-08]
	mov	ax,[bp-0A]
	add	ax,000F
	mov	cl,04
	shr	ax,cl
	add	dx,ax
	xor	ax,ax
	mov	[bp-04],dx
	mov	[bp-06],ax
	push	ax
	push	word ptr [bp-0C]
	push	dx
	push	ax
	call	076E
	or	ax,ax
	jz	1D9F

l0800_1D8B:
	mov	ax,[bp-0C]
	add	ax,0010
	push	ax
	push	ss
	lea	ax,[bp-0A]
	push	ax
	call	09A4
	add	sp,06
	jmp	1DF1

l0800_1D9F:
	call	071E
	push	word ptr [bp-04]
	push	word ptr [bp-06]
	push	cs
	call	0AD4
	pop	cx
	pop	cx
	cmp	ax,si
	jz	1DC6

l0800_1DB2:
	mov	ax,[bp-0C]
	add	ax,0010
	push	ax
	push	ss
	lea	ax,[bp-0A]
	push	ax
	call	09A4
	add	sp,06
	jmp	1DEB

l0800_1DC6:
	mov	dx,[bp-08]
	mov	ax,[bp-0A]
	mov	[di+02],dx
	mov	[di],ax
	mov	ax,[bp-0C]
	add	ax,0010
	mov	[di+08],ax

l0800_1DDA:
	mov	[0C3B],si

l0800_1DDE:
	les	bx,[di+04]
	mov	[0C28],es
	mov	[0C26],bx
	jmp	1DF8

l0800_1DEB:
	mov	word ptr [0C24],FFF3

l0800_1DF1:
	xor	si,si
	mov	word ptr [bp+0A],0001

l0800_1DF8:
	mov	[0C6A],si
	mov	ax,[bp+08]
	mov	[0C6C],ax
	mov	ax,[bp+0A]
	mov	[0C6E],ax
	push	ax
	push	word ptr [bp+08]
	push	si
	call	far 0800:2571
	add	sp,06
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	
0800:1E1C                                     55 8B EC 1E             U...
0800:1E20 B8 FD 13 8E D8 8B 1E 08 0C 8B 47 02 3B 46 06 72 ..........G.;F.r
0800:1E30 2C 8B 47 02 3B 46 08 72 24 8B 47 04 3B 46 0A 72 ,.G.;F.r$.G.;F.r
0800:1E40 1C 8B 47 04 3B 46 0C 72 14 FF 76 0C FF 76 0A FF ..G.;F.r..v..v..
0800:1E50 76 08 FF 76 06 9A C2 25 00 08 83 C4 08 C7 06 6E v..v...%.......n
0800:1E60 0C 00 00 1F 5D CB                               ....].         

fn0800_1E66()
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,13FD
	mov	ds,ax
	call	far 0800:2615
	pop	ds
	pop	bp
	retf	

fn0800_1E77()
	push	es
	push	bx
	retf	

fn0800_1E7A()
	cmp	byte ptr [1075],FF
	jnz	1EB8

l0800_1E81:
	cmp	byte ptr [0A14],A5
	jnz	1E8E

l0800_1E88:
	mov	byte ptr [1075],00
	ret	

l0800_1E8E:
	mov	ah,0F
	int	10
	mov	[1075],al
	mov	ax,0040
	mov	es,ax
	mov	bx,0010
	mov	al,es:[bx]
	mov	[1076],al
	cmp	byte ptr [106E],05
	jz	1EB8

l0800_1EAA:
	cmp	byte ptr [106E],07
	jz	1EB8

l0800_1EB1:
	and	al,CF
	or	al,20
	mov	es:[bx],al

l0800_1EB8:
	ret	
0800:1EB9                            55 8B EC 1E 2E 8E 1E          U......
0800:1EC0 05 02 56 57 BE 06 00 FF 1E AD 0B 5F 5E 1F 5D CB ..VW......._^.].

fn0800_1ED0()
	mov	byte ptr [1075],FF

fn0800_1ED5()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	xor	ax,ax
	mov	ch,[106F]
	cmp	byte ptr [106E],05
	jnz	1EEF

l0800_1EED:
	mov	ch,03

l0800_1EEF:
	mov	cl,[106D]
	les	bx,[bp+06]
	mov	ah,01
	cmp	byte ptr es:[bx+16],00
	jnz	1F05

l0800_1EFF:
	xor	ah,ah
	les	bx,[0BB1]

l0800_1F05:
	mov	si,0000
	call	dword ptr [0BAD]
	mov	[0C2A],bx
	mov	[0C2C],es
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_1F19()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	bx,[bp+08]
	mov	cx,[bp+0A]
	mov	dx,[bp+0C]
	cmp	byte ptr [bp+0E],00
	jnz	1F39

l0800_1F36:
	or	ah,80

l0800_1F39:
	mov	si,0038
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:1F45                55 8B EC 1E 2E 8E 1E 05 02 56 57      U........VW
0800:1F50 E8 27 FF 8A 46 06 3C 0A 73 11 A2 6D 10 FF 36 73 .'..F.<.s..m..6s
0800:1F60 10 FF 36 71 10 0E E8 6C FF 58 58 C4 1E 71 10 BE ..6q...l.XX..q..
0800:1F70 02 00 FF 1E AD 0B 5F 5E 1F 5D CB                ......_^.].    

fn0800_1F7B()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	cmp	byte ptr [1075],FF
	jz	1FB0

l0800_1F8D:
	mov	si,0006
	call	dword ptr [0BAD]
	cmp	byte ptr [0A14],A5
	jz	1FB0

l0800_1F9B:
	mov	ax,0040
	mov	es,ax
	mov	bx,0010
	mov	al,[1076]
	mov	es:[bx],al
	xor	ah,ah
	mov	al,[1075]
	int	10

l0800_1FB0:
	mov	byte ptr [1075],FF
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:1FBA                               55 8B EC 1E 2E 8E           U.....
0800:1FC0 1E 05 02 56 57 8A 46 06 32 E4 50 BE 32 00 FF 1E ...VW.F.2.P.2...
0800:1FD0 AD 0B 26 8B 5F 0C EB 21 5F 5E 1F 5D CB 55 8B EC ..&._..!_^.].U..
0800:1FE0 1E 2E 8E 1E 05 02 56 57 8A 46 06 32 E4 50 BE 32 ......VW.F.2.P.2
0800:1FF0 00 FF 1E AD 0B 26 8B 5F 0A                      .....&._.      

l0800_1FF9:
	pop	ax
	push	cs
	call	1E77
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_2003()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	al,[bp+06]
	xor	ah,ah
	push	ax
	mov	si,0032
	call	dword ptr [0BAD]
	mov	bx,es:[bx+0E]
	jmp	1FF9
0800:2021    5F 5E 1F 5D CB                                _^.].         

fn0800_2026()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ah,[bp+0A]
	mov	[0C2F],ah
	mov	al,[0C2E]
	mov	si,001E
	call	dword ptr [0BAD]
	mov	byte ptr [0C32],0C
	les	bx,[bp+06]
	mov	ax,FFFF
	mov	si,0020
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_2059()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ah,[bp+06]
	mov	al,[bp+08]
	mov	si,002A
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:2076                   55 8B EC 1E 2E 8E 1E 05 02 56       U........V
0800:2080 57 8B 46 0A 2B 46 06 79 02 F7 D8 40 05 07 00 D1 W.F.+F.y...@....
0800:2090 E8 D1 E8 D1 E8 50 BE 32 00 FF 1E AD 0B 26 8B 5F .....P.2.....&._
0800:20A0 08 0E E8 D2 FD 5B F7 E3 8B 4E 0C 2B 4E 08 79 02 .....[...N.+N.y.
0800:20B0 F7 D9 41 F7 E1 05 06 00 72 04 23 D2 74 05 B8 FF ..A.....r.#.t...
0800:20C0 FF 8B D0 5F 5E 1F 5D CB                         ..._^.].       

fn0800_20C8()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	byte ptr [106C],FF
	mov	byte ptr [106D],00
	mov	byte ptr [106F],0A
	les	di,[bp+0A]
	mov	al,es:[di]
	mov	[106E],al
	and	al,al
	jnz	20FD

l0800_20EF:
	add	bp,04
	call	214A
	sub	bp,04
	mov	al,[106C]
	jmp	2122

l0800_20FD:
	les	di,[bp+0E]
	mov	al,es:[di]
	mov	[106D],al
	les	di,[bp+0A]
	mov	bl,es:[di]
	and	bl,bl
	js	212A

l0800_2110:
	xor	bh,bh
	mov	al,cs:[bx+26F3]
	mov	[106F],al
	mov	al,cs:[bx+26D7]
	mov	[106C],al

l0800_2122:
	les	di,[bp+06]
	xor	ah,ah
	mov	es:[di],ax

l0800_212A:
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:212F                                              55                U
0800:2130 8B EC 1E 2E 8E 1E 05 02 56 57 FF 36 6C 10 E8 09 ........VW.6l...
0800:2140 00 8F 06 6C 10 5F 5E 1F 5D CB                   ...l._^.].     

fn0800_214A()
	push	bp
	call	2701
	pop	bp
	les	di,[bp+06]
	mov	al,[106E]
	xor	ah,ah
	cmp	al,FF
	jnz	215D

l0800_215B:
	mov	ah,al

l0800_215D:
	mov	es:[di],ax
	xor	ah,ah
	mov	al,[106D]
	les	di,[bp+0A]
	mov	es:[di],ax
	ret	

fn0800_216C()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	call	1E7A
	les	bx,[bp+06]
	mov	[1071],bx
	mov	[1073],es
	mov	si,0002
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_2191()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	si,0004
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_21A8()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	bx,[bp+08]
	mov	si,0008
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:21C5                55 8B EC 1E 2E 8E 1E 05 02 56 57      U........VW
0800:21D0 8B 46 06 8B 5E 08 BE 0A 00 FF 1E AD 0B 5F 5E 1F .F..^........_^.
0800:21E0 5D CB                                           ].             

fn0800_21E2()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	bx,[bp+08]
	mov	cx,[bp+0A]
	mov	dx,[bp+0C]
	mov	si,000C
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:2205                55 8B EC 1E 2E 8E 1E 05 02 56 57      U........VW
0800:2210 8B 4E 06 C4 5E 08 B8 06 00 BE 0E 00 FF 1E AD 0B .N..^...........
0800:2220 5F 5E 1F 5D CB 55 8B EC 1E 2E 8E 1E 05 02 56 57 _^.].U........VW
0800:2230 8B 4E 06 C4 5E 08 B8 07 00 BE 0E 00 FF 1E AD 0B .N..^...........
0800:2240 5F 5E 1F 5D CB                                  _^.].          

fn0800_2245()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	bx,[bp+08]
	mov	cx,[bp+0A]
	mov	dx,[bp+0C]
	mov	si,0012
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:2268                         55 8B EC 1E 2E 8E 1E 05         U.......
0800:2270 02 56 57 8B 46 06 8B 5E 08 8B 4E 0A 8B 56 0C 3B .VW.F..^..N..V.;
0800:2280 C1 72 01 91 3B DA 73 02 87 DA 51 52 BE 08 00 FF .r..;.s...QR....
0800:2290 1E AD 0B 5B 58 8B 4E 0E 8B 56 10 BE 10 00 FF 1E ...[X.N..V......
0800:22A0 AD 0B 5F 5E 1F 5D CB 55 8B EC 1E 2E 8E 1E 05 02 .._^.].U........
0800:22B0 56 57 8B 46 06 8B 5E 08 BE 08 00 FF 1E AD 0B 8B VW.F..^.........
0800:22C0 46 0A 8B 5E 0C 8B 4E 0E 8B 56 10 BE 14 00 FF 1E F..^..N..V......
0800:22D0 AD 0B 5F 5E 1F 5D CB 55 8B EC 1E 2E 8E 1E 05 02 .._^.].U........
0800:22E0 56 57 8B 46 06 8B 5E 08 BE 08 00 FF 1E AD 0B 8B VW.F..^.........
0800:22F0 46 0A 8B 5E 0C BE 18 00 FF 1E AD 0B B8 00 00 BB F..^............
0800:2300 68 01 8B 4E 0A 8B 56 0C BE 14 00 FF 1E AD 0B 5F h..N..V........_
0800:2310 5E 1F 5D CB 55 8B EC 1E 2E 8E 1E 05 02 56 57 8B ^.].U........VW.
0800:2320 46 06 8B 5E 08 BE 08 00 FF 1E AD 0B 8B 46 0A 8B F..^.........F..
0800:2330 5E 0C 8B 4E 0E 8B 56 10 BE 16 00 FF 1E AD 0B 5F ^..N..V........_
0800:2340 5E 1F 5D CB 55 8B EC 1E 2E 8E 1E 05 02 56 57 1E ^.].U........VW.
0800:2350 B8 FF FF BE 14 00 FF 1E AD 0B 8B F3 06 1F C4 7E ...............~
0800:2360 06 FC B9 06 00 F3 A5 1F 5F 5E 1F 5D CB          ........_^.].  

fn0800_236D()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	al,[bp+06]
	mov	[0C2E],al
	mov	ah,[0C2F]
	mov	si,001E
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_238E()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	xor	al,al
	mov	si,003A
	call	dword ptr [0BAD]
	mov	ax,cx
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_23A9()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	xor	al,al
	mov	si,003A
	call	dword ptr [0BAD]
	mov	ax,bx
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_23C4()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	al,01
	mov	si,003A
	call	dword ptr [0BAD]
	mov	dx,es
	mov	ax,bx
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:23E1    55 8B EC 1E 2E 8E 1E 05 02 56 57 B0 02 8B 4E  U........VW...N
0800:23F0 06 BE 00 00 FF 1E AD 0B 8C C2 8B C3 40 5F 5E 1F ............@_^.
0800:2400 5D CB                                           ].             

fn0800_2402()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	al,01
	mov	si,0000
	call	dword ptr [0BAD]
	mov	ax,cx
	dec	ax
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_241E()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	bl,[bp+06]
	xor	bh,bh
	mov	ax,FFFF
	mov	si,001A
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:243D                                        55 8B EC              U..
0800:2440 1E 2E 8E 1E 05 02 56 57 8B 46 06 80 CC 80 8B 5E ......VW.F.....^
0800:2450 08 8B 4E 0A 8B 56 0C BE 1A 00 FF 1E AD 0B 5F 5E ..N..V........_^
0800:2460 1F 5D CB 55 8B EC 1E 2E 8E 1E 05 02 56 57 8B 46 .].U........VW.F
0800:2470 06 32 E4 8B 5E 08 BE 1A 00 FF 1E AD 0B 5F 5E 1F .2..^........_^.
0800:2480 5D CB                                           ].             

fn0800_2482()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	les	bx,[bp+06]
	inc	bx
	mov	si,001C
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_249D()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	[0C31],al
	mov	bx,[bp+08]
	mov	cl,[bp+0A]
	mov	[1070],cl
	xor	ch,ch
	mov	si,0022
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:24C6                   55 8B EC 1E 2E 8E 1E 05 02 56       U........V
0800:24D0 57 8B 46 06 8B 5E 08 8B 4E 0A C4 36 71 10 26 8B W.F..^..N..6q.&.
0800:24E0 7C 0C 26 8B 54 0E 26 03 7C 10 83 EF 02 FA 87 E7 |.&.T.&.|.......
0800:24F0 8C D5 8E D2 FB 57 55 BE 2C 00 FF 1E AD 0B 5B 58 .....WU.,.....[X
0800:2500 FA 8E D3 8B E0 FB 5F 5E 1F 5D CB                ......_^.].    

fn0800_250B()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ah,[bp+08]
	mov	[0C2F],ah
	mov	al,[0C2E]
	mov	si,001E
	call	dword ptr [0BAD]
	mov	al,[bp+06]
	mov	[0C32],al
	mov	ah,al
	mov	si,0020
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_253B()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	bx,[bp+08]
	mov	si,0008
	call	dword ptr [0BAD]
	les	bx,[bp+0A]
	mov	di,bx
	xor	al,al
	mov	cx,FFFF
	cld	

l0800_255E:
	repne	
	scasb	

l0800_2560:
	mov	cx,di
	sub	cx,bx
	dec	cx
	mov	si,0026
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_2571()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	les	bx,[0C2A]
	mov	bx,es:[bx+10]
	and	bx,7F7F
	mov	dl,[bp+0A]
	mov	al,bh
	mul	dl
	mov	cx,ax
	mov	al,bl
	mul	dl
	mov	bx,ax
	mov	al,[bp+06]
	mov	ah,[bp+08]
	and	al,al
	jz	25B6

l0800_25A1:
	les	di,[0C2A]
	cmp	byte ptr es:[di+01],03
	jz	25B6

l0800_25AC:
	mov	cl,dl
	xor	ch,ch
	mov	bx,cx
	mov	dx,[0C28]

l0800_25B6:
	mov	si,0024
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:25C2       55 8B EC 1E 2E 8E 1E 05 02 56 57 8B 46 06   U........VW.F.
0800:25D0 8B 5E 08 8B 4E 0A 8B 56 0C 80 CC 80 BE 24 00 FF .^..N..V.....$..
0800:25E0 1E AD 0B 5F 5E 1F 5D CB                         ..._^.].       

fn0800_25E8()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	les	bx,[bp+06]
	mov	di,bx
	xor	al,al
	mov	cx,FFFF
	cld	

l0800_25FE:
	repne	
	scasb	

l0800_2600:
	mov	cx,di
	sub	cx,bx
	dec	cx
	mov	si,0028
	call	dword ptr [0BAD]
	mov	ax,bx
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:2613          4D 00                                     M.          

fn0800_2615()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	cx,0001
	push	cs
	pop	es
	mov	bx,2613
	mov	si,0028
	call	dword ptr [0BAD]
	mov	ax,cx
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_2636()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	bx,[bp+08]
	mov	si,002E
	call	dword ptr [0BAD]
	xor	ah,ah
	mov	al,dl
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	

fn0800_2657()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	mov	ax,[bp+06]
	mov	bx,[bp+08]
	mov	dl,[bp+0A]
	mov	si,0030
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:2677                      55 8B EC 1E 2E 8E 1E 05 02        U........
0800:2680 56 57 C4 5E 0E 8B 4E 06 8B 56 08 8B 76 0A 8B 7E VW.^..N..V..v..~
0800:2690 0C 3B CE 72 02 87 F1 3B D7 72 02 87 FA 2B F1 26 .;.r...;.r...+.&
0800:26A0 89 37 2B FA 26 89 7F 02 BE 34 00 FF 1E AD 0B 5F .7+.&....4....._
0800:26B0 5E 1F 5D CB                                     ^.].           

fn0800_26B4()
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,cs:[0205]
	push	si
	push	di
	les	bx,[bp+0A]
	mov	cx,[bp+06]
	mov	dx,[bp+08]
	mov	al,[bp+0E]
	mov	si,0036
	call	dword ptr [0BAD]
	pop	di
	pop	si
	pop	ds
	pop	bp
	retf	
0800:26D7                      00 00 00 01 01 01 02 03 04        .........
0800:26E0 01 05 06 07 FF 00 04 05 01 00 00 00 00 05 02 00 ................
0800:26F0 00 00 00 00 04 05 01 01 00 01 00 05 02 00 00 00 ................
0800:2700 7F                                              .              

fn0800_2701()
	mov	byte ptr [106C],FF
	mov	byte ptr [106E],FF
	mov	byte ptr [106D],00
	call	2737
	mov	bl,[106E]
	cmp	bl,FF
	jz	2736

l0800_271C:
	xor	bh,bh
	mov	al,cs:[bx+26D7]
	mov	[106C],al
	mov	al,cs:[bx+26E5]
	mov	[106D],al
	mov	al,cs:[bx+26F3]
	mov	[106F],al

l0800_2736:
	ret	

fn0800_2737()
	mov	ah,0F
	int	10
	cmp	al,07
	jz	2770

l0800_273F:
	call	282C
	jnc	274A

l0800_2744:
	mov	byte ptr [106E],06
	ret	

l0800_274A:
	call	279E
	jnc	2753

l0800_274F:
	call	27BC
	ret	

l0800_2753:
	call	2861
	and	ax,ax
	jz	2760

l0800_275A:
	mov	byte ptr [106E],0A
	ret	

l0800_2760:
	mov	byte ptr [106E],01
	call	280B
	jnc	276F

l0800_276A:
	mov	byte ptr [106E],02

l0800_276F:
	ret	

l0800_2770:
	call	279E
	jc	274F

l0800_2775:
	call	282F
	and	al,al
	jz	2782

l0800_277C:
	mov	byte ptr [106E],07
	ret	

l0800_2782:
	mov	si,B800
	mov	es,si
	xor	si,si
	mov	ax,es:[si]
	not	ax
	not	word ptr es:[si]
	nop	
	nop	
	cmp	ax,es:[si]
	jnz	279D

l0800_2798:
	mov	byte ptr [106E],01

l0800_279D:
	ret	

fn0800_279E()
	mov	ax,1200
	mov	bl,10
	mov	bh,FF
	mov	cl,0F
	int	10
	cmp	cl,0C
	jge	27BA

l0800_27AE:
	cmp	bh,01
	jg	27BA

l0800_27B3:
	cmp	bl,03
	jg	27BA

l0800_27B8:
	stc	
	ret	

l0800_27BA:
	clc	
	ret	

fn0800_27BC()
	mov	byte ptr [106E],04
	cmp	bh,01
	jz	27F6

l0800_27C6:
	call	27FC
	jc	27F5

l0800_27CB:
	and	bl,bl
	jz	27F5

l0800_27CF:
	mov	byte ptr [106E],03
	call	280B
	jc	27F0

l0800_27D9:
	mov	bx,C000
	mov	es,bx
	mov	bx,0039
	cmp	word ptr es:[bx],345A
	jnz	27F5

l0800_27E8:
	cmp	word ptr es:[bx+02],3934
	jnz	27F5

l0800_27F0:
	mov	byte ptr [106E],09

l0800_27F5:
	ret	

l0800_27F6:
	mov	byte ptr [106E],05
	ret	

fn0800_27FC()
	cmp	cl,02
	jc	280A

l0800_2801:
	cmp	cl,06
	cmc	
	jnc	280A

l0800_2807:
	cmp	cl,08

l0800_280A:
	ret	

fn0800_280B()
	mov	ax,1A00
	int	10
	cmp	al,1A
	jnz	282A

l0800_2814:
	cmp	bl,07
	jz	2828

l0800_2819:
	cmp	bl,08
	jz	2828

l0800_281E:
	cmp	bl,0B
	jc	282A

l0800_2823:
	cmp	bl,0C
	ja	282A

l0800_2828:
	stc	
	ret	

l0800_282A:
	clc	
	ret	

fn0800_282C()
	xor	al,al
	ret	

fn0800_282F()
	mov	dx,03BA
	xor	bl,bl
	in	al,dx
	and	al,80
	mov	ah,al
	mov	cx,8000

l0800_283C:
	in	al,dx
	and	al,80
	cmp	al,ah
	jz	284A

l0800_2843:
	inc	bl
	cmp	bl,0A
	jnc	284F

l0800_284A:
	loop	283C

l0800_284C:
	xor	al,al
	ret	

l0800_284F:
	mov	cx,8000

l0800_2852:
	in	al,dx
	and	al,30
	cmp	al,10
	jnz	285E

l0800_2859:
	loop	2852

l0800_285B:
	mov	al,02
	ret	

l0800_285E:
	mov	al,01
	ret	

fn0800_2861()
	mov	al,06
	xor	cx,cx
	xor	dx,dx
	mov	ah,30
	int	10
	mov	ax,cx
	or	ax,dx
	jz	288E

l0800_2871:
	push	ds
	mov	ds,cx
	mov	bx,dx
	mov	al,[bx+02]
	pop	ds
	or	al,al
	jz	2882

l0800_287E:
	cmp	al,02
	jnz	288E

l0800_2882:
	mov	dx,0188
	in	al,dx
	test	al,04
	jz	288E

l0800_288A:
	mov	ax,0001
	ret	

l0800_288E:
	xor	ax,ax
	ret	
0800:2891    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............
0800:28A0 20 00 30 19 00 00 00 00 00 00 00 00 00 00 00 00  .0.............
0800:28B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:28C0 1E 0E 1F 56 FF 94 13 00 5E 1F 2E FF 2E 70 00 90 ...V....^....p..
0800:28D0 20 20 00 C6 01 50 02 A7 00 A7 00 0D 01 18 01 65   ...P.........e
0800:28E0 01 A9 00 5C 01 7C 01 85 01 A7 00 A7 00 A7 00 A7 ...\.|..........
0800:28F0 00 9B 02 AA 02 DB 02 80 13 92 01 98 01 BC 01 34 ...............4
0800:2900 01 5C 01 53 01 A7 00 71 01 71 01 B0 00 A7 00 A8 .\.S...q.q......
0800:2910 00 AE 00 A7 00 A7 00 A7 00 A7 00 A7 00 A7 00 A7 ................
0800:2920 00 A7 00 A7 00 A7 00 A7 00 A7 00 A7 00 A7 00 00 ................
0800:2930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:2940 00 10 27 00 00 00 00 00 00 00 00 00 00 08 00 08 ..'.............
0800:2950 01 00 00 00 00 64 00 64 00 00 01 00 00 00 00 01 .....d.d........
0800:2960 00 00 00 5E 5E 1F CB C3 C3 E8 01 04 EB F5 EB F3 ...^^...........
0800:2970 50 C7 06 84 00 00 00 C7 06 86 00 00 00 80 E4 7F P...............
0800:2980 3B C1 72 01 91 3B DA 72 02 87 DA 23 C0 78 21 23 ;.r..;.r...#.x!#
0800:2990 DB 78 1D 83 F9 01 7C 18 83 FA 01 7C 13 A3 84 00 .x....|....|....
0800:29A0 89 1E 86 00 E8 16 00 58 22 E4 79 03 E8 02 00 C3 .......X".y.....
0800:29B0 58 33 C0 8B D8 8B 0E 7D 00 8B 16 7F 00 A3 88 00 X3.....}........
0800:29C0 89 1E 8A 00 89 0E 8C 00 89 16 8E 00 C3 E8 4C 00 ..............L.
0800:29D0 A3 F0 02 89 1E F2 02 C3 8B 0E F0 02 8B 16 F2 02 ................
0800:29E0 E8 EA FF 50 53 E8 1D 03 5B 58 BE 08 00 FF 1E 70 ...PS...[X.....p
0800:29F0 00 E9 6F FF E8 25 00 E8 03 12 73 14 BE 2C 00 FF ..o..%....s..,..
0800:2A00 1E 70 00 3C FF 75 09 C4 1E 78 00 26 C7 07 F9 FF .p.<.u...x.&....
0800:2A10 E9 50 FF E8 06 00 E8 E4 11 73 F5 C3 03 06 84 00 .P.......s......
0800:2A20 03 1E 86 00 C3 E8 06 00 E8 DA 02 E9 35 FF E8 EB ............5...
0800:2A30 FF 91 87 DA E8 E5 FF 91 87 DA C3 C3 E8 EF FF E8 ................
0800:2A40 6E 11 73 CC C3 3D FF FF 75 F1 0E 07 BB F4 02 E9 n.s..=..u.......
0800:2A50 11 FF E8 D8 11 E9 0B FF 80 3E 99 00 00 74 06 E8 .........>...t..
0800:2A60 D1 14 E9 FE FE 80 3E 6F 00 00 74 0F 8B C1 F7 26 ......>o..t....&
0800:2A70 64 13 8B D8 8B 0E 66 13 E9 E8 FE C3 88 26 62 13 d.....f......&b.
0800:2A80 A2 63 13 E9 DD FE 22 C0 74 01 C3 C6 06 92 00 00 .c....".t.......
0800:2A90 C6 06 7C 00 00 89 1E 70 00 8C 06 72 00 A2 6F 00 ..|....p...r..o.
0800:2AA0 33 C0 8B F0 FF 1E 70 00 89 1E 74 00 8C 06 76 00 3.....p...t...v.
0800:2AB0 06 53 C4 3E 70 00 83 C7 10 B0 9A FC AA B8 38 03 .S.>p.........8.
0800:2AC0 AB 8C C8 AB 2E C4 36 74 00 83 C6 02 26 8B 04 A3 ......6t....&...
0800:2AD0 7D 00 2E C4 36 74 00 83 C6 04 26 8B 04 A3 7F 00 }...6t....&.....
0800:2AE0 A1 7D 00 B9 E8 03 F7 E1 2E C4 36 74 00 83 C6 0A .}........6t....
0800:2AF0 26 F7 34 40 A3 95 00 A1 7F 00 F7 E1 2E C4 36 74 &.4@..........6t
0800:2B00 00 83 C6 0C 26 F7 34 40 A3 97 00 5B 07 E9 53 FE ....&.4@...[..S.
0800:2B10 50 53 51 52 06 26 8B 47 0C 40 40 A3 A3 04 26 8B PSQR.&.G.@@...&.
0800:2B20 47 0E A3 A5 04 26 8B 47 10 33 D2 B9 06 00 F7 F1 G....&.G.3......
0800:2B30 A3 9F 04 26 C4 5F 1A 89 1E 78 00 8C 06 7A 00 07 ...&._...x...z..
0800:2B40 5A 59 5B 58 FF 1E 70 00 C6 06 99 00 00 E9 13 FE ZY[X..p.........
0800:2B50 A3 9A 00 BE 1E 00 FF 1E 70 00 C3 A3 9A 00 C3 A3 ........p.......
0800:2B60 90 00 BE 20 00 FF 1E 70 00 C3 3C FF 75 07 C7 06 ... ...p..<.u...
0800:2B70 90 00 0C 0C C3 A3 90 00 C3 32 C0 8B 1E A1 00 B9 .........2......
0800:2B80 01 00 EB 05 32 C0 B9 03 00 A2 9E 00 88 0E 9F 00 ....2...........
0800:2B90 B9 01 00 BE 22 00 FF 1E 70 00 C3 A2 9E 00 88 0E ...."...p.......
0800:2BA0 9F 00 89 1E A1 00 C3 00 00 00 00 00 00 00 00 00 ................
0800:2BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:2BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 ................
0800:2BD0 8A 06 12 00 03 04 20 00 CA 03 26 00 29 18 24 00 ...... ...&.).$.
0800:2BE0 97 13 28 00 73 16 16 00 0A 08 18 00 E7 07 0E 00 ..(.s...........
0800:2BF0 E3 0A 14 00 93 07 00 00 1E 0E 1F 50 8B FE BE 0E ...........P....
0800:2C00 03 AD 23 C0 74 0C 3B C7 AD 75 F6 8B F8 58 FF D7 ..#.t.;..u...X..
0800:2C10 1F CB 58 1F CB A1 F0 02 8B 1E F2 02 EB 0A 2E A3 ..X.............
0800:2C20 F0 02 2E 89 1E F2 02 C3 E8 9A 02 72 0E A3 F0 02 ...........r....
0800:2C30 89 1E F2 02 BE 08 00 FF 1E 70 00 C3 03 06 F0 02 .........p......
0800:2C40 03 1E F2 02 A3 F0 02 89 1E F2 02 EB DB 03 06 F0 ................
0800:2C50 02 03 1E F2 02 50 53 E8 0A 00 5B 58 A3 F0 02 89 .....PS...[X....
0800:2C60 1E F2 02 C3 E8 5E 02 72 13 51 52 8B C8 8B D3 87 .....^.r.QR.....
0800:2C70 06 F0 02 87 1E F2 02 E8 8B 00 5A 59 C3 E8 30 0F ..........ZY..0.
0800:2C80 73 07 BE 12 00 FF 1E 70 00 C3 A3 90 00 C6 06 E2 s......p........
0800:2C90 0A FF C3 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:2CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:2CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:2CC0 00 00 00 0E 07 43 41 8B FB BB D3 03 89 07 89 7F .....CA.........
0800:2CD0 02 89 47 04 89 57 06 89 4F 08 89 57 0A 89 4F 0C ..G..W..O..W..O.
0800:2CE0 89 7F 0E 89 47 10 89 7F 12 B8 00 80 89 47 14 89 ....G........G..
0800:2CF0 47 16 B8 06 00 B9 08 00 BE 0E 00 FF 1E 70 00 C3 G............p..
0800:2D00 E8 C2 01 72 13 80 3E 9F 00 03 73 0D E8 ED 0C 73 ...r..>...s....s
0800:2D10 07 BE 0C 00 FF 1E 70 00 C3 E8 34 00 8B F8 2B F9 ......p...4...+.
0800:2D20 79 02 F7 DF 8B F3 2B F2 79 02 F7 DE 3B FE 8B 3E y.....+.y...;..>
0800:2D30 E0 0A 73 0F 2B C7 2B CF E8 15 00 D1 E7 03 C7 03 ..s.+.+.........
0800:2D40 CF EB 0D 2B DF 2B D7 E8 06 00 D1 E7 03 DF 03 D7 ...+.+..........
0800:2D50 50 53 51 52 57 E8 B4 FF 5F 5A 59 5B 58 C3 00 00 PSQRW..._ZY[X...
0800:2D60 00 00 00 00 00 00 00 00 00 00 00 00 00 3C 08 72 .............<.r
0800:2D70 02 B0 05 32 E4 D0 E0 8B F8 FF A5 BD 04 CD 04 31 ...2...........1
0800:2D80 05 6F 05 36 05 DF 04 5B 05 E5 04 E9 04 C6 06 9E .o.6...[........
0800:2D90 04 01 C7 06 A1 04 00 00 C7 06 A7 04 00 00 C3 C6 ................
0800:2DA0 06 9E 04 02 C3 32 C0 EB 02 B0 FF E3 43 50 06 53 .....2......CP.S
0800:2DB0 51 33 C0 E8 B7 FF 59 5F 07 E8 F0 00 E8 5D FC E8 Q3....Y_.....]..
0800:2DC0 E0 00 23 C9 75 F3 58 22 C0 B8 01 00 74 1F C4 1E ..#.u.X"....t...
0800:2DD0 A3 04 26 8B 07 26 8B 5F 02 C7 06 A7 04 00 00 E8 ..&..&._........
0800:2DE0 46 FE B8 03 00 80 3E 9A 00 00 74 01 48 E8 7D FF F.....>...t.H.}.
0800:2DF0 C3 E8 2D 00 EB 58 E8 28 00 A1 A1 04 3B 06 9F 04 ..-..X.(....;...
0800:2E00 73 19 3D 04 00 72 14 C4 1E A3 04 8B 0E 9F 04 C6 s.=..r..........
0800:2E10 06 9E 04 00 BE 0E 00 FF 1E 70 00 C6 06 9E 04 00 .........p......
0800:2E20 C3 B8 00 80 8B D8 E8 FF FD C6 06 9E 04 00 C3 81 ................
0800:2E30 3E 97 00 B4 00 72 05 C6 06 E2 0A FF 80 3E E2 0A >....r.......>..
0800:2E40 00 74 08 E8 DB FF E8 05 00 EB AE E8 A8 FF C6 06 .t..............
0800:2E50 9E 04 00 C4 3E A3 04 8B 0E A1 04 3B 0E 9F 04 72 ....>......;...r
0800:2E60 03 E9 D7 00 83 F9 02 72 B2 FF 36 F0 02 FF 36 F2 .......r..6...6.
0800:2E70 02 E8 2B 00 E8 35 00 80 FF 80 75 0D 22 DB 74 16 ..+..5....u.".t.
0800:2E80 E8 1C 00 23 C9 75 ED EB 0D 06 57 51 E8 D5 FD 59 ...#.u....WQ...Y
0800:2E90 5F 07 23 C9 75 DE 8F 06 F2 02 8F 06 F0 02 C3 E8 _.#.u...........
0800:2EA0 0A 00 06 57 51 E8 80 FD 59 5F 07 C3 BB 00 80 E3 ...WQ...Y_......
0800:2EB0 0B 26 8B 05 47 47 26 8B 1D 47 47 49 C3 1E 0E 1F .&..GG&..GGI....
0800:2EC0 E8 02 00 1F C3 80 3E 9E 04 00 74 6E 80 3E 9E 04 ......>...tn.>..
0800:2ED0 02 74 10 83 3E A7 04 00 75 1A A3 A9 04 89 1E AB .t..>...u.......
0800:2EE0 04 EB 36 8A 16 9A 00 E8 13 0D 73 07 BE 30 00 FF ..6.......s..0..
0800:2EF0 1E 70 00 C3 3B 06 A9 04 75 1F 3B 1E AB 04 75 19 .p..;...u.;...u.
0800:2F00 83 3E A7 04 01 74 32 E8 0F 00 B8 01 80 8B D8 E8 .>...t2.........
0800:2F10 07 00 C7 06 A7 04 00 00 C3 FF 06 A7 04 8B 3E A1 ..............>.
0800:2F20 04 3B 3E 9F 04 73 14 D1 E7 D1 E7 C4 36 A3 04 03 .;>..s......6...
0800:2F30 FE AB 26 89 1D FF 06 A1 04 F9 C3 06 53 C4 1E 78 ..&.........S..x
0800:2F40 00 26 C7 07 FA FF 5B 07 F9 C3 51 52 A3 04 03 89 .&....[...QR....
0800:2F50 1E 06 03 8B 0E F0 02 8B 16 F2 02 89 0E 00 03 89 ................
0800:2F60 16 02 03 E8 D1 00 A1 9A 00 72 09 86 E0 BE 1E 00 .........r......
0800:2F70 FF 1E 70 00 8B 1E 06 03 53 A1 00 03 E8 E5 FC A1 ..p.....S.......
0800:2F80 04 03 5B 50 E8 DD FC 58 8B 1E 02 03 53 E8 D4 FC ..[P...X....S...
0800:2F90 5B A1 00 03 E8 CD FC A1 04 03 8B 1E 02 03 50 E8 [.............P.
0800:2FA0 86 FC 58 5A 59 0B C9 74 3F 52 8B D1 8B FA D1 E2 ..XZY..t?R......
0800:2FB0 03 D7 D1 EA D1 EA 80 3E 92 00 00 74 0F 8B CA F7 .......>...t....
0800:2FC0 D9 5F 23 FF 75 05 E8 4F 00 EB 1D 57 03 C1 2B DA ._#.u..O...W..+.
0800:2FD0 50 E8 90 FC 58 8B 1E 06 03 2B DA 53 E8 85 FC 5B P...X....+.S...[
0800:2FE0 5F 23 FF 74 03 E8 0B 00 A1 9A 00 BE 1E 00 FF 1E _#.t............
0800:2FF0 70 00 C3 A1 00 03 03 C1 E8 69 FC A1 00 03 8B 1E p........i......
0800:3000 06 03 53 E8 5E FC 5B A1 04 03 50 53 E8 19 FC 5B ..S.^.[...PS...[
0800:3010 58 03 C1 2B DA E9 4C FC A1 00 03 8B 1E 06 03 53 X..+..L........S
0800:3020 50 E8 04 FC 58 5B 2B DA 03 C1 53 E8 36 FC A1 04 P...X[+...S.6...
0800:3030 03 03 C1 5B E9 2D FC 3B C1 7C 01 91 3B DA 7D 02 ...[.-.;.|..;.}.
0800:3040 87 DA 40 49 4B 42 E8 34 FC F9 C3 F8 C3 00 00 00 ..@IKB.4........
0800:3050 00 00 FF C6 06 92 07 00 E8 3C 01 80 3E 9F 00 03 .........<..>...
0800:3060 73 12 BE 04 00 80 3E E2 0A 00 75 08 81 3E 97 00 s.....>...u..>..
0800:3070 B4 00 72 27 50 53 32 C0 B9 01 00 BE 22 00 FF 1E ..r'PS2....."...
0800:3080 70 00 33 C0 E8 E6 FC 5B 58 E8 9D 02 E8 6E 02 B8 p.3....[X....n..
0800:3090 01 00 E8 D8 FC A0 9E 00 E9 E0 FA E8 10 01 E8 5C ...............\
0800:30A0 02 B8 05 00 E9 C6 FC FF 36 F0 02 FF 36 F2 02 50 ........6...6..P
0800:30B0 53 FF 36 9A 00 33 FF 57 8B 3E F0 02 03 F8 8B 36 S.6..3.W.>.....6
0800:30C0 F2 02 57 56 57 56 E8 47 05 C3 C6 06 92 07 FF 80 ..WVWV.G........
0800:30D0 3E 92 00 00 74 02 87 CA E8 BC 00 80 3E E2 0A 00 >...t.......>...
0800:30E0 75 08 81 3E 97 00 B4 00 72 03 E9 8F 02 33 D2 88 u..>....r....3..
0800:30F0 16 91 07 89 16 8D 07 89 16 8F 07 89 16 04 03 89 ................
0800:3100 16 06 03 89 16 08 03 89 16 0A 03 E8 D0 01 50 53 ..............PS
0800:3110 33 D2 B9 5A 00 F7 F1 8B F8 8B C3 33 D2 F7 F1 3D 3..Z.......3...=
0800:3120 04 00 72 03 B8 03 00 8B F0 5B 58 3B F7 74 1E 53 ..r......[X;.t.S
0800:3130 50 B8 5A 00 47 F7 E7 8B D8 58 53 33 F6 3B C3 9C P.Z.G....XS3.;..
0800:3140 E8 6B 00 9D 74 03 E8 0E 01 58 5B EB C1 33 F6 3B .k..t....X[..3.;
0800:3150 C3 9C E8 59 00 9D 74 03 E8 FC 00 A1 F0 02 8B 1E ...Y..t.........
0800:3160 F2 02 8B 0E 8D 07 89 0E 04 03 8B 16 8F 07 89 16 ................
0800:3170 06 03 80 3E 92 07 00 74 1A 03 C8 03 D3 50 53 E8 ...>...t.....PS.
0800:3180 7E FB 5B 58 8B 0E 08 03 8B 16 0A 03 03 C8 03 D3 ~.[X............
0800:3190 E8 6D FB E8 67 01 C3 89 0E 00 03 89 16 02 03 50 .m..g..........P
0800:31A0 A1 F0 02 A3 F4 02 A1 F2 02 A3 F6 02 58 C3 8B 0E ............X...
0800:31B0 00 03 8B 16 02 03 80 3E 92 00 00 74 06 05 5A 00 .......>...t..Z.
0800:31C0 83 C3 5A 8B FB 2B F8 89 3E 93 00 23 FF 75 03 E9 ..Z..+..>..#.u..
0800:31D0 BF 00 FF 36 F0 02 FF 36 F2 02 51 52 FF 36 9A 00 ...6...6..QR.6..
0800:31E0 BF FF FF 57 56 53 53 50 50 E8 BE 00 A3 04 03 58 ...WVSSPP......X
0800:31F0 E8 C4 00 A3 06 03 58 E8 B0 00 A3 08 03 58 E8 B6 ......X......X..
0800:3200 00 A3 0A 03 5E 5E FF 36 04 03 FF 36 06 03 FF 36 ....^^.6...6...6
0800:3210 08 03 50 8B C6 E8 55 FB A1 04 03 3B 06 08 03 75 ..P...U....;...u
0800:3220 16 A1 06 03 3B 06 0A 03 75 0D 81 3E 93 00 5E 01 ....;...u..>..^.
0800:3230 73 21 83 C4 14 EB 0A 83 3E 93 00 02 73 15 83 C4 s!......>...s...
0800:3240 14 A1 08 03 8B 1E 0A 03 03 06 F0 02 03 1E F2 02 ................
0800:3250 E9 D5 F9 E8 BA 03 C3 80 3E 92 07 00 75 08 B8 01 ........>...u...
0800:3260 00 E8 09 FB EB 2B E8 AC F9 C4 1E A3 04 26 8B 07 .....+.......&..
0800:3270 26 8B 5F 02 C7 06 A7 04 00 00 E8 AB F9 B8 03 00 &._.............
0800:3280 E8 EA FA A1 A1 04 2D 03 00 72 06 A3 A1 04 E8 BD ......-..r......
0800:3290 FB 80 3E 91 07 00 75 11 C6 06 91 07 FF A1 04 03 ..>...u.........
0800:32A0 A3 8D 07 A1 06 03 A3 8F 07 C3 5F E8 C9 06 8B 0E .........._.....
0800:32B0 00 03 E8 11 00 FF E7 5F E8 C9 06 8B 0E 02 03 E8 ......._........
0800:32C0 04 00 F7 D8 FF E7 8B D0 8B C3 8B D9 E8 03 00 8B ................
0800:32D0 C2 C3 8B C8 8B C2 F7 E3 91 F7 E3 03 D1 C3 51 52 ..............QR
0800:32E0 B9 68 01 33 D2 F7 F1 52 3B D9 74 08 33 D2 8B C3 .h.3...R;.t.3...
0800:32F0 F7 F1 8B DA 58 3B C3 72 01 93 5A 59 C3 0E 07 FC ....X;.r..ZY....
0800:3300 BE F4 02 8B FE AD 2B 06 84 00 AB 8B D8 AD 2B 06 ......+.......+.
0800:3310 86 00 AB 8B C8 BE 04 03 AD 03 C3 AB AD 03 C1 AB ................
0800:3320 AD 03 C3 AB AD 03 C1 AB C3 3B C3 72 0B 81 C3 68 .........;.r...h
0800:3330 01 EB 05 3B C3 72 01 93 80 3E 92 00 00 74 06 05 ...;.r...>...t..
0800:3340 5A 00 83 C3 5A 8B 0E 00 03 89 0E 00 03 8B 0E 02 Z...Z...........
0800:3350 03 89 0E 02 03 53 50 50 50 E8 4E FF A3 0C 03 58 .....SPPP.N....X
0800:3360 E8 54 FF 8B D8 A1 0C 03 03 06 F0 02 03 1E F2 02 .T..............
0800:3370 E8 B5 F8 58 58 5B 40 3B C3 7E DA C3 50 53 33 C0 ...XX[@;.~..PS3.
0800:3380 E8 EA F9 5B 58 E8 AB FF E8 8A F8 C4 1E A3 04 26 ...[X..........&
0800:3390 8B 07 26 8B 5F 02 E8 8F F8 B8 02 00 E9 CE F9 00 ..&._...........
0800:33A0 01 00 00 81 3E 97 00 B4 00 72 05 C6 06 E2 0A FF ....>....r......
0800:33B0 8B EC 83 EC 18 3D 03 00 72 26 89 4E F0 89 5E FE .....=..r&.N..^.
0800:33C0 89 46 F8 D1 E0 D1 E0 03 D8 89 5E FC FF 36 9A 00 .F........^..6..
0800:33D0 E8 D3 01 73 0B E8 0F 00 E8 2B 02 73 03 E8 07 00 ...s.....+.s....
0800:33E0 58 83 C4 18 E9 69 F7 06 1F E8 DB 00 8B 46 F4 89 X....i.......F..
0800:33F0 46 F6 C7 46 EE 00 00 E8 2F 00 E8 F9 00 8B 46 EC F..F..../.....F.
0800:3400 80 7E E8 02 90 72 12 FF 46 EE 8B 5E EA 3B 5E EE .~...r..F..^.;^.
0800:3410 75 07 C7 46 EE 00 00 F7 EB 01 46 F6 8B 46 F6 3B u..F......F..F.;
0800:3420 46 F2 7C D3 1E 07 0E 1F C3 C7 46 FA 00 00 8B 5E F.|.......F....^
0800:3430 FE 43 43 8B 0F 8B 46 F6 83 C3 04 8B F9 8B 17 8B .CC...F.........
0800:3440 CA 80 FE 80 74 1A 3B D7 7C 02 87 D7 3B C2 7C E8 ....t.;.|...;.|.
0800:3450 3B C7 7D E4 53 51 E8 17 00 E8 3B 00 59 5B EB D5 ;.}.SQ....;.Y[..
0800:3460 80 FA 01 75 0A 83 C3 04 8B 0F 80 FD 80 75 C6 C3 ...u.........u..
0800:3470 8B 77 FA 8B 7F FC 8B 4F FE 8B 17 3B D7 7C 04 87 .w.....O...;.|..
0800:3480 CE 87 D7 8B C1 2B FA 74 0D 8B 46 F6 2B C2 2B F1 .....+.t..F.+.+.
0800:3490 F7 EE F7 FF 03 C1 C3 8B D0 8B 76 FC 8B 46 FA 3B ..........v..F.;
0800:34A0 46 F0 73 22 FF 46 FA 23 C0 74 15 48 8B D8 D1 E3 F.s".F.#.t.H....
0800:34B0 8B 08 40 3B CA 7C 09 8B D8 D1 E3 89 08 48 75 EB ..@;.|.......Hu.
0800:34C0 8B D8 D1 E3 89 10 C3 C7 46 F4 FF 7F C7 46 F2 00 ........F....F..
0800:34D0 80 8B 5E FE 43 43 8B 07 43 43 80 FC 80 75 05 3C ..^.CC..CC...u.<
0800:34E0 01 74 F1 C3 3B 46 F4 7D 03 89 46 F4 3B 46 F2 7C .t..;F.}..F.;F.|
0800:34F0 E3 89 46 F2 EB DE 8B 76 FC 33 C0 8B 4E FA E3 26 ..F....v.3..N..&
0800:3500 8B D8 D1 E3 50 56 1E 55 A9 01 00 8B 00 8B 5E F6 ....PV.U......^.
0800:3510 0E 1F 75 05 E8 14 00 EB 03 E8 21 00 5D 1F 5E 58 ..u.......!.].^X
0800:3520 40 3B 46 FA 72 DA C3 00 00 00 00 83 3E 44 0D 00 @;F.r.......>D..
0800:3530 74 03 E8 D1 00 A3 67 0C 89 1E 69 0C C3 83 3E 44 t.....g...i...>D
0800:3540 0D 00 74 03 E8 BF 00 8B C8 8B D3 87 0E 67 0C 87 ..t..........g..
0800:3550 16 69 0C 3B C1 72 01 91 80 3E E2 0A 00 75 03 E9 .i.;.r...>...u..
0800:3560 1B F7 BE 0C 00 FF 1E 70 00 C3 00 00 01 00 00 02 .......p........
0800:3570 04 02 00 5A 00 00 0A E1 87 02 0A 01 E1 87 02 02 ...Z............
0800:3580 05 87 E1 03 02 05 87 87 01 5A 0A 00 00 01 87 11 .........Z......
0800:3590 E1 E1 03 05 01 00 00 03 0A 01 00 00 03 05 02 00 ................
0800:35A0 00 00 00 01 00 00 C7 06 44 0D 00 00 A0 90 00 FE ........D.......
0800:35B0 C8 F8 78 4F 80 3E E2 0A 00 75 02 32 C0 8A D8 D0 ..xO.>...u.2....
0800:35C0 E3 D0 E3 02 D8 32 FF 81 C3 AA 0C 8B F3 AC 88 46 .....2.........F
0800:35D0 E8 AC 32 E4 89 46 EA AC F7 2E E0 0A 89 46 EC AC ..2..F.......F..
0800:35E0 32 E4 80 3E 92 00 00 74 08 80 3E E2 0A 00 74 01 2..>...t..>...t.
0800:35F0 AC E8 12 00 06 A0 9B 00 8A E0 BE 1E 00 FF 1E 70 ...............p
0800:3600 00 07 F9 C3 00 00 32 C0 C3 00 00 00 00 00 00 00 ......2.........
0800:3610 55 8B EC 83 EC 2A 8B 46 0E E8 72 02 89 46 0E A3 U....*.F..r..F..
0800:3620 9A 00 8B 46 0A 8B 5E 08 E8 15 02 89 46 DA 8B 46 ...F..^.....F..F
0800:3630 06 8B 5E 04 E8 09 02 C6 46 D6 00 3B 46 DA 7F 04 ..^.....F..;F...
0800:3640 C6 46 D6 FF 89 46 D8 F7 46 12 FF FF 75 03 FF 46 .F...F..F...u..F
0800:3650 12 F7 46 10 FF FF 75 03 FF 46 10 8B 46 10 8B 5E ..F...u..F..F..^
0800:3660 12 3B C3 77 02 8B C3 F7 E0 BB 64 00 E8 0A 02 73 .;.w......d....s
0800:3670 03 E9 D1 00 89 46 DC 89 56 DE 8B 5E 12 E8 E7 01 .....F..V..^....
0800:3680 E8 E4 01 89 46 F8 89 56 FA 33 C0 89 46 FE 89 46 ....F..V.3..F..F
0800:3690 EC 89 46 EE 8B 46 DC 8B 56 DE 8B 5E 10 89 5E FC ..F..F..V..^..^.
0800:36A0 E8 C4 01 E8 C1 01 89 46 F4 89 56 F6 E8 CA 01 73 .......F..V....s
0800:36B0 03 E9 91 00 8B F2 8B F8 E8 BE 01 73 03 E9 85 00 ...........s....
0800:36C0 2B 46 DC 1B 56 DE 89 46 F0 89 56 F2 D1 E7 D1 D6 +F..V..F..V.....
0800:36D0 89 7E E8 89 76 EA E8 DE 00 E8 72 00 8B 46 F0 8B .~..v.....r..F..
0800:36E0 5E F2 03 C0 13 DB 03 46 E4 13 5E E6 03 46 E4 13 ^......F..^..F..
0800:36F0 5E E6 3B 5E E2 7C 0A 75 05 3B 46 E0 72 03 E8 94 ^.;^.|.u.;F.r...
0800:3700 00 E8 6F 00 8B 46 EE 3B 46 EA 7C CA 75 08 8B 46 ..o..F.;F.|.u..F
0800:3710 EC 3B 46 E8 72 C0 E8 9E 00 E8 32 00 8B 46 E4 8B .;F.r.....2..F..
0800:3720 5E E6 D1 EB D1 D8 03 46 F0 13 5E F2 3B 5E E2 7F ^......F..^.;^..
0800:3730 0A 75 05 3B 46 E0 77 03 E8 38 00 E8 57 00 F7 46 .u.;F.w..8..W..F
0800:3740 FC 00 80 74 D1 8B E5 5D E8 58 01 C2 14 00 8B 46 ...t...].X.....F
0800:3750 EC 03 46 F8 89 46 E4 8B 46 EE 13 46 FA 89 46 E6 ..F..F..F..F..F.
0800:3760 8B 46 E8 2B 46 F4 89 46 E0 8B 46 EA 1B 46 F6 89 .F.+F..F..F..F..
0800:3770 46 E2 C3 FF 46 FE 8B 46 E4 01 46 F0 8B 46 E6 11 F...F..F..F..F..
0800:3780 46 F2 8B 46 E4 03 46 F8 89 46 EC 8B 46 E6 13 46 F..F..F..F..F..F
0800:3790 FA 89 46 EE C3 FF 4E FC 8B 46 E0 29 46 F0 8B 46 ..F...N..F.)F..F
0800:37A0 E2 19 46 F2 8B 46 E0 2B 46 F4 89 46 E8 8B 46 E2 ..F..F.+F..F..F.
0800:37B0 1B 46 F6 89 46 EA C3 8B 56 0E 8B 76 FE 8B 7E FC .F..F...V..v..~.
0800:37C0 F7 46 0C 00 80 75 37 56 57 8B C6 8B DF 8B C8 8B .F...u7VW.......
0800:37D0 D3 F7 D8 E8 16 00 5F 5E 56 57 F7 DF 8B C6 8B DF ......_^VW......
0800:37E0 8B C8 8B D3 F7 D8 E8 03 00 5F 5E C3 03 46 16 03 ........._^..F..
0800:37F0 5E 14 03 4E 16 03 56 14 55 E8 81 F4 5D C3 E8 0E ^..N..V.U...]...
0800:3800 00 F7 DE E8 09 00 F7 DE F7 DF E8 02 00 F7 DE 8B ................
0800:3810 C6 8B DF E8 2A 00 80 7E D6 00 75 0B 3B 46 DA 7C ....*..~..u.;F.|
0800:3820 05 3B 46 D8 7E 0C C3 3B 46 DA 7D 06 3B 46 D8 7E .;F.~..;F.}.;F.~
0800:3830 01 C3 57 56 03 76 16 03 7E 14 E8 4A 00 5E 5F C3 ..WV.v..~..J.^_.
0800:3840 F7 DB 0A E4 78 0F 0A FF 78 05 2B D8 8B C3 C3 05 ....x...x.+.....
0800:3850 70 17 03 C3 C3 0A FF 78 08 F7 D8 05 D0 07 2B C3 p......x......+.
0800:3860 C3 05 A0 0F 2B C3 C3 0B DB F9 74 0C 33 C9 87 CA ....+.....t.3...
0800:3870 91 F7 F3 91 F7 F3 87 CA C3 8B C8 8B C2 F7 E3 72 ...............r
0800:3880 05 91 F7 E3 03 D1 C3 8B C6 8B DF E9 9A F3 80 3E ...............>
0800:3890 6F 00 00 75 24 50 BE 32 00 FF 1E 70 00 26 8B 1F o..u$P.2...p.&..
0800:38A0 58 EB 12 80 3E 6F 00 00 75 0F BE 32 00 FF 1E 70 X...>o..u..2...p
0800:38B0 00 26 8B 5F 02 0E E8 01 00 C3 06 53 CB 00 00 00 .&._.......S....
0800:38C0 00 00 00 3B 02 77 04 B2 06 ED 08 27 0B 61 0D 99 ...;.w.....'.a..
0800:38D0 0F D0 11 06 14 3A 16 6C 18 9C 1A CB 1C F7 1E 20 .....:.l....... 
0800:38E0 21 48 23 6C 25 8D 27 AC 29 C7 2B DF 2D F3 2F 03 !H#l%.'.).+.-./.
0800:38F0 32 0F 34 18 36 1C 38 1C 3A 17 3C 0E 3E 00 40 EC 2.4.6.8.:.<.>.@.
0800:3900 41 D4 43 B6 45 93 47 6A 49 3C 4B 08 4D CD 4E 8D A.C.E.GjI<K.M.N.
0800:3910 50 46 52 F9 53 A6 55 4B 57 EA 58 82 5A 13 5C 9C PFR.S.UKW.X.Z.\.
0800:3920 5D 1F 5F 9A 60 0D 62 79 63 DD 64 39 66 8D 67 D9 ]._.`.byc.d9f.g.
0800:3930 68 1D 6A 59 6B 8C 6C B7 6D D9 6E F3 6F 04 71 0C h.jYk.l.m.n.o.q.
0800:3940 72 0B 73 01 74 EF 74 D3 75 AD 76 7F 77 47 78 06 r.s.t.t.u.v.wGx.
0800:3950 79 BC 79 68 7A 0A 7B A3 7B 32 7C B8 7C 33 7D A5 y.yhz.{.{2|.|3}.
0800:3960 7D 0E 7E 6C 7E C1 7E 0B 7F 4C 7F 83 7F B0 7F D3 }.~l~.~..L......
0800:3970 7F EC 7F FB 7F 00 80 55 83 EC 00 8B EC 83 46 04 .......U......F.
0800:3980 5A EB 07 90 55 83 EC 00 8B EC C6 06 00 10 00 8B Z...U...........
0800:3990 46 04 85 C0 7D 06 F7 D8 F6 16 00 10 33 D2 B9 68 F...}.......3..h
0800:39A0 01 F7 F9 8B C2 3D B4 00 7E 07 2D B4 00 F6 16 00 .....=..~.-.....
0800:39B0 10 3D 5A 00 7E 05 F7 D8 05 B4 00 D1 E0 8B F0 8B .=Z.~...........
0800:39C0 9C 01 10 8B CB 33 C0 F8 D1 D3 D1 D0 80 3E 00 10 .....3.......>..
0800:39D0 00 74 0A F7 D3 F7 D0 83 C3 01 15 00 00 83 C4 00 .t..............
0800:39E0 5D C3 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ]...............
0800:39F0 00 00 00 00 00 00 00 00 00 00 00 00 C6 06 83 00 ................
0800:3A00 01 80 3E 92 00 00 75 39 E8 F2 01 73 0C 91 87 DA ..>...u9...s....
0800:3A10 E8 EA 01 91 87 DA 73 01 C3 A3 34 11 89 1E 36 11 ......s...4...6.
0800:3A20 89 0E 38 11 89 16 3A 11 E8 28 00 80 3E 83 00 00 ..8...:..(..>...
0800:3A30 74 11 A1 34 11 8B 1E 36 11 8B 0E 38 11 8B 16 3A t..4...6...8...:
0800:3A40 11 F9 C3 B8 FF FF 8B D8 8B C8 8B D0 C6 06 83 00 ................
0800:3A50 00 F8 C3 BB 34 11 E8 F4 00 8A E8 BB 38 11 E8 EC ....4.......8...
0800:3A60 00 0A C5 75 01 C3 A1 38 11 2B 06 34 11 70 D4 A3 ...u...8.+.4.p..
0800:3A70 30 11 A1 3A 11 2B 06 36 11 70 C8 A3 32 11 BB 34 0..:.+.6.p..2..4
0800:3A80 11 E8 C9 00 8A E8 BB 38 11 E8 C1 00 8A D0 0A C5 .......8........
0800:3A90 75 01 C3 22 D5 74 06 C6 06 83 00 00 C3 22 ED 75 u..".t.......".u
0800:3AA0 03 E8 D5 00 C6 06 83 00 02 83 3E 30 11 00 75 1E ..........>0..u.
0800:3AB0 A1 36 11 3B 06 8A 00 7D 06 A1 8A 00 A3 36 11 A1 .6.;...}.....6..
0800:3AC0 8E 00 3B 06 36 11 7D 03 A3 36 11 EB 76 90 83 3E ..;.6.}..6..v..>
0800:3AD0 32 11 00 75 1E A1 34 11 3B 06 88 00 7D 06 A1 88 2..u..4.;...}...
0800:3AE0 00 A3 34 11 A1 8C 00 3B 06 34 11 7D 03 A3 34 11 ..4....;.4.}..4.
0800:3AF0 EB 51 90 A1 34 11 3B 06 88 00 7D 0D A1 88 00 50 .Q..4.;...}....P
0800:3B00 E8 9C 00 8F 06 34 11 EB 3A A1 8C 00 3B 06 34 11 .....4..:...;.4.
0800:3B10 7D 0A 50 E8 89 00 8F 06 34 11 EB 27 A1 36 11 3B }.P.....4..'.6.;
0800:3B20 06 8A 00 7D 0D A1 8A 00 50 E8 62 00 8F 06 36 11 ...}....P.b...6.
0800:3B30 EB 11 A1 8E 00 3B 06 36 11 7D 08 50 E8 4F 00 8F .....;.6.}.P.O..
0800:3B40 06 36 11 22 ED 75 03 E8 2F 00 E9 31 FF 32 D2 8B .6.".u../..1.2..
0800:3B50 07 3B 06 88 00 7D 02 B2 01 3B 06 8C 00 7E 02 B2 .;...}...;...~..
0800:3B60 02 8B 47 02 3B 06 8A 00 7D 03 80 C2 04 3B 06 8E ..G.;...}....;..
0800:3B70 00 7E 03 80 C2 08 8A C2 C3 A1 34 11 87 06 38 11 .~........4...8.
0800:3B80 A3 34 11 A1 36 11 87 06 3A 11 A3 36 11 C3 2B 06 .4..6...:..6..+.
0800:3B90 36 11 F7 2E 30 11 F7 3E 32 11 01 06 34 11 C3 2B 6...0..>2...4..+
0800:3BA0 06 34 11 F7 2E 32 11 F7 3E 30 11 01 06 36 11 C3 .4...2..>0...6..
0800:3BB0 80 3E 92 00 00 75 36 50 53 51 52 E8 3E FE 72 05 .>...u6PSQR.>.r.
0800:3BC0 87 DA E8 37 FE 5A 59 5B 58 73 23 8B 3E 88 00 8B ...7.ZY[Xs#.>...
0800:3BD0 36 8C 00 E8 19 00 91 E8 15 00 91 8B 3E 8A 00 8B 6...........>...
0800:3BE0 36 8E 00 93 E8 08 00 93 92 E8 03 00 92 F9 C3 3B 6..............;
0800:3BF0 C7 7D 03 8B C7 C3 3B C6 76 02 8B C6 C3 80 3E 92 .}....;.v.....>.
0800:3C00 00 00 75 18 3B 06 8C 00 77 14 3B 1E 8E 00 77 0E ..u.;...w.;...w.
0800:3C10 3B 06 88 00 7C 08 3B 1E 8A 00 7C 02 F9 C3 F8 C3 ;...|.;...|.....
0800:3C20 00 00 00 00 00 00 00 00 08 00 00 00 00 32 ED E3 .............2..
0800:3C30 0E 53 06 88 0E 6C 13 E8 0E 01 07 5B E8 3B 01 C3 .S...l.....[.;..
0800:3C40 80 3E 6F 00 00 75 06 E8 0D 00 E9 16 ED BE 24 00 .>o..u........$.
0800:3C50 FF 1E 70 00 E9 0C ED 22 E4 79 28 80 3E 6F 00 00 ..p....".y(.>o..
0800:3C60 75 18 50 53 51 52 BE 24 00 FF 1E 70 00 E8 0A 00 u.PSQR.$...p....
0800:3C70 5A 59 5B 58 80 E4 7F E9 DB 01 89 1E 64 13 89 0E ZY[X........d...
0800:3C80 66 13 C3 A3 60 13 89 1E 64 13 89 0E 66 13 C7 06 f...`...d...f...
0800:3C90 68 13 08 00 C6 06 99 00 00 C7 06 6A 13 00 00 C7 h..........j....
0800:3CA0 06 68 15 00 00 80 3E 7C 00 03 74 17 22 C0 74 19 .h....>|..t.".t.
0800:3CB0 E8 4F 02 83 3E 68 15 00 74 0F C6 06 99 00 FF 89 .O..>h..t.......
0800:3CC0 1E 68 13 C7 06 6A 13 FF FF 8B 1E 64 13 8B 0E 66 .h...j.....d...f
0800:3CD0 13 80 3E 99 00 00 74 03 E8 54 00 A1 60 13 8B 16 ..>...t..T..`...
0800:3CE0 62 13 80 3E 99 00 00 74 05 E8 46 01 EB 19 0B DB b..>...t..F.....
0800:3CF0 75 05 BB 08 00 8B CB 33 D2 80 3E 6F 00 00 75 07 u......3..>o..u.
0800:3D00 BE 24 00 FF 1E 70 00 89 1E 64 13 89 0E 66 13 C3 .$...p...d...f..
0800:3D10 00 00 03 05 02 03 03 04 01 01 04 03 05 03 02 01 ................
0800:3D20 05 02 03 01 04 01 E8 06 00 A1 60 13 E9 03 01 8B ..........`.....
0800:3D30 1E 68 13 83 FB 0A 72 03 BB 0A 00 D0 E3 8B 9F 50 .h....r........P
0800:3D40 14 8A CF 32 ED 32 FF C3 A1 F0 02 8B 1E F2 02 53 ...2.2.........S
0800:3D50 8B D8 80 3E 6A 13 00 75 03 E8 4F 00 58 53 8B D8 ...>j..u..O.XS..
0800:3D60 80 3E 6B 13 00 75 03 E8 68 00 58 A3 F0 02 89 1E .>k..u..h.X.....
0800:3D70 F2 02 BE 08 00 FF 1E 70 00 C3 80 3E 6A 13 00 75 .......p...>j..u
0800:3D80 08 A1 F0 02 23 C0 79 01 C3 8A 0E 6C 13 32 ED A1 ....#.y....l.2..
0800:3D90 62 13 80 3E 7C 00 00 75 0A 80 3E 99 00 00 74 03 b..>|..u..>...t.
0800:3DA0 E9 46 03 BE 26 00 FF 1E 70 00 C3 A1 66 13 80 3E .F..&...p...f..>
0800:3DB0 61 13 01 74 10 80 3E 62 13 00 74 15 A0 6C 13 32 a..t..>b..t..l.2
0800:3DC0 E4 F7 26 64 13 80 3E 62 13 01 75 03 D1 E8 48 2B ..&d..>b..u...H+
0800:3DD0 D8 C3 A1 66 13 80 3E 61 13 01 75 09 A0 6C 13 32 ...f..>a..u..l.2
0800:3DE0 E4 F7 26 64 13 80 3E 63 13 02 74 0B 80 3E 63 13 ..&d..>c..t..>c.
0800:3DF0 01 75 02 D1 E8 2B D8 C3 00 00 00 00 00 00 00 00 .u...+..........
0800:3E00 FF 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 ................
0800:3E10 01 00 2B 00 00 00 00 00 00 00 00 00 00 00 00 00 ..+.............
0800:3E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0800:3E30 00 00 80 3E 7C 00 03 74 1B 88 26 41 15 3A 06 40 ...>|..t..&A.:.@
0800:3E40 15 74 27 A2 40 15 53 51 E8 85 00 59 5B 72 1B C6 .t'.@.SQ...Y[r..
0800:3E50 06 40 15 FF C3 A3 4A 15 89 1E 4C 15 89 0E 4E 15 .@....J...L...N.
0800:3E60 89 16 50 15 33 DB 89 1E 68 13 23 DB 75 24 A1 4A ..P.3...h.#.u$.J
0800:3E70 15 A3 42 15 A1 4E 15 A3 46 15 A1 4C 15 23 C0 75 ..B..N..F..L.#.u
0800:3E80 01 40 A3 44 15 A1 50 15 23 C0 75 01 40 A3 48 15 .@.D..P.#.u.@.H.
0800:3E90 EB 31 89 1E 42 15 89 1E 46 15 89 0E 44 15 89 0E .1..B...F...D...
0800:3EA0 48 15 80 3E 41 15 00 75 1A 8B 1E 81 00 B9 10 27 H..>A..u.......'
0800:3EB0 3B D9 73 0F F7 E1 F7 F3 8B D8 23 DB 75 01 43 89 ;.s.......#.u.C.
0800:3EC0 1E 42 15 E8 4B 00 8B 1E 6A 15 8B 0E 6C 15 F9 C3 .B..K...j...l...
0800:3ED0 A1 68 15 23 C0 75 06 C6 06 40 15 FF C3 C7 06 66 .h.#.u...@.....f
0800:3EE0 15 00 00 C5 36 66 15 B9 10 00 BF 52 15 0E 07 F3 ....6f.....R....
0800:3EF0 A4 0E 1F 80 3E 52 15 2B C6 06 59 15 00 F9 74 01 ....>R.+..Y...t.
0800:3F00 F5 C3 8E C2 33 F6 26 80 3C 2B 75 04 89 16 68 15 ....3.&.<+u...h.
0800:3F10 C3 A0 5A 15 2A 06 5C 15 32 E4 50 F7 26 42 15 F7 ..Z.*.\.2.P.&B..
0800:3F20 36 44 15 A3 6A 15 58 F7 26 46 15 F7 36 48 15 A3 6D..j.X.&F..6H..
0800:3F30 6C 15 C3 E8 09 00 8B 1E 6E 15 8B 0E 6C 15 C3 53 l.......n...l..S
0800:3F40 51 E8 CD FF A1 53 15 D1 E0 05 10 00 C5 3E 66 15 Q....S.......>f.
0800:3F50 03 F8 33 D2 E3 1E 26 8A 07 43 2E 2A 06 56 15 2E ..3...&..C.*.V..
0800:3F60 3A 06 53 15 73 0C 32 E4 8B F7 03 F0 02 14 73 02 :.S.s.2.......s.
0800:3F70 FE C6 E2 E2 0E 1F 8B C2 F7 26 42 15 F7 36 44 15 .........&B..6D.
0800:3F80 A3 6E 15 59 5B C3 C7 06 62 15 00 00 C7 06 64 15 .n.Y[...b.....d.
0800:3F90 00 00 2A 06 56 15 3A 06 53 15 72 01 C3 32 E4 D1 ..*.V.:.S.r..2..
0800:3FA0 E0 C4 3E 66 15 8B DF 83 C3 10 03 D8 26 03 3F 03 ..>f........&.?.
0800:3FB0 3E 57 15 80 3E 59 15 00 74 05 EB 77 90 5F 07 E8 >W..>Y..t..w._..
0800:3FC0 59 00 06 57 D0 E0 32 E4 8B F8 FF A5 0E 17 16 17 Y..W..2.........
0800:3FD0 45 17 3B 17 47 17 A1 62 15 8B 1E 64 15 8A 0E 92 E.;.G..b...d....
0800:3FE0 00 80 E1 01 8A 2E 41 15 3A CD 75 08 22 C9 74 05 ......A.:.u.".t.
0800:3FF0 F7 D8 EB 01 93 E8 AB 01 5F 07 C3 E8 93 00 A3 62 ........_......b
0800:4000 15 89 1E 64 15 EB B6 E8 87 00 8B C8 8B D3 87 0E ...d............
0800:4010 62 15 87 16 64 15 E8 95 01 EB A2 26 8B 0D 86 E9 b...d......&....
0800:4020 47 47 32 C0 F6 C5 80 74 02 04 02 F6 C1 80 74 02 GG2....t......t.
0800:4030 FE C0 C3 06 57 33 C0 E8 33 ED 5F 07 E8 DC FF 06 ....W3..3._.....
0800:4040 57 D0 E0 32 E4 8B F8 FF 95 8F 17 5F 07 EB ED 97 W..2......._....
0800:4050 17 A5 17 B0 17 B0 17 FF 0E A1 04 B8 03 00 E8 0C ................
0800:4060 ED 58 E9 71 FF B8 03 00 E8 02 ED 33 C0 E9 FD EC .X.q.......3....
0800:4070 E8 1E 00 A3 62 15 89 1E 64 15 F7 DB 80 3E 92 00 ....b...d....>..
0800:4080 00 74 03 F7 D8 93 03 06 F0 02 03 1E F2 02 E9 97 .t..............
0800:4090 EB 8A C5 E8 10 00 E8 22 00 50 8A C1 E8 07 00 E8 .......".P......
0800:40A0 30 00 8B D8 58 C3 33 D2 24 7F 8A D8 32 FF 24 40 0...X.3.$...2.$@
0800:40B0 74 06 FE CF 4A 80 CB 80 8B C3 C3 8B 1E 42 15 83 t...J........B..
0800:40C0 FB 01 74 02 F7 EB 8B 1E 44 15 83 FB 01 74 02 F7 ..t.....D....t..
0800:40D0 FB C3 8B 1E 46 15 83 FB 01 74 02 F7 EB 8B 1E 48 ....F....t.....H
0800:40E0 15 83 FB 01 74 02 F7 FB C3 80 3E 40 15 FF 74 45 ....t.....>@..tE
0800:40F0 E3 43 FF 36 9E 00 A3 70 15 06 53 E8 38 00 51 32 .C.6...p..S.8.Q2
0800:4100 C0 B9 01 00 E8 74 EA 80 3E 59 15 00 74 08 A1 9A .....t..>Y..t...
0800:4110 00 86 C4 E8 3A EA 59 5B 07 26 8A 07 22 C0 74 0C ....:.Y[.&..".t.
0800:4120 06 53 51 E8 60 FE 59 5B 07 43 E2 ED 58 50 E8 4A .SQ.`.Y[.C..XP.J
0800:4130 EA 8F 06 9E 00 C3 51 E8 05 FE E8 05 00 E8 35 00 ......Q.......5.
0800:4140 59 C3 A1 6E 15 80 3E 41 15 00 74 07 A1 6C 15 01 Y..n..>A..t..l..
0800:4150 06 F0 02 80 3E 70 15 00 74 1A 80 3E 70 15 01 75 ....>p..t..>p..u
0800:4160 03 D1 E8 48 80 3E 92 00 00 74 05 01 06 F2 02 C3 ...H.>...t......
0800:4170 29 06 F0 02 C3 A1 6E 15 80 3E 41 15 00 75 03 A1 ).....n..>A..u..
0800:4180 6C 15 80 3E 71 15 00 74 19 80 3E 71 15 01 75 02 l..>q..t..>q..u.
0800:4190 D1 E8 80 3E 92 00 00 74 05 01 06 F0 02 C3 01 06 ...>...t........
0800:41A0 F2 02 C3 F7 DB 01 1E F2 02 01 06 F0 02 C3 50 A0 ..............P.
0800:41B0 92 00 24 01 8A 26 41 15 3A C4 75 0B 22 C0 58 74 ..$..&A.:.u.".Xt
0800:41C0 0E F7 D8 F7 D9 EB 0C 58 93 87 CA F7 D8 F7 D9 F7 .......X........
0800:41D0 DB F7 DA 03 06 F0 02 03 1E F2 02 03 0E F0 02 03 ................
0800:41E0 16 F2 02 E8 16 F8 73 07 BE 0C 00 FF 1E 70 00 C3 ......s......p..
0800:41F0 00 00 00 00 00 00 00 00                         ........       

fn0800_41F8()
	pop	word ptr cs:[41F0]
	pop	word ptr cs:[41F2]
	mov	cs:[41F4],ds
	cld	
	mov	es,[0090]
	mov	si,0080
	xor	ah,ah
	lodsb	
	inc	ax
	mov	bp,es
	xchg	si,dx
	xchg	ax,bx
	mov	si,[008A]
	add	si,02
	mov	cx,0001
	cmp	byte ptr [0092],03
	jc	423B

l0800_422A:
	mov	es,[008C]
	mov	di,si
	mov	cl,7F
	xor	al,al

l0800_4234:
	repne	
	scasb	

l0800_4236:
	jcxz	42AE

l0800_4238:
	xor	cl,7F

l0800_423B:
	sub	sp,02
	mov	ax,0001
	add	ax,bx
	add	ax,cx
	and	ax,FFFE
	mov	di,sp
	sub	di,ax
	jc	42AE

l0800_424E:
	mov	sp,di
	mov	ax,es
	mov	ds,ax
	mov	ax,ss
	mov	es,ax
	push	cx
	dec	cx

l0800_425A:
	rep	
	movsb	

l0800_425C:
	xor	al,al
	stosb	
	mov	ds,bp
	xchg	dx,si
	xchg	cx,bx
	mov	ax,bx
	mov	dx,ax
	inc	bx

l0800_426A:
	call	4286
	ja	4276

l0800_426F:
	jc	42B3

l0800_4271:
	call	4286
	ja	426F

l0800_4276:
	cmp	al,20
	jz	4282

l0800_427A:
	cmp	al,0D
	jz	4282

l0800_427E:
	cmp	al,09
	jnz	426A

l0800_4282:
	xor	al,al
	jmp	426A

fn0800_4286()
	or	ax,ax
	jz	4291

l0800_428A:
	inc	dx
	stosb	
	or	al,al
	jnz	4291

l0800_4290:
	inc	bx

l0800_4291:
	xchg	al,ah
	xor	al,al
	stc	
	jcxz	42AD

l0800_4298:
	lodsb	
	dec	cx
	sub	al,22
	jz	42AD

l0800_429E:
	add	al,22
	cmp	al,5C
	jnz	42AB

l0800_42A4:
	cmp	byte ptr [si],22
	jnz	42AB

l0800_42A9:
	lodsb	
	dec	cx

l0800_42AB:
	or	si,si

l0800_42AD:
	ret	

l0800_42AE:
	jmp	far 0800:01ED

l0800_42B3:
	pop	cx
	add	cx,dx
	mov	ds,cs:[41F4]
	mov	[0084],bx
	inc	bx
	add	bx,bx
	mov	si,sp
	mov	bp,sp
	sub	bp,bx
	jc	42AE

l0800_42CA:
	mov	sp,bp
	mov	[0086],bp

l0800_42D0:
	jcxz	42E0

l0800_42D2:
	mov	[bp+00],si
	add	bp,02

l0800_42D8:
	lodsb	
	or	al,al
	loopne	42D8

l0800_42DE:
	jz	42D0

l0800_42E0:
	xor	ax,ax
	mov	[bp+00],ax
	jmp	dword ptr cs:[41F0]

fn0800_42EA()
	mov	cx,[008A]
	push	cx
	call	far 1192:00EF
	pop	cx
	mov	di,ax
	or	ax,ax
	jz	4321

l0800_42FB:
	push	ds
	push	ds
	pop	es
	mov	ds,[008C]
	xor	si,si
	cld	

l0800_4305:
	rep	
	movsb	

l0800_4307:
	pop	ds
	mov	di,ax
	push	es
	push	word ptr [008E]
	call	far 1192:00EF
	add	sp,02
	mov	bx,ax
	pop	es
	mov	[0088],ax
	or	ax,ax
	jnz	4326

l0800_4321:
	jmp	far 0800:01ED

l0800_4326:
	xor	ax,ax
	mov	cx,FFFF

l0800_432B:
	mov	[bx],di
	add	bx,02

l0800_4330:
	repne	
	scasb	

l0800_4332:
	cmp	es:[di],al
	jnz	432B

l0800_4337:
	mov	[bx],ax
	retf	

fn0800_433A()
	push	si
	xchg	ax,si
	xchg	ax,dx
	test	ax,ax
	jz	4343

l0800_4341:
	mul	bx

l0800_4343:
	xchg	ax,cx
	test	ax,ax
	jz	434C

l0800_4348:
	mul	si
	add	cx,ax

l0800_434C:
	xchg	ax,si
	mul	bx
	add	dx,cx
	pop	si
	retf	
0800:4353          BA 58 13 EB 03 BA 5D 13 B9 05 00 90 B4    .X....]......
0800:4360 40 BB 02 00 CD 21 B9 27 00 90 BA 62 13 B4 40 CD @....!.'...b..@.
0800:4370 21 EA ED 01 00 08                               !.....         

fn0800_4376()
	jmp	dword ptr [1470]
0800:437A                               55 8B EC EB 17 C4           U.....
0800:4380 5E 06 FF 46 06 26 8A 07 8B 5E 04 FF 46 04 3A 07 ^..F.&...^..F.:.
0800:4390 74 04 33 C0 EB 0D 8B 5E 04 80 3F 00 75 E1 B8 01 t.3....^..?.u...
0800:43A0 00 EB 00 5D C2 06 00 B8 30 11 B7 00 B2 FF 9A BC ...]....0.......
0800:43B0 43 00 08 8A C2 FE C0 B4 00 EB 00 C3 56 57 89 2E C...........VW..
0800:43C0 00 7A CD 10 8B 2E 00 7A 5F 5E CB B4 0F 0E E8 EB .z.....z_^......
0800:43D0 FF 50 9A EC 43 00 08 59 B4 08 B7 00 0E E8 DC FF .P..C..Y........
0800:43E0 80 E4 7F 88 26 09 14 88 26 08 14 CB 55 8B EC 8A ....&...&...U...
0800:43F0 46 06 3C 03 76 06 3C 07 74 02 B0 03 A2 0A 14 B4 F.<.v.<.t.......
0800:4400 0F 0E E8 B7 FF 3A 06 0A 14 74 12 A0 0A 14 B4 00 .....:...t......
0800:4410 0E E8 A8 FF B4 0F 0E E8 A2 FF A2 0A 14 88 26 0C ..............&.
0800:4420 14 80 3E 0A 14 03 76 0C 80 3E 0A 14 07 74 05 B8 ..>...v..>...t..
0800:4430 01 00 EB 02 33 C0 A2 0D 14 C6 06 0B 14 19 80 3E ....3..........>
0800:4440 0A 14 07 74 1F BA 00 F0 B8 EA FF 52 50 B8 15 14 ...t.......RP...
0800:4450 50 E8 26 FF 0B C0 75 0C E8 4C FF 0B C0 75 05 B8 P.&...u..L...u..
0800:4460 01 00 EB 02 33 C0 A2 0E 14 80 3E 0A 14 07 75 05 ....3.....>...u.
0800:4470 B8 00 B0 EB 03 B8 00 B8 A3 11 14 C7 06 0F 14 00 ................
0800:4480 00 B0 00 A2 05 14 A2 04 14 A0 0C 14 04 FF A2 06 ................
0800:4490 14 C6 06 07 14 18 5D CB CB                      ......]..      

fn0800_4499()
	push	bp
	mov	bp,sp
	push	word ptr [bp+06]
	call	far 118C:000A
	pop	cx
	pop	bp
	retf	
0800:44A7                      33 C9 EB 0D B9 01 00 EB 08        3........
0800:44B0 B9 02 00 EB 03 B9 03 00 55 56 57 8B EC 8B F9 8B ........UVW.....
0800:44C0 46 0A 8B 56 0C 8B 5E 0E 8B 4E 10 0B C9 75 08 0B F..V..^..N...u..
0800:44D0 D2 74 69 0B DB 74 65 F7 C7 01 00 75 1C 0B D2 79 .ti..te....u...y
0800:44E0 0A F7 DA F7 D8 83 DA 00 83 CF 0C 0B C9 79 0A F7 .............y..
0800:44F0 D9 F7 DB 83 D9 00 83 F7 04 8B E9 B9 20 00 57 33 ............ .W3
0800:4500 FF 33 F6 D1 E0 D1 D2 D1 D6 D1 D7 3B FD 72 0B 77 .3.........;.r.w
0800:4510 04 3B F3 72 05 2B F3 1B FD 40 E2 E7 5B F7 C3 02 .;.r.+...@..[...
0800:4520 00 74 06 8B C6 8B D7 D1 EB F7 C3 04 00 74 07 F7 .t...........t..
0800:4530 DA F7 D8 83 DA 00 5F 5E 5D CA 08 00 F7 F3 F7 C7 ......_^].......
0800:4540 02 00 74 02 8B C2 33 D2 EB EC                   ..t...3...     

fn0800_454A()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	lds	si,[bp+06]
	les	di,[bp+0A]
	cld	
	shr	cx,01

l0800_4559:
	rep	
	movsw	

l0800_455B:
	adc	cx,cx

l0800_455D:
	rep	
	movsb	

l0800_455F:
	pop	ds
;;; Segment 0C56 (0C56:0000)
0C56:0000 5F 5E 5D CA 08 00                               _^]...         

fn0C56_0006()
	push	bp
	mov	bp,sp
	mov	ax,01A2
	push	ax
	call	far 1263:0003
	pop	cx
	mov	ax,0001
	push	ax
	mov	ax,01CB
	push	ax
	call	far 11AF:003C
	pop	cx
	pop	cx
	mov	[7818],ax
	mov	ax,015E
	push	ax
	mov	ax,781A
	push	ax
	push	word ptr [7818]
	call	far 1212:0003
	add	sp,06
	push	word ptr [7818]
	call	far 120A:0009
	pop	cx
	mov	ax,01D6
	push	ax
	call	far 1263:0003
	pop	cx
	mov	ax,01EF
	push	ax
	call	far 1263:0003
	pop	cx
	call	far 0C56:12FF
	mov	word ptr [6203],0001
	mov	word ptr [6205],0000
	push	ds
	mov	ax,0214
	push	ax
	push	ds
	mov	ax,6205
	push	ax
	push	ds
	mov	ax,6203
	push	ax
	call	far 0800:0F94
	add	sp,0C
	call	far 0C56:0D28
	call	far 0C56:0E36
	call	far 0C56:0BB9
	call	far 0C56:1D96
	call	far 0C56:1B84
	call	far 0C56:132B
	xor	ax,ax
	mov	[622C],ax
	mov	[625C],ax
	mov	[627C],ax
	mov	[625A],ax
	mov	[621C],ax
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	cld	
	int	3D
	add	sp,04
	int	35
	push	ss
	adc	al,78
	int	3D
	call	far 0800:0604
	mov	[6272],ax
	mov	word ptr [620C],0098
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,781A
	push	ax
	mov	ax,0090
	push	ax
	push	word ptr [620C]
	call	far 0800:1B27
	add	sp,0A
	mov	word ptr [6214],0005
	mov	ax,0002
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	mov	word ptr [6264],0000
	xor	ax,ax
	push	ax
	call	far 138D:0040
	pop	cx
	push	ax
	call	far 1347:0005
	pop	cx
	call	far 1347:0016
	mov	bx,00D6
	cwd	
	idiv	bx
	add	dx,0A
	mov	[626C],dx
	xor	ax,ax
	mov	[6274],ax
	mov	[621E],ax
	mov	dx,4120
	xor	ax,ax
	mov	[6262],dx
	mov	[6260],ax
	call	far 1347:0016
	mov	bx,03E8
	cwd	
	idiv	bx
	mov	ax,0064
	mov	bx,[620E]
	inc	bx
	push	dx
	cwd	
	idiv	bx
	pop	dx
	cmp	dx,ax
	jge	0197

l0C56_0155:
	cmp	word ptr [627C],00
	jnz	0197

l0C56_015C:
	cmp	word ptr [625C],00
	jnz	0197

l0C56_0163:
	cmp	word ptr [622C],00
	jnz	0197

l0C56_016A:
	mov	word ptr [622C],0001
	mov	dx,4160
	xor	ax,ax
	mov	[628C],dx
	mov	[628A],ax

l0C56_017C:
	call	far 1347:0016
	mov	bx,00D6
	cwd	
	idiv	bx
	add	dx,0A
	mov	[6288],dx
	mov	ax,[6288]
	cmp	ax,[626C]
	jz	017C

l0C56_0197:
	call	far 1347:0016
	mov	bx,03E8
	cwd	
	idiv	bx
	mov	ax,00C8
	mov	bx,[620E]
	inc	bx
	push	dx
	cwd	
	idiv	bx
	pop	dx
	cmp	dx,ax
	jge	01F5

l0C56_01B3:
	cmp	word ptr [627C],00
	jnz	01F5

l0C56_01BA:
	cmp	word ptr [625C],00
	jnz	01F5

l0C56_01C1:
	cmp	word ptr [622C],00
	jnz	01F5

l0C56_01C8:
	mov	word ptr [627C],0001
	mov	dx,4160
	xor	ax,ax
	mov	[627A],dx
	mov	[6278],ax

l0C56_01DA:
	call	far 1347:0016
	mov	bx,00D6
	cwd	
	idiv	bx
	add	dx,0A
	mov	[6276],dx
	mov	ax,[6276]
	cmp	ax,[626C]
	jz	01DA

l0C56_01F5:
	call	far 1347:0016
	mov	bx,03E8
	cwd	
	idiv	bx
	mov	ax,00C8
	mov	bx,[620E]
	inc	bx
	push	dx
	cwd	
	idiv	bx
	pop	dx
	cmp	dx,ax
	jge	0253

l0C56_0211:
	cmp	word ptr [627C],00
	jnz	0253

l0C56_0218:
	cmp	word ptr [625C],00
	jnz	0253

l0C56_021F:
	cmp	word ptr [622C],00
	jnz	0253

l0C56_0226:
	mov	word ptr [625C],0001
	mov	dx,4160
	xor	ax,ax
	mov	[621A],dx
	mov	[6218],ax

l0C56_0238:
	call	far 1347:0016
	mov	bx,00D6
	cwd	
	idiv	bx
	add	dx,0A
	mov	[6216],dx
	mov	ax,[6216]
	cmp	ax,[626C]
	jz	0238

l0C56_0253:
	mov	dx,4120
	xor	ax,ax
	mov	[6270],dx
	mov	[626E],ax
	jmp	0A49
0C56:0262       CD 35 06 6E 62 9A 04 06 00 08 A3 86 62 83   .5.nb.......b.
0C56:0270 3E 86 62 0A 7E 21 B8 01 00 50 1E B8 60 78 50 A1 >.b.~!...P..`xP.
0C56:0280 86 62 48 50 CD 35 06 82 62 9A 04 06 00 08 50 9A .bHP.5..b.....P.
0C56:0290 27 1B 00 08 83 C4 0A CD 35 06 6E 62 CD 38 0E 78 '.......5.nb.8.x
0C56:02A0 02 CD 38 36 80 02 83 EC 08 CD 39 5E F8 CD 3D 9A ..86......9^..=.
0C56:02B0 07 00 E4 10 83 C4 08 CD 38 0E 88 02 A1 6C 62 99 ........8....lb.
0C56:02C0 52 50 CD 37 46 FC CD 3D 83 C4 04 CD 3A C1 CD 35 RP.7F..=....:..5
0C56:02D0 1E 82 62 CD 3D CD 35 06 90 02 CD 35 06 82 62 CD ..b.=.5....5..b.
0C56:02E0 3A D9 CD 39 3E 78 79 CD 3D 8A 26 79 79 9E 73 0C :..9>xy.=.&yy.s.
0C56:02F0 BA 30 41 33 C0 89 16 84 62 A3 82 62 CD 35 06 94 .0A3....b..b.5..
0C56:0300 02 CD 35 06 82 62 CD 3A D9 CD 39 3E 78 79 CD 3D ..5..b.:..9>xy.=
0C56:0310 8A 26 79 79 9E 76 0C BA 60 43 33 C0 89 16 84 62 .&yy.v..`C3....b
0C56:0320 A3 82 62 B8 01 00 50 1E B8 60 78 50 FF 36 86 62 ..b...P..`xP.6.b
0C56:0330 CD 35 06 82 62 9A 04 06 00 08 50 9A 27 1B 00 08 .5..b.....P.'...
0C56:0340 83 C4 0A 83 3E 0E 62 00 75 03 E9 C6 00 9A 16 00 ....>.b.u.......
0C56:0350 47 13 BB E8 03 99 F7 FB 83 FA 32 7C 03 E9 B3 00 G.........2|....
0C56:0360 83 3E 86 62 70 7E 03 E9 A9 00 A1 72 62 A3 80 62 .>.bp~.....rb..b
0C56:0370 C7 06 72 62 00 00 B8 01 00 50 B8 01 00 50 B8 96 ..rb.....P...P..
0C56:0380 00 50 A1 86 62 05 10 00 50 CD 35 06 82 62 CD 38 .P..b...P.5..b.8
0C56:0390 06 98 02 9A 04 06 00 08 50 9A 3D 15 56 0C 83 C4 ........P.=.V...
0C56:03A0 0A A3 12 62 A1 80 62 A3 72 62 83 3E 12 62 00 74 ...b..b.rb.>.b.t
0C56:03B0 62 A1 0C 62 99 52 50 CD 37 46 FC CD 3D 83 C4 04 b..b.RP.7F..=...
0C56:03C0 CD 35 06 82 62 CD 3A E9 9A 04 06 00 08 99 33 C2 .5..b.:.......3.
0C56:03D0 2B C2 3D 08 00 7D 3C B8 98 00 50 A1 0C 62 05 08 +.=..}<...P..b..
0C56:03E0 00 50 9A 1C 17 56 0C 59 59 FF 0E 14 62 C7 06 0C .P...V.YY...b...
0C56:03F0 62 98 00 83 3E 14 62 00 74 19 B8 01 00 50 1E B8 b...>.b.t....P..
0C56:0400 1A 78 50 B8 90 00 50 FF 36 0C 62 9A 27 1B 00 08 .xP...P.6.b.'...
0C56:0410 83 C4 0A 83 3E 2C 62 01 74 03 E9 87 00 CD 35 06 ....>,b.t.....5.
0C56:0420 A0 02 CD 35 06 8A 62 CD 3A D9 CD 39 3E 78 79 CD ...5..b.:..9>xy.
0C56:0430 3D 8A 26 79 79 9E 73 6C CD 35 06 A4 02 CD 35 06 =.&yy.sl.5....5.
0C56:0440 8A 62 CD 3A D9 CD 39 3E 78 79 CD 3D 8A 26 79 79 .b.:..9>xy.=.&yy
0C56:0450 9E 76 20 B8 01 00 50 1E B8 EC 78 50 CD 35 06 8A .v ...P...xP.5..
0C56:0460 62 9A 04 06 00 08 50 FF 36 88 62 9A 27 1B 00 08 b.....P.6.b.'...
0C56:0470 83 C4 0A CD 35 06 8A 62 CD 38 06 A8 02 CD 35 1E ....5..b.8....5.
0C56:0480 8A 62 CD 3D B8 01 00 50 1E B8 EC 78 50 CD 35 06 .b.=...P...xP.5.
0C56:0490 8A 62 9A 04 06 00 08 50 FF 36 88 62 9A 27 1B 00 .b.....P.6.b.'..
0C56:04A0 08 83 C4 0A 83 3E 2C 62 01 75 4D CD 35 06 A0 02 .....>,b.uM.5...
0C56:04B0 CD 35 06 8A 62 CD 3A D9 CD 39 3E 78 79 CD 3D 8A .5..b.:..9>xy.=.
0C56:04C0 26 79 79 9E 72 32 C7 06 2C 62 00 00 B8 01 00 50 &yy.r2..,b.....P
0C56:04D0 1E B8 EC 78 50 CD 35 06 8A 62 9A 04 06 00 08 50 ...xP.5..b.....P
0C56:04E0 FF 36 88 62 9A 27 1B 00 08 83 C4 0A BA 60 41 33 .6.b.'.......`A3
0C56:04F0 C0 89 16 8C 62 A3 8A 62 83 3E 7C 62 01 74 03 E9 ....b..b.>|b.t..
0C56:0500 87 00 CD 35 06 A0 02 CD 35 06 78 62 CD 3A D9 CD ...5....5.xb.:..
0C56:0510 39 3E 78 79 CD 3D 8A 26 79 79 9E 73 6C CD 35 06 9>xy.=.&yy.sl.5.
0C56:0520 A4 02 CD 35 06 78 62 CD 3A D9 CD 39 3E 78 79 CD ...5.xb.:..9>xy.
0C56:0530 3D 8A 26 79 79 9E 76 20 B8 01 00 50 1E B8 A6 78 =.&yy.v ...P...x
0C56:0540 50 CD 35 06 78 62 9A 04 06 00 08 50 FF 36 76 62 P.5.xb.....P.6vb
0C56:0550 9A 27 1B 00 08 83 C4 0A CD 35 06 78 62 CD 38 06 .'.......5.xb.8.
0C56:0560 A8 02 CD 35 1E 78 62 CD 3D B8 01 00 50 1E B8 A6 ...5.xb.=...P...
0C56:0570 78 50 CD 35 06 78 62 9A 04 06 00 08 50 FF 36 76 xP.5.xb.....P.6v
0C56:0580 62 9A 27 1B 00 08 83 C4 0A 83 3E 7C 62 01 75 4D b.'.......>|b.uM
0C56:0590 CD 35 06 A0 02 CD 35 06 78 62 CD 3A D9 CD 39 3E .5....5.xb.:..9>
0C56:05A0 78 79 CD 3D 8A 26 79 79 9E 72 32 C7 06 7C 62 00 xy.=.&yy.r2..|b.
0C56:05B0 00 B8 01 00 50 1E B8 A6 78 50 CD 35 06 78 62 9A ....P...xP.5.xb.
0C56:05C0 04 06 00 08 50 FF 36 76 62 9A 27 1B 00 08 83 C4 ....P.6vb.'.....
0C56:05D0 0A BA 60 41 33 C0 89 16 7A 62 A3 78 62 83 3E 5C ..`A3...zb.xb.>\
0C56:05E0 62 01 74 03 E9 87 00 CD 35 06 A0 02 CD 35 06 18 b.t.....5....5..
0C56:05F0 62 CD 3A D9 CD 39 3E 78 79 CD 3D 8A 26 79 79 9E b.:..9>xy.=.&yy.
0C56:0600 73 6C CD 35 06 A4 02 CD 35 06 18 62 CD 3A D9 CD sl.5....5..b.:..
0C56:0610 39 3E 78 79 CD 3D 8A 26 79 79 9E 76 20 B8 01 00 9>xy.=.&yy.v ...
0C56:0620 50 1E B8 32 79 50 CD 35 06 18 62 9A 04 06 00 08 P..2yP.5..b.....
0C56:0630 50 FF 36 16 62 9A 27 1B 00 08 83 C4 0A CD 35 06 P.6.b.'.......5.
0C56:0640 18 62 CD 38 06 A8 02 CD 35 1E 18 62 CD 3D B8 01 .b.8....5..b.=..
0C56:0650 00 50 1E B8 32 79 50 CD 35 06 18 62 9A 04 06 00 .P..2yP.5..b....
0C56:0660 08 50 FF 36 16 62 9A 27 1B 00 08 83 C4 0A 83 3E .P.6.b.'.......>
0C56:0670 5C 62 01 75 4D CD 35 06 A0 02 CD 35 06 18 62 CD \b.uM.5....5..b.
0C56:0680 3A D9 CD 39 3E 78 79 CD 3D 8A 26 79 79 9E 72 32 :..9>xy.=.&yy.r2
0C56:0690 C7 06 5C 62 00 00 B8 01 00 50 1E B8 32 79 50 CD ..\b.....P..2yP.
0C56:06A0 35 06 18 62 9A 04 06 00 08 50 FF 36 16 62 9A 27 5..b.....P.6.b.'
0C56:06B0 1B 00 08 83 C4 0A BA 60 41 33 C0 89 16 1A 62 A3 .......`A3....b.
0C56:06C0 18 62 BB 40 00 8E C3 BB 17 00 26 8A 07 24 0F A2 .b.@......&..$..
0C56:06D0 07 62 A0 07 62 98 3D 01 00 74 47 3D 02 00 74 03 .b..b.=..tG=..t.
0C56:06E0 E9 7F 00 83 3E 0C 62 0A 7E 36 B8 01 00 50 1E B8 ....>.b.~6...P..
0C56:06F0 1A 78 50 B8 90 00 50 FF 36 0C 62 9A 27 1B 00 08 .xP...P.6.b.'...
0C56:0700 83 C4 0A FF 0E 0C 62 B8 01 00 50 1E B8 1A 78 50 ......b...P...xP
0C56:0710 B8 90 00 50 FF 36 0C 62 9A 27 1B 00 08 83 C4 0A ...P.6.b.'......
0C56:0720 EB 40 81 3E 0C 62 E0 00 7D 36 B8 01 00 50 1E B8 .@.>.b..}6...P..
0C56:0730 1A 78 50 B8 90 00 50 FF 36 0C 62 9A 27 1B 00 08 .xP...P.6.b.'...
0C56:0740 83 C4 0A FF 06 0C 62 B8 01 00 50 1E B8 1A 78 50 ......b...P...xP
0C56:0750 B8 90 00 50 FF 36 0C 62 9A 27 1B 00 08 83 C4 0A ...P.6.b.'......
0C56:0760 EB 00 C7 06 5E 62 00 00 F6 06 07 62 08 75 03 E9 ....^b.....b.u..
0C56:0770 3F 01 9A 34 1A 56 0C A3 90 14 A1 90 14 48 3D 03 ?..4.V.......H=.
0C56:0780 00 76 03 E9 2B 01 8B D8 D1 E3 2E FF A7 8F 07 97 .v..+...........
0C56:0790 07 D9 07 24 08 68 08 C7 06 5E 62 01 00 A1 86 62 ...$.h...^b....b
0C56:07A0 05 08 00 50 CD 35 06 82 62 CD 38 06 B0 02 9A 04 ...P.5..b.8.....
0C56:07B0 06 00 08 50 9A 1C 17 56 0C 59 59 CD 35 06 14 78 ...P...V.YY.5..x
0C56:07C0 CD 38 06 B8 02 CD 35 1E 14 78 CD 3D FF 06 5A 62 .8....5..x.=..Zb
0C56:07D0 C7 06 1E 62 01 00 E9 D8 00 83 3E 7C 62 01 75 41 ...b......>|b.uA
0C56:07E0 C7 06 5E 62 01 00 CD 35 06 78 62 CD 38 06 B0 02 ..^b...5.xb.8...
0C56:07F0 9A 04 06 00 08 50 A1 76 62 05 08 00 50 9A 1C 17 .....P.vb...P...
0C56:0800 56 0C 59 59 CD 35 06 14 78 CD 38 06 C0 02 CD 35 V.YY.5..x.8....5
0C56:0810 1E 14 78 CD 3D C7 06 72 62 01 00 C7 06 7C 62 00 ..x.=..rb....|b.
0C56:0820 00 E9 8D 00 83 3E 5C 62 01 75 3B C7 06 5E 62 01 .....>\b.u;..^b.
0C56:0830 00 CD 35 06 18 62 CD 38 06 B0 02 9A 04 06 00 08 ..5..b.8........
0C56:0840 50 A1 16 62 05 08 00 50 9A 1C 17 56 0C 59 59 C7 P..b...P...V.YY.
0C56:0850 06 5C 62 00 00 CD 35 06 14 78 CD 38 06 C8 02 CD .\b...5..x.8....
0C56:0860 35 1E 14 78 CD 3D EB 49 83 3E 2C 62 01 75 40 C7 5..x.=.I.>,b.u@.
0C56:0870 06 5E 62 01 00 CD 35 06 8A 62 CD 38 06 B0 02 9A .^b...5..b.8....
0C56:0880 04 06 00 08 50 A1 88 62 05 08 00 50 9A 1C 17 56 ....P..b...P...V
0C56:0890 0C 59 59 C7 06 2C 62 00 00 CD 35 06 14 78 CD 38 .YY..,b...5..x.8
0C56:08A0 06 D0 02 CD 35 1E 14 78 CD 3D 83 06 14 62 03 EB ....5..x.=...b..
0C56:08B0 00 83 3E 14 62 05 7E 06 C7 06 14 62 05 00 B8 B2 ..>.b.~....b....
0C56:08C0 00 50 B8 04 01 50 B8 A2 00 50 B8 AA 00 50 9A 45 .P...P...P...P.E
0C56:08D0 22 00 08 83 C4 08 C7 06 2E 62 00 00 EB 24 B8 02 "........b...$..
0C56:08E0 00 50 1E B8 EC 78 50 B8 A2 00 50 A1 2E 62 B1 04 .P...xP...P..b..
0C56:08F0 D3 E0 05 AA 00 50 9A 27 1B 00 08 83 C4 0A FF 06 .....P.'........
0C56:0900 2E 62 A1 2E 62 3B 06 14 62 7C D3 83 3E 5E 62 00 .b..b;..b|..>^b.
0C56:0910 75 03 E9 19 01 CD 35 06 14 78 CD 34 1E 9A 01 CD u.....5..x.4....
0C56:0920 39 3E 78 79 CD 3D 8A 26 79 79 9E 76 40 B8 C7 00 9>xy.=.&yy.v@...
0C56:0930 50 B8 DA 00 50 B8 BF 00 50 B8 BE 00 50 9A 45 22 P...P...P...P.E"
0C56:0940 00 08 83 C4 08 C7 06 64 62 01 00 8B 16 16 78 A1 .......db.....x.
0C56:0950 14 78 89 16 9C 01 A3 9A 01 C6 06 9E 01 48 C6 06 .x...........H..
0C56:0960 9F 01 49 C6 06 A0 01 20 C6 06 A1 01 00 A1 72 62 ..I.... ......rb
0C56:0970 D1 E0 40 50 9A 6D 23 00 08 59 1E B8 9E 01 50 B8 ..@P.m#..Y....P.
0C56:0980 BF 00 50 B8 BE 00 50 9A 3B 25 00 08 83 C4 08 CD ..P...P.;%......
0C56:0990 35 06 14 78 83 EC 08 CD 39 5E F8 CD 3D B8 15 02 5..x....9^..=...
0C56:09A0 50 B8 20 62 50 9A 33 00 86 13 83 C4 0C B8 BE 00 P. bP.3.........
0C56:09B0 50 B8 B4 00 50 B8 B4 00 50 B8 64 00 50 9A 45 22 P...P...P.d.P.E"
0C56:09C0 00 08 83 C4 08 33 C0 50 9A 6D 23 00 08 59 1E B8 .....3.P.m#..Y..
0C56:09D0 20 62 50 B8 B4 00 50 B8 64 00 50 9A 3B 25 00 08  bP...P.d.P.;%..
0C56:09E0 83 C4 08 B8 C7 00 50 B8 B4 00 50 B8 BF 00 50 B8 ......P...P...P.
0C56:09F0 64 00 50 9A 45 22 00 08 83 C4 08 CD 35 06 9A 01 d.P.E"......5...
0C56:0A00 83 EC 08 CD 39 5E F8 CD 3D B8 1C 02 50 B8 20 62 ....9^..=...P. b
0C56:0A10 50 9A 33 00 86 13 83 C4 0C 1E B8 20 62 50 B8 BF P.3........ bP..
0C56:0A20 00 50 B8 64 00 50 9A 3B 25 00 08 83 C4 08 FF 36 .P.d.P.;%......6
0C56:0A30 6A 62 9A 02 00 1E 13 59 CD 35 06 6E 62 CD 38 06 jb.....Y.5.nb.8.
0C56:0A40 A8 02 CD 35 1E 6E 62 CD 3D                      ...5.nb.=      

l0C56_0A49:
	int	35
	push	es
	mov	al,[CD02]
	xor	ax,6E06
	illegal	
	cmp	bl,cl
	int	39
	js	0AD4
	int	3D
	mov	ah,[7979]
	sahf	
	ja	0A6E
	cmp	word ptr [621E],00
	jnz	0A6E
	jmp	0262
	cmp	word ptr [621E],00
	jnz	0A9F
	mov	word ptr [6272],0000
	dec	word ptr [6214]
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,0080
	push	ax
	int	35
	push	es
	and	byte ptr [bp+si-66],04
	push	es
	add	[bx+si],cl
	push	ax
	call	far 0800:1B27
	add	sp,0A
	cmp	word ptr [6214],00
	jle	0AB0
	cmp	word ptr [625A],32
	jge	0AB0
	jmp	0103
	push	ds
	mov	ax,628E
	push	ax
	call	far 0800:1BAD
	pop	cx
	pop	cx
	mov	ax,0001
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:1C17
	pop	cx
	pop	cx
	mov	ax,0002
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0004
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:1C58
	add	sp,06
	cmp	word ptr [625A],32
	jnz	0B06
	push	ds
	mov	ax,0223
	push	ax
	mov	ax,004B
	push	ax
	mov	ax,007D
	push	ax
	call	far 0800:253B
	add	sp,08
	jmp	0B1B
	push	ds
	mov	ax,022E
	push	ax
	mov	ax,004B
	push	ax
	mov	ax,007D
	push	ax
	call	far 0800:253B
	add	sp,08
	push	word ptr [6296]
	push	word ptr [6294]
	call	far 0800:1C17
	pop	cx
	pop	cx
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:1C58
	add	sp,06
	cmp	word ptr [6264],00
	jz	0B8F
	push	ds
	mov	ax,0238
	push	ax
	mov	ax,0088
	push	ax
	mov	ax,0018
	push	ax
	call	far 0800:253B
	add	sp,08
	mov	ax,0249
	push	ax
	call	far 1263:0003
	pop	cx
	mov	ax,6232
	push	ax
	call	far 12F1:000A
	pop	cx
	mov	word ptr [6264],0000
	jmp	0B88
	mov	bx,[6264]
	mov	al,[bx+6232]
	mov	bx,[6264]
	mov	[bx+019E],al
	inc	word ptr [6264]
	cmp	word ptr [6264],03
	jl	0B74
	mov	ax,0001
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0003
	push	ax
	mov	ax,0002
	push	ax
	mov	ax,0096
	push	ax
	push	ds
	mov	ax,0252
	push	ax
	call	far 0C56:0CDA
	add	sp,0A
	call	far 0C56:12FF
	pop	bp
	retf	

fn0C56_0BB9()
	push	bp
	mov	bp,sp
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,000A
	push	ax
	push	ds
	mov	ax,02D8
	push	ax
	call	far 0C56:0CDA
	add	sp,0A
	xor	ax,ax
	push	ax
	push	ds
	mov	ax,781A
	push	ax
	mov	ax,0028
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:1B27
	add	sp,0A
	push	ds
	mov	ax,02F0
	push	ax
	mov	ax,0028
	push	ax
	mov	ax,0028
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	ax,ax
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,003C
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:1B27
	add	sp,0A
	push	ds
	mov	ax,02F9
	push	ax
	mov	ax,003C
	push	ax
	mov	ax,0028
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	ax,ax
	push	ax
	push	ds
	mov	ax,78A6
	push	ax
	mov	ax,0050
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:1B27
	add	sp,0A
	push	ds
	mov	ax,030F
	push	ax
	mov	ax,0055
	push	ax
	mov	ax,0028
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	ax,ax
	push	ax
	push	ds
	mov	ax,78EC
	push	ax
	mov	ax,0064
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:1B27
	add	sp,0A
	push	ds
	mov	ax,0333
	push	ax
	mov	ax,0069
	push	ax
	mov	ax,0028
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	ax,ax
	push	ax
	push	ds
	mov	ax,7932
	push	ax
	mov	ax,0078
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:1B27
	add	sp,0A
	push	ds
	mov	ax,034D
	push	ax
	mov	ax,007D
	push	ax
	mov	ax,0028
	push	ax
	call	far 0800:253B
	add	sp,08
	mov	ax,0001
	push	ax
	mov	ax,0003
	push	ax
	mov	ax,00A0
	push	ax
	push	ds
	mov	ax,0360
	push	ax
	call	far 0C56:0CDA
	add	sp,0A
	call	far 0C56:12FF
	call	far 0800:1508
	pop	bp
	retf	

fn0C56_0CDA()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	word ptr [bp+0E]
	xor	ax,ax
	push	ax
	push	word ptr [bp+0C]
	call	far 0800:1C58
	add	sp,06
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	call	far 0800:25E8
	pop	cx
	pop	cx
	mov	si,ax
	call	far 0800:168C
	sub	ax,si
	mov	bx,0002
	cwd	
	idiv	bx
	mov	di,ax
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	word ptr [bp+0A]
	push	di
	call	far 0800:253B
	add	sp,08
	mov	ax,si
	jmp	0D24

l0C56_0D24:
	pop	di
	pop	si
	pop	bp
	retf	

fn0C56_0D28()
	push	bp
	mov	bp,sp
	push	si
	push	di
	call	far 0800:1508
	mov	ax,0003
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:1C58
	add	sp,06
	push	ds
	mov	ax,037C
	push	ax
	mov	ax,000A
	push	ax
	mov	ax,0028
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	si,si
	jmp	0D8D

l0C56_0D5E:
	xor	di,di
	jmp	0D87

l0C56_0D62:
	mov	ax,di
	add	ax,000A
	push	ax
	mov	ax,si
	add	ax,0028
	push	ax
	call	far 0800:2636
	pop	cx
	pop	cx
	push	ax
	mov	ax,si
	mov	dx,0019
	mul	dx
	mov	bx,ax
	add	bx,di
	pop	ax
	mov	[bx+6298],al
	inc	di

l0C56_0D87:
	cmp	di,19
	jl	0D62

l0C56_0D8C:
	inc	si

l0C56_0D8D:
	cmp	si,00DC
	jl	0D5E

l0C56_0D93:
	call	far 0800:1508
	mov	ax,0002
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0008
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,0004
	push	ax
	call	far 0800:1C58
	add	sp,06
	push	ds
	mov	ax,038C
	push	ax
	mov	ax,0064
	push	ax
	mov	ax,0014
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	si,si
	jmp	0E27

l0C56_0DCE:
	xor	di,di
	jmp	0E21

l0C56_0DD2:
	mov	ax,di
	add	ax,0078
	push	ax
	mov	ax,si
	add	ax,000A
	push	ax
	call	far 0800:2636
	pop	cx
	pop	cx
	push	ax
	mov	ax,si
	mov	dx,0041
	mul	dx
	mov	bx,ax
	add	bx,di
	pop	ax
	mov	[bx+1492],al
	mov	ax,si
	mov	dx,0041
	mul	dx
	mov	bx,ax
	add	bx,di
	mov	al,[bx+1492]
	cbw	
	mov	dx,0003
	sub	dx,ax
	push	dx
	mov	ax,di
	add	ax,0078
	push	ax
	mov	ax,si
	add	ax,000A
	push	ax
	call	far 0800:2657
	add	sp,06
	inc	di

l0C56_0E21:
	cmp	di,41
	jl	0DD2

l0C56_0E26:
	inc	si

l0C56_0E27:
	cmp	si,0131
	jl	0DCE

l0C56_0E2D:
	call	far 0800:1508
	pop	di
	pop	si
	pop	bp
	retf	

fn0C56_0E36()
	push	bp
	mov	bp,sp
	sub	sp,06
	push	si
	push	di
	call	far 0800:1508
	xor	si,si
	jmp	0F2F

l0C56_0E48:
	or	si,si
	jle	0E67

l0C56_0E4C:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,781A
	push	ax
	mov	ax,0028
	push	ax
	mov	ax,si
	add	ax,0027
	push	ax
	call	far 0800:1B27
	add	sp,0A

l0C56_0E67:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,781A
	push	ax
	mov	ax,0028
	push	ax
	mov	ax,si
	add	ax,0028
	push	ax
	call	far 0800:1B27
	add	sp,0A
	mov	ax,0003
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0001
	push	ax
	mov	ax,FFFF
	push	ax
	mov	ax,000B
	push	ax
	mov	ax,0023
	push	ax
	mov	ax,si
	add	ax,002F
	push	ax
	call	far 0C56:153D
	add	sp,0A
	mov	word ptr [bp-04],0019
	jmp	0F25

l0C56_0EB2:
	mov	word ptr [bp-02],0000
	jmp	0EE9

l0C56_0EB9:
	xor	di,di
	jmp	0EE1

l0C56_0EBD:
	call	far 1347:0016
	mov	bx,0004
	cwd	
	idiv	bx
	push	dx
	mov	ax,[bp-04]
	add	ax,000A
	push	ax
	mov	ax,si
	add	ax,di
	add	ax,002F
	push	ax
	call	far 0800:2657
	add	sp,06
	inc	di

l0C56_0EE1:
	cmp	di,02
	jl	0EBD

l0C56_0EE6:
	inc	word ptr [bp-02]

l0C56_0EE9:
	cmp	word ptr [bp-02],02
	jl	0EB9

l0C56_0EEF:
	xor	di,di
	jmp	0F1D

l0C56_0EF3:
	mov	ax,si
	mov	dx,0019
	mul	dx
	mov	bx,ax
	add	bx,[bp-04]
	mov	al,[bx+6298]
	cbw	
	push	ax
	mov	ax,[bp-04]
	add	ax,000A
	push	ax
	mov	ax,si
	add	ax,di
	add	ax,002F
	push	ax
	call	far 0800:2657
	add	sp,06
	inc	di

l0C56_0F1D:
	cmp	di,02
	jl	0EF3

l0C56_0F22:
	dec	word ptr [bp-04]

l0C56_0F25:
	cmp	word ptr [bp-04],00
	jle	0F2E

l0C56_0F2B:
	jmp	0EB2

l0C56_0F2E:
	inc	si

l0C56_0F2F:
	cmp	si,00DB
	jge	0F38

l0C56_0F35:
	jmp	0E48

l0C56_0F38:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,781A
	push	ax
	mov	ax,0028
	push	ax
	mov	ax,0102
	push	ax
	call	far 0800:1B27
	add	sp,0A
	mov	word ptr [bp-02],0102
	jmp	0FC6

l0C56_0F58:
	cmp	word ptr [bp-02],0102
	jge	0F93

l0C56_0F5F:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,781A
	push	ax
	mov	ax,0028
	push	ax
	mov	ax,[bp-02]
	inc	ax
	push	ax
	call	far 0800:1B27
	add	sp,0A
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,003C
	push	ax
	mov	ax,[bp-02]
	inc	ax
	push	ax
	call	far 0800:1B27
	add	sp,0A

l0C56_0F93:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,781A
	push	ax
	mov	ax,0028
	push	ax
	push	word ptr [bp-02]
	call	far 0800:1B27
	add	sp,0A
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,003C
	push	ax
	push	word ptr [bp-02]
	call	far 0800:1B27
	add	sp,0A
	dec	word ptr [bp-02]

l0C56_0FC6:
	cmp	word ptr [bp-02],0098
	jge	0F58

l0C56_0FCD:
	mov	ax,0001
	push	ax
	mov	ax,FFFF
	push	ax
	mov	ax,0027
	push	ax
	mov	ax,003A
	push	ax
	mov	ax,00A0
	push	ax
	call	far 0C56:153D
	add	sp,0A
	mov	ax,0030
	push	ax
	mov	ax,00A0
	push	ax
	call	far 0C56:171C
	pop	cx
	pop	cx
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,003C
	push	ax
	mov	ax,0098
	push	ax
	call	far 0800:1B27
	add	sp,0A
	xor	di,di
	jmp	10D9

l0C56_1016:
	or	di,di
	jle	1034

l0C56_101A:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,0064
	push	ax
	mov	ax,di
	inc	ax
	inc	ax
	push	ax
	call	far 0800:1B27
	add	sp,0A

l0C56_1034:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,0064
	push	ax
	mov	ax,di
	add	ax,0003
	push	ax
	call	far 0800:1B27
	add	sp,0A
	mov	si,0041
	jmp	10D1

l0C56_1055:
	mov	word ptr [bp-02],0000
	jmp	10A5

l0C56_105C:
	call	far 1347:0016
	mov	bx,0003
	cwd	
	idiv	bx
	inc	dx
	push	dx
	mov	ax,si
	add	ax,0078
	push	ax
	mov	ax,di
	add	ax,000A
	push	ax
	call	far 0800:2657
	add	sp,06
	call	far 1347:0016
	mov	bx,01F4
	cwd	
	idiv	bx
	add	dx,012C
	push	dx
	call	far 1383:0006
	pop	cx
	mov	ax,0001
	push	ax
	call	far 131E:0002
	pop	cx
	call	far 1383:0032
	inc	word ptr [bp-02]

l0C56_10A5:
	cmp	word ptr [bp-02],05
	jl	105C

l0C56_10AB:
	mov	ax,di
	mov	dx,0041
	mul	dx
	mov	bx,ax
	add	bx,si
	mov	al,[bx+1492]
	cbw	
	push	ax
	mov	ax,si
	add	ax,0078
	push	ax
	mov	ax,di
	add	ax,000A
	push	ax
	call	far 0800:2657
	add	sp,06
	dec	si

l0C56_10D1:
	or	si,si
	jl	10D8

l0C56_10D5:
	jmp	1055

l0C56_10D8:
	inc	di

l0C56_10D9:
	cmp	di,0130
	jge	10E2

l0C56_10DF:
	jmp	1016

l0C56_10E2:
	mov	ax,0001
	push	ax
	push	ds
	mov	ax,7860
	push	ax
	mov	ax,0064
	push	ax
	mov	ax,0132
	push	ax
	call	far 0800:1B27
	add	sp,0A
	mov	ax,0003
	push	ax
	call	far 0800:236D
	pop	cx
	call	far 0C56:12FF
	xor	ax,ax
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0064
	push	ax
	mov	ax,013F
	push	ax
	mov	ax,0064
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:21E2
	add	sp,08
	mov	word ptr [bp-06],0000
	jmp	1166

l0C56_1131:
	push	word ptr [bp-06]
	mov	ax,013F
	push	ax
	push	word ptr [bp-06]
	xor	ax,ax
	push	ax
	call	far 0800:21E2
	add	sp,08
	mov	ax,00C8
	sub	ax,[bp-06]
	push	ax
	mov	ax,013F
	push	ax
	mov	ax,00C8
	sub	ax,[bp-06]
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:21E2
	add	sp,08
	inc	word ptr [bp-06]

l0C56_1166:
	cmp	word ptr [bp-06],64
	jl	1131

l0C56_116C:
	mov	ax,0003
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0002
	push	ax
	mov	ax,0004
	push	ax
	mov	ax,0028
	push	ax
	push	ds
	mov	ax,0394
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	mov	si,ax
	push	ds
	mov	ax,03AD
	push	ax
	call	far 0800:1E66
	pop	cx
	pop	cx
	mov	[bp-04],ax
	mov	ax,[bp-04]
	add	ax,002A
	mov	[bp-06],ax
	mov	ax,0002
	push	ax
	mov	ax,0004
	push	ax
	push	word ptr [bp-06]
	push	ds
	mov	ax,03AF
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	mov	ax,0002
	push	ax
	mov	ax,0004
	push	ax
	mov	ax,[bp-06]
	add	ax,[bp-04]
	inc	ax
	inc	ax
	push	ax
	push	ds
	mov	ax,03C0
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	mov	ax,0003
	push	ax
	mov	ax,0001
	push	ax
	mov	ax,0096
	push	ax
	push	ds
	mov	ax,03D2
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	call	far 0C56:12FF
	call	far 0800:1508
	mov	ax,0002
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0005
	push	ax
	mov	ax,0001
	push	ax
	mov	ax,0014
	push	ax
	push	ds
	mov	ax,03E1
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	push	ds
	mov	ax,03E8
	push	ax
	call	far 0800:1E66
	pop	cx
	pop	cx
	mov	si,ax
	mov	ax,si
	add	ax,0017
	push	ax
	mov	ax,012C
	push	ax
	mov	ax,si
	add	ax,0017
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:21E2
	add	sp,08
	mov	ax,si
	add	ax,001A
	push	ax
	mov	ax,012C
	push	ax
	mov	ax,si
	add	ax,001A
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:21E2
	add	sp,08
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:1C58
	add	sp,06
	push	ds
	mov	ax,03EA
	push	ax
	call	far 0800:1E66
	pop	cx
	pop	cx
	mov	[bp-04],ax
	mov	ax,0003
	push	ax
	call	far 0800:236D
	pop	cx
	push	ds
	mov	ax,03EC
	push	ax
	mov	ax,0050
	push	ax
	mov	ax,0005
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0416
	push	ax
	mov	ax,[bp-04]
	add	ax,0052
	push	ax
	mov	ax,0005
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0438
	push	ax
	mov	ax,[bp-04]
	shl	ax,01
	add	ax,0054
	push	ax
	mov	ax,0005
	push	ax
	call	far 0800:253B
	add	sp,08
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,0096
	push	ax
	push	ds
	mov	ax,045E
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	call	far 0C56:12FF
	call	far 0800:1508
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	

fn0C56_12FF()
	push	bp
	mov	bp,sp
	push	si
	call	far 130D:000F
	mov	si,ax
	or	si,si
	jnz	1315

l0C56_130E:
	call	far 130D:000F
	mov	si,ax

l0C56_1315:
	cmp	si,03
	jnz	1328

l0C56_131A:
	call	far 0800:1464
	xor	ax,ax
	push	ax
	call	far 118C:000A
	pop	cx

l0C56_1328:
	pop	si
	pop	bp
	retf	

fn0C56_132B()
	push	bp
	mov	bp,sp
	call	far 0800:1508
	mov	ax,0002
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	mov	ax,00C7
	push	ax
	mov	ax,013F
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:2245
	add	sp,08
	xor	ax,ax
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	mov	ax,00A0
	push	ax
	mov	ax,00F0
	push	ax
	mov	ax,000A
	push	ax
	mov	ax,000A
	push	ax
	call	far 0800:2245
	add	sp,08
	xor	ax,ax
	push	ax
	call	far 0800:236D
	pop	cx
	mov	ax,0002
	push	ax
	mov	ax,0001
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:1C58
	add	sp,06
	push	ds
	mov	ax,0481
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,010E
	push	ax
	call	far 0800:253B
	add	sp,08
	mov	ax,0002
	push	ax
	mov	ax,0001
	push	ax
	mov	ax,0004
	push	ax
	call	far 0800:1C58
	add	sp,06
	push	ds
	mov	ax,0491
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,0122
	push	ax
	call	far 0800:253B
	add	sp,08
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:1C58
	add	sp,06
	push	ds
	mov	ax,0499
	push	ax
	mov	ax,00B4
	push	ax
	mov	ax,0014
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,04A1
	push	ax
	mov	ax,00BF
	push	ax
	mov	ax,0014
	push	ax
	call	far 0800:253B
	add	sp,08
	pop	bp
	retf	
0C56:1415                55 8B EC 56 CD 35 06 6E 62 9A 04      U..V.5.nb..
0C56:1420 06 00 08 8B F0 83 3E 5C 62 00 74 54 CD 35 06 18 ......>\b.tT.5..
0C56:1430 62 CD 34 1E 6E 62 CD 39 3E 78 79 CD 3D 8A 26 79 b.4.nb.9>xy.=.&y
0C56:1440 79 9E 73 3C CD 35 06 18 62 CD 34 1E 78 62 CD 39 y.s<.5..b.4.xb.9
0C56:1450 3E 78 79 CD 3D 8A 26 79 79 9E 73 24 CD 35 06 18 >xy.=.&yy.s$.5..
0C56:1460 62 CD 34 1E 8A 62 CD 39 3E 78 79 CD 3D 8A 26 79 b.4..b.9>xy.=.&y
0C56:1470 79 9E 73 0C CD 35 06 18 62 9A 04 06 00 08 8B F0 y.s..5..b.......
0C56:1480 83 3E 7C 62 00 74 54 CD 35 06 78 62 CD 34 1E 6E .>|b.tT.5.xb.4.n
0C56:1490 62 CD 39 3E 78 79 CD 3D 8A 26 79 79 9E 73 3C CD b.9>xy.=.&yy.s<.
0C56:14A0 35 06 78 62 CD 34 1E 18 62 CD 39 3E 78 79 CD 3D 5.xb.4..b.9>xy.=
0C56:14B0 8A 26 79 79 9E 73 24 CD 35 06 78 62 CD 34 1E 8A .&yy.s$.5.xb.4..
0C56:14C0 62 CD 39 3E 78 79 CD 3D 8A 26 79 79 9E 73 0C CD b.9>xy.=.&yy.s..
0C56:14D0 35 06 78 62 9A 04 06 00 08 8B F0 83 3E 2C 62 00 5.xb........>,b.
0C56:14E0 74 54 CD 35 06 8A 62 CD 34 1E 6E 62 CD 39 3E 78 tT.5..b.4.nb.9>x
0C56:14F0 79 CD 3D 8A 26 79 79 9E 73 3C CD 35 06 8A 62 CD y.=.&yy.s<.5..b.
0C56:1500 34 1E 78 62 CD 39 3E 78 79 CD 3D 8A 26 79 79 9E 4.xb.9>xy.=.&yy.
0C56:1510 73 24 CD 35 06 8A 62 CD 34 1E 18 62 CD 39 3E 78 s$.5..b.4..b.9>x
0C56:1520 79 CD 3D 8A 26 79 79 9E 73 0C CD 35 06 8A 62 9A y.=.&yy.s..5..b.
0C56:1530 04 06 00 08 8B F0 8B C6 EB 00 5E 5D CB          ..........^].  

fn0C56_153D()
	push	bp
	mov	bp,sp
	sub	sp,04
	push	si
	push	di
	mov	di,[bp+06]
	mov	word ptr [bp-02],0000
	mov	si,[bp+08]
	add	si,08
	jmp	164A

l0C56_1556:
	mov	word ptr [bp-04],0000
	jmp	163E

l0C56_155E:
	cmp	word ptr [6272],00
	jz	15C8

l0C56_1565:
	push	si
	mov	ax,[620C]
	add	ax,0003
	push	ax
	call	far 0800:2636
	pop	cx
	pop	cx
	or	ax,ax
	jnz	158B

l0C56_1578:
	push	si
	mov	ax,[620C]
	add	ax,000C
	push	ax
	call	far 0800:2636
	pop	cx
	pop	cx
	or	ax,ax
	jz	1590

l0C56_158B:
	mov	word ptr [bp-02],0001

l0C56_1590:
	call	far 1347:0016
	mov	bx,0004
	cwd	
	idiv	bx
	push	dx
	push	si
	mov	ax,[620C]
	add	ax,0003
	push	ax
	call	far 0800:2657
	add	sp,06
	call	far 1347:0016
	mov	bx,0004
	cwd	
	idiv	bx
	push	dx
	push	si
	mov	ax,[620C]
	add	ax,000C
	push	ax
	call	far 0800:2657
	add	sp,06

l0C56_15C8:
	push	word ptr [bp+08]
	push	si
	mov	ax,[bp+0C]
	neg	ax
	push	ax
	call	far 0C56:16EF
	add	sp,06
	or	ax,ax
	jz	1610

l0C56_15DE:
	push	si
	mov	ax,di
	add	ax,[bp-04]
	push	ax
	call	far 0800:2636
	pop	cx
	pop	cx
	or	ax,ax
	jz	15F5

l0C56_15F0:
	mov	word ptr [bp-02],0001

l0C56_15F5:
	call	far 1347:0016
	mov	bx,0004
	cwd	
	idiv	bx
	push	dx
	push	si
	mov	ax,di
	add	ax,[bp-04]
	push	ax
	call	far 0800:2657
	add	sp,06

l0C56_1610:
	cmp	word ptr [bp+0E],00
	jz	163B

l0C56_1616:
	call	far 1347:0016
	mov	bx,01F4
	cwd	
	idiv	bx
	add	dx,012C
	push	dx
	call	far 1383:0006
	pop	cx
	mov	ax,0001
	push	ax
	call	far 131E:0002
	pop	cx
	call	far 1383:0032

l0C56_163B:
	inc	word ptr [bp-04]

l0C56_163E:
	cmp	word ptr [bp-04],02
	jge	1647

l0C56_1644:
	jmp	155E

l0C56_1647:
	add	si,[bp+0C]

l0C56_164A:
	push	word ptr [bp+0A]
	push	si
	push	word ptr [bp+0C]
	call	far 0C56:16EF
	add	sp,06
	or	ax,ax
	jz	1660

l0C56_165D:
	jmp	1556

l0C56_1660:
	call	far 0800:19D7
	mov	si,ax
	xor	ax,ax
	push	ax
	call	far 0800:236D
	pop	cx
	push	word ptr [bp+0A]
	push	di
	push	word ptr [bp+08]
	push	di
	call	far 0800:21E2
	add	sp,08
	push	word ptr [bp+0A]
	mov	ax,di
	inc	ax
	push	ax
	push	word ptr [bp+08]
	mov	ax,di
	inc	ax
	push	ax
	call	far 0800:21E2
	add	sp,08
	cmp	word ptr [6272],00
	jz	16DD

l0C56_169D:
	push	word ptr [bp+0A]
	mov	ax,[620C]
	add	ax,0003
	push	ax
	mov	ax,[bp+08]
	add	ax,0008
	push	ax
	mov	ax,[620C]
	add	ax,0003
	push	ax
	call	far 0800:21E2
	add	sp,08
	push	word ptr [bp+0A]
	mov	ax,[620C]
	add	ax,000C
	push	ax
	mov	ax,[bp+08]
	add	ax,0008
	push	ax
	mov	ax,[620C]
	add	ax,000C
	push	ax
	call	far 0800:21E2
	add	sp,08

l0C56_16DD:
	push	si
	call	far 0800:236D
	pop	cx
	mov	ax,[bp-02]
	jmp	16E9

l0C56_16E9:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	

fn0C56_16EF()
	push	bp
	mov	bp,sp
	cmp	word ptr [bp+06],00
	jge	1709

l0C56_16F8:
	mov	ax,[bp+08]
	cmp	ax,[bp+0A]
	jl	1705

l0C56_1700:
	mov	ax,0001
	jmp	1707

l0C56_1705:
	xor	ax,ax

l0C56_1707:
	jmp	1718

l0C56_1709:
	mov	ax,[bp+08]
	cmp	ax,[bp+0A]
	jg	1716

l0C56_1711:
	mov	ax,0001
	jmp	1718

l0C56_1716:
	xor	ax,ax

l0C56_1718:
	jmp	171A

l0C56_171A:
	pop	bp
	retf	

fn0C56_171C()
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
	xor	si,si

l0C56_1725:
	imul	cl
	jpe	172A

l0C56_1729:
	xor	di,di

l0C56_172A:
	jmp	ecx

l0C56_172B:
	jmp	189A
0C56:172C                                     6C 01                   l. 

l0C56_172E:
	mov	ax,di
	mov	dx,0018
	mul	dx
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	[0280],dh
	int	35
	pop	si
	in	al,dx
	int	3D
	int	35
	inc	si
	in	al,dx
	sub	sp,08
	int	39
	pop	si
	loopne	1725

l0C56_1758:
	cmp	ax,079A
	add	ah,ah
	adc	[bp+di+08C4],al
	mov	ax,si

l0C56_1763:
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	cl,cl
	mov	ax,[bp+06]
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	al,cl
	int	35
	pop	si
	lock	
	int	3D
	int	35
	inc	si
	in	al,dx
	sub	sp,08
	int	39
	pop	si
	loopne	1763

l0C56_1796:
	cmp	ax,039A
	add	[di+11],bl
	add	sp,08
	mov	ax,si
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	cl,cl
	mov	ax,[bp+08]
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	al,cl
	int	35
	pop	si
	hlt	
0C56:17C6                   CD 3D 83 FE 02 7F 03 E9 A1 00       .=........
0C56:17D0 CD 35 46 EC 83 EC 08 CD 39 5E E0 CD 3D 9A 07 00 .5F.....9^..=...
0C56:17E0 E4 10 83 C4 08 8B C6 05 FE FF 99 52 50 CD 37 46 ...........RP.7F
0C56:17F0 E4 CD 3D 83 C4 04 CD 3A C9 8B 46 06 99 52 50 CD ..=....:..F..RP.
0C56:1800 37 46 E4 CD 3D 83 C4 04 CD 3A C1 CD 35 5E F8 CD 7F..=....:..5^..
0C56:1810 3D CD 35 46 EC 83 EC 08 CD 39 5E E0 CD 3D 9A 03 =.5F.....9^..=..
0C56:1820 00 5D 11 83 C4 08 8B C6 05 FE FF 99 52 50 CD 37 .]..........RP.7
0C56:1830 46 E4 CD 3D 83 C4 04 CD 3A C9 8B 46 08 99 52 50 F..=....:..F..RP
0C56:1840 CD 37 46 E4 CD 3D 83 C4 04 CD 3A C1 CD 35 5E FC .7F..=....:..5^.
0C56:1850 CD 3D 33 C0 50 CD 35 46 FC 9A 04 06 00 08 50 CD .=3.P.5F......P.
0C56:1860 35 46 F8 9A 04 06 00 08 50 9A 57 26 00 08 83 C4 5F......P.W&....
0C56:1870 06 9A 16 00 47 13 BB 04 00 99 F7 FB 52 CD 35 46 ....G.......R.5F
0C56:1880 F4 9A 04 06 00 08 50 CD 35 46 F0 9A 04 06 00 08 ......P.5F......
0C56:1890 50 9A 57 26 00 08 83 C4 06 47                   P.W&.....G     

l0C56_189A:
	cmp	di,0F
	jge	18A2

l0C56_189F:
	jmp	172E

l0C56_18A2:
	inc	si

l0C56_18A3:
	cmp	si,08
	jg	18AB

l0C56_18A8:
	jmp	1729

l0C56_18AB:
	mov	si,0006

l0C56_18AD:
	add	cl,ch
	enter	3300,FF

l0C56_18B1:
	xor	di,di

l0C56_18B3:
	jmp	1970

l0C56_18B6:
	mov	ax,di
	mov	dx,0018
	mul	dx
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	[0280],dh
	int	35
	pop	si
	in	al,dx
	int	3D
	int	35
	inc	si
	in	al,dx
	sub	sp,08
	int	39
	pop	si
	loopne	18AD

l0C56_18E0:
	cmp	ax,079A
	add	ah,ah
	adc	[bp+di+08C4],al
	mov	ax,si

l0C56_18EB:
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	cl,cl
	mov	ax,[bp+06]
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	al,cl
	int	35
	pop	si
	lock	
	int	3D
	int	35
	inc	si
	in	al,dx
	sub	sp,08
	int	39
	pop	si
	loopne	18EB

l0C56_191E:
	cmp	ax,039A
	add	[di+11],bl
	add	sp,08
	mov	ax,si
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	cl,cl
	mov	ax,[bp+08]
	cwd	
	push	dx
	push	ax
	int	37
	inc	si
	in	al,CD
	cmp	ax,C483
	add	al,CD
	cmp	al,cl
	int	35
	pop	si
	hlt	
0C56:194E                                           CD 3D               .=
0C56:1950 33 C0 50 CD 35 46 F4 9A 04 06 00 08 50 CD 35 46 3.P.5F......P.5F
0C56:1960 F0 9A 04 06 00 08 50 9A 57 26 00 08 83 C4 06 47 ......P.W&.....G

l0C56_1970:
	cmp	di,0F
	jge	1978

l0C56_1975:
	jmp	18B6

l0C56_1978:
	inc	si

l0C56_1979:
	cmp	si,08
	jg	1981

l0C56_197E:
	jmp	18B1

l0C56_1981:
	call	far 0800:19D7
	mov	di,ax
	xor	ax,ax
	push	ax
	call	far 0800:236D
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	xor	si,si
	jmp	1A13

l0C56_19A3:
	xor	di,di
	jmp	19DF

l0C56_19A7:
	call	far 1347:0016
	mov	bx,0004
	cwd	
	idiv	bx
	push	dx
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	mov	ax,[bp+08]
	add	ax,si
	push	ax
	mov	ax,[bp+06]
	add	ax,si
	push	ax
	mov	ax,[bp+08]
	sub	ax,si
	push	ax
	mov	ax,[bp+06]
	sub	ax,si
	push	ax
	call	far 0800:2245
	add	sp,08
	inc	di

l0C56_19DF:
	cmp	di,10
	jl	19A7

l0C56_19E4:
	xor	ax,ax
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	mov	ax,[bp+08]
	add	ax,si
	push	ax
	mov	ax,[bp+06]
	add	ax,si
	push	ax
	mov	ax,[bp+08]
	sub	ax,si
	push	ax
	mov	ax,[bp+06]
	sub	ax,si
	push	ax
	call	far 0800:2245
	add	sp,08
	inc	si

l0C56_1A13:
	cmp	si,08
	jle	19A3

l0C56_1A18:
	push	di
	call	far 0800:236D
	pop	cx
	mov	ax,0002
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:181C
	pop	cx
	pop	cx
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	
0C56:1A34             55 8B EC 83 EC 10 56 57 A1 0C 62 05     U.....VW..b.
0C56:1A40 08 00 99 52 50 CD 37 46 E8 CD 3D 83 C4 04 CD 35 ...RP.7F..=....5
0C56:1A50 06 82 62 CD 38 06 B0 02 CD 3A E9 9A 04 06 00 08 ..b.8....:......
0C56:1A60 99 33 C2 2B C2 89 46 F0 A1 0C 62 05 08 00 8B 16 .3.+..F...b.....
0C56:1A70 76 62 83 C2 08 2B C2 99 33 C2 2B C2 89 46 F2 A1 vb...+..3.+..F..
0C56:1A80 0C 62 05 08 00 8B 16 16 62 83 C2 08 2B C2 99 33 .b......b...+..3
0C56:1A90 C2 2B C2 89 46 F4 A1 0C 62 05 08 00 8B 16 88 62 .+..F...b......b
0C56:1AA0 83 C2 08 2B C2 99 33 C2 2B C2 89 46 F6 A1 0C 62 ...+..3.+..F...b
0C56:1AB0 05 03 00 99 52 50 CD 37 46 E8 CD 3D 83 C4 04 CD ....RP.7F..=....
0C56:1AC0 35 06 82 62 CD 38 06 B0 02 CD 3A E9 9A 04 06 00 5..b.8....:.....
0C56:1AD0 08 99 33 C2 2B C2 89 46 F8 A1 0C 62 05 03 00 8B ..3.+..F...b....
0C56:1AE0 16 76 62 83 C2 08 2B C2 99 33 C2 2B C2 89 46 FA .vb...+..3.+..F.
0C56:1AF0 A1 0C 62 05 03 00 8B 16 16 62 83 C2 08 2B C2 99 ..b......b...+..
0C56:1B00 33 C2 2B C2 89 46 FC A1 0C 62 05 03 00 8B 16 88 3.+..F...b......
0C56:1B10 62 83 C2 08 2B C2 99 33 C2 2B C2 89 46 FE 0E E8 b...+..3.+..F...
0C56:1B20 F3 F8 8B F8 B8 01 00 50 B8 FF FF 50 57 B8 90 00 .......P...PW...
0C56:1B30 50 A1 0C 62 05 07 00 50 0E E8 01 FA 83 C4 0A 0B P..b...P........
0C56:1B40 C0 74 37 33 F6 EB 2E 8B DE D1 E3 8D 46 F0 03 D8 .t73........F...
0C56:1B50 83 3F 08 7F 05 8B C6 40 EB 24 83 3E 72 62 00 74 .?.....@.$.>rb.t
0C56:1B60 13 8B DE D1 E3 8D 46 F8 03 D8 83 3F 08 7F 05 8B ......F....?....
0C56:1B70 C6 40 EB 0A 46 83 FE 04 7C CD 33 C0 EB 00 5F 5E .@..F...|.3..._^
0C56:1B80 8B E5 5D CB                                     ..].           

fn0C56_1B84()
	push	bp
	mov	bp,sp
	call	far 0800:1508
	push	ds
	mov	ax,628E
	push	ax
	call	far 0800:1BAD
	pop	cx
	pop	cx
	mov	ax,0001
	push	ax
	call	far 0800:236D
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:1C17
	pop	cx
	pop	cx
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:1C58
	add	sp,06
	push	ds
	mov	ax,04A9
	push	ax
	mov	ax,000A
	push	ax
	mov	ax,00A0
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far 0800:1C17
	pop	cx
	pop	cx
	push	ds
	mov	ax,04B4
	push	ax
	mov	ax,0014
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,04D6
	push	ax
	mov	ax,001C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,04F9
	push	ax
	mov	ax,0024
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,051D
	push	ax
	mov	ax,002C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0541
	push	ax
	mov	ax,0034
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0562
	push	ax
	mov	ax,003C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0584
	push	ax
	mov	ax,0044
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,05A7
	push	ax
	mov	ax,004C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,05CA
	push	ax
	mov	ax,0054
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,05EF
	push	ax
	mov	ax,005C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0614
	push	ax
	mov	ax,0064
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0638
	push	ax
	mov	ax,006C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,065C
	push	ax
	mov	ax,0074
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0681
	push	ax
	mov	ax,007C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,06A6
	push	ax
	mov	ax,0084
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,06CE
	push	ax
	mov	ax,008C
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,06F4
	push	ax
	mov	ax,0094
	push	ax
	mov	ax,0002
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0713
	push	ax
	mov	ax,009C
	push	ax
	mov	ax,002A
	push	ax
	call	far 0800:253B
	add	sp,08
	xor	ax,ax
	push	ax
	mov	ax,0001
	push	ax
	call	far 0800:1C17
	pop	cx
	pop	cx
	push	ds
	mov	ax,072D
	push	ax
	mov	ax,00AA
	push	ax
	mov	ax,00A0
	push	ax
	call	far 0800:253B
	add	sp,08
	push	cs
	call	12FF
	push	word ptr [6296]
	push	word ptr [6294]
	call	far 0800:1C17
	pop	cx
	pop	cx
	pop	bp
	retf	

fn0C56_1D96()
	push	bp
	mov	bp,sp
	push	si
	call	far 0800:1508
	mov	ax,0001
	push	ax
	mov	ax,0001
	push	ax
	mov	ax,0014
	push	ax
	push	ds
	mov	ax,0756
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	push	ds
	mov	ax,076D
	push	ax
	mov	ax,0028
	push	ax
	mov	ax,000F
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,0776
	push	ax
	mov	ax,003C
	push	ax
	mov	ax,000F
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,077F
	push	ax
	mov	ax,0050
	push	ax
	mov	ax,000F
	push	ax
	call	far 0800:253B
	add	sp,08
	call	far 130D:000F
	mov	si,ax
	cmp	si,31
	jl	1E17

l0C56_1E02:
	cmp	si,33
	jg	1E17

l0C56_1E07:
	mov	bx,si
	add	bx,CF
	shl	bx,01
	mov	ax,[bx+0194]
	mov	[626A],ax
	jmp	1E1D

l0C56_1E17:
	mov	word ptr [626A],001E

l0C56_1E1D:
	mov	ax,0001
	push	ax
	mov	ax,0001
	push	ax
	mov	ax,008C
	push	ax
	push	ds
	mov	ax,0789
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	push	cs
	call	12FF
	call	far 0C56:1E41
	pop	si
	pop	bp
	retf	

fn0C56_1E41()
	push	bp
	mov	bp,sp
	push	si
	call	far 0800:1508
	mov	ax,0004
	push	ax
	mov	ax,0004
	push	ax
	mov	ax,0014
	push	ax
	push	ds
	mov	ax,07A2
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	push	ds
	mov	ax,07B8
	push	ax
	mov	ax,003C
	push	ax
	mov	ax,0014
	push	ax
	call	far 0800:253B
	add	sp,08
	push	ds
	mov	ax,07C1
	push	ax
	mov	ax,0064
	push	ax
	mov	ax,0014
	push	ax
	call	far 0800:253B
	add	sp,08
	call	far 130D:000F
	mov	si,ax
	cmp	si,31
	jz	1E9D

l0C56_1E98:
	cmp	si,32
	jnz	1EA7

l0C56_1E9D:
	mov	ax,si
	add	ax,FFCF
	mov	[620E],ax
	jmp	1EAD

l0C56_1EA7:
	mov	word ptr [620E],0000

l0C56_1EAD:
	mov	ax,0001
	push	ax
	mov	ax,0001
	push	ax
	mov	ax,008C
	push	ax
	push	ds
	mov	ax,07CC
	push	ax
	push	cs
	call	0CDA
	add	sp,0A
	pop	si
	pop	bp
	retf	
0C56:1EC8                         00 00 00 00 00 00 00 00         ........
;;; Segment 0E43 (0E43:0000)
0E43:0000 87 E2 00 0C 18 24 30 3C 48 54 60 6C 78 84 90 9C .....$0<HT`lx...
0E43:0010 A8 B4 00 00 00 00 00 00 00 80 01 00 00 00 B8 12 ................
0E43:0020 00 EB 64 FE 8A 1B CD 4B 78 9A D4 02 00 00 00 B8 ..d....Kx.......
0E43:0030 23 00 EB 53 BB F0 17 5C 29 3B AA B8 01 00 00 00 #..S...\);......
0E43:0040 B8 34 00 EB 42 35 C2 68 21 A2 DA 0F C9 02 00 00 .4..B5.h!.......
0E43:0050 00 B8 45 00 EB 31 99 F7 CF FB 84 9A 20 9A FF FF ..E..1...... ...
0E43:0060 00 00 B8 56 00 EB 20 AC 79 CF D1 F7 17 72 B1 00 ...V.. .y....r..
0E43:0070 00 00 00 B8 67 00 EB 0F 00 00 00 00 00 00 00 00 ....g...........
0E43:0080 01 C0 00 00 B8 78 00 1E 8C C9 8E D9 96 FC B9 06 .....x..........
0E43:0090 00 F3 A5 83 EF 0C 96 1F C3 57 50 2B C0 FC AB AB .........WP+....
0E43:00A0 AB AB 58 AB 8A C1 B4 00 AB 5F C3 B5 01 E8 14 1D ..X......_......
0E43:00B0 57 2B C0 FC AB AB AB B4 C0 AB B8 01 40 AB B8 01 W+..........@...
0E43:00C0 00 AB 5F C3 56 57 8B 3E 86 01 83 EF 0C 89 3E 86 .._.VW.>......>.
0E43:00D0 01 06 1E 07 FC B9 06 00 F3 A5 07 5F 5E C3 56 57 ..........._^.VW
0E43:00E0 8B 3E 86 01 83 EF 0C 89 3E 86 01 1E 06 1E 07 0E .>......>.......
0E43:00F0 1F FC B9 06 00 F3 A5 07 1F 5F 5E C3 56 57 8B 36 ........._^.VW.6
0E43:0100 86 01 FC B9 06 00 F3 A5 89 36 86 01 5F 5E C3 56 .........6.._^.V
0E43:0110 57 8B 36 86 01 8D 7C F4 89 3E 86 01 FC 06 1E 07 W.6...|..>......
0E43:0120 B9 06 00 F3 A5 07 5F 5E C3 56 57 8B 36 86 01 8B ......_^.VW.6...
0E43:0130 FE FC 06 1E 07 B9 06 00 AD 87 45 0C AB E2 F9 07 ..........E.....
0E43:0140 5F 5E C3 26 8B 04 2B C9 BA 00 00 0B C0 7C 07 7F _^.&..+......|..
0E43:0150 09 BB 01 C0 EB 10 F7 D8 B2 01 2B DB 91 43 D1 E9 ..........+..C..
0E43:0160 D1 D8 E3 02 EB F7 89 55 0A 89 5D 08 89 45 06 89 .......U..]..E..
0E43:0170 4D 04 89 4D 02 89 0D C3 8B 4C 08 83 F9 0F 7F 0A M..M.....L......
0E43:0180 81 F9 01 C0 7F 0E 2B C0 EB 6E B5 01 E8 35 1C B8 ......+..n...5..
0E43:0190 00 80 EB 64 8B 5C 06 2B C0 8B D0 83 F9 00 7D 04 ...d.\.+......}.
0E43:01A0 D1 EB D1 DA 0B 14 0B 54 02 0B 54 04 83 F9 00 7E .......T..T....~
0E43:01B0 06 D1 E3 D1 D0 E2 FA 0A DE 0A DA B1 0C 22 0E 85 ............."..
0E43:01C0 01 80 F9 0C 74 2A 80 F9 00 74 16 02 4C 0A 80 F9 ....t*...t..L...
0E43:01D0 04 74 1D 80 F9 09 74 18 F7 DB 15 00 00 78 AB EB .t....t......x..
0E43:01E0 0F B2 01 22 D0 0A DA 81 C3 FF 7F 15 00 00 78 9A ..."..........x.
0E43:01F0 80 7C 0A 01 75 02 F7 D8 26 89 05 C3 56 57 FC B9 .|..u...&...VW..
0E43:0200 06 00 F3 A5 5F 5E 87 F7 8D 74 08 81 3C 01 C0 7E ...._^...t..<..~
0E43:0210 0F 81 3C 01 40 7D 0A FF 0C E8 27 FF C7 04 01 00 ..<.@}....'.....
0E43:0220 C3 C7 04 01 C0 C7 45 08 0D 00 C6 45 07 80 EB F0 ......E....E....
0E43:0230 55 8B EC 56 57 8B 4C 08 83 F9 0F 7F 08 0B C9 7F U..VW.L.........
0E43:0240 0E 2B C0 EB 1C B5 01 E8 7A 1B B8 FF 7F EB 0A 8B .+......z.......
0E43:0250 44 06 F6 D9 80 C1 10 D3 E8 80 7C 0A 01 75 02 F7 D.........|..u..
0E43:0260 D8 8B 4D 08 81 F9 01 C0 7E 15 81 F9 01 40 7D 0F ..M.....~....@}.
0E43:0270 03 C1 3D 01 C0 7E 16 3D 01 40 7D 07 89 45 08 5F ..=..~.=.@}..E._
0E43:0280 5E 5D C3 B5 08 E8 3C 1B B8 01 40 EB 08 B5 10 E8 ^]....<...@.....
0E43:0290 32 1B B8 01 C0 E8 01 FE EB E5 26 8B 1C 26 8B 54 2.........&..&.T
0E43:02A0 02 2B C0 B9 00 00 0B D2 79 09 F7 D2 F7 DB 83 DA .+......y.......
0E43:02B0 FF B1 01 89 4D 0A B9 10 00 0B D2 75 04 87 DA B1 ....M......u....
0E43:02C0 00 0B D2 74 0C 41 D1 EA D1 DB D1 D8 EB F3 B9 01 ...t.A..........
0E43:02D0 C0 E3 FB 89 4D 08 89 5D 06 89 45 04 89 55 02 89 ....M..]..E..U..
0E43:02E0 15 C3 8B 4C 08 83 F9 1F 7F 33 0B C9 7D 3C 81 F9 ...L.....3..}<..
0E43:02F0 01 C0 7E 13 B3 0C 22 1E 85 01 02 5C 0A 80 FB 05 ..~..."....\....
0E43:0300 74 0B 80 FB 08 74 06 2B D2 8B C2 EB 1A 2B D2 B8 t....t.+.....+..
0E43:0310 01 00 80 FB 05 75 10 F7 D8 F7 D2 EB 0A B5 01 E8 .....u..........
0E43:0320 A2 1A BA 00 80 2B C0 E9 87 00 8B 5C 02 0A 1C 0A .....+.....\....
0E43:0330 5C 01 8B 44 04 8B 54 06 80 E9 10 77 10 0A C3 0A \..D..T....w....
0E43:0340 C7 93 92 2B D2 80 C1 10 7E F3 80 E1 0F E3 1D 56 ...+....~......V
0E43:0350 BE FF FF D3 C2 D3 C0 D3 E6 8B CE 23 C8 33 C1 23 ...........#.3.#
0E43:0360 F2 33 D6 0B C6 0A DF 0A D9 8A FD 5E B1 0C 22 0E .3.........^..".
0E43:0370 85 01 80 F9 0C 74 2D 80 F9 00 74 13 02 4C 0A 80 .....t-...t..L..
0E43:0380 F9 04 74 20 80 F9 09 74 1B F7 DB 72 0C EB 15 B1 ..t ...t...r....
0E43:0390 01 22 C8 0A D9 81 C3 FF 7F 15 00 00 83 D2 00 79 .".............y
0E43:03A0 03 E9 79 FF 80 7C 0A 01 75 07 F7 D2 F7 D8 83 DA ..y..|..u.......
0E43:03B0 FF 26 89 05 26 89 55 02 C3 55 56 26 8B 04 26 8B .&..&.U..UV&..&.
0E43:03C0 5C 02 26 8B 4C 04 26 8B 54 06 BD 00 00 0B D2 7C \.&.L.&.T......|
0E43:03D0 13 7F 26 0B C9 75 22 0B DB 75 1E 0B C0 75 1A BE ..&..u"..u...u..
0E43:03E0 01 C0 EB 33 F7 D2 F7 D1 F7 D3 F7 D8 F5 83 D3 00 ...3............
0E43:03F0 83 D1 00 83 D2 00 BD 01 00 BE 40 00 0B D2 75 0A ..........@...u.
0E43:0400 87 D1 87 CB 93 83 EE 10 EB F2 78 0B 4E 03 C0 13 ..........x.N...
0E43:0410 DB 13 C9 13 D2 79 F5 89 6D 0A 89 75 08 89 55 06 .....y..m..u..U.
0E43:0420 89 4D 04 89 5D 02 89 05 5E 5D C3 55 57 8B 4C 08 .M..]...^].UW.L.
0E43:0430 83 F9 3F 7F 39 0B C9 7D 46 81 F9 01 C0 7E 13 B3 ..?.9..}F....~..
0E43:0440 0C 22 1E 85 01 02 5C 0A 80 FB 05 74 09 80 FB 08 ."....\....t....
0E43:0450 74 04 2B ED EB 20 2B ED 8B D5 B8 01 00 80 FB 05 t.+.. +.........
0E43:0460 8B DD 75 18 F7 D8 F7 D3 F7 D2 F7 D5 EB 0E B5 01 ..u.............
0E43:0470 E8 51 19 BD 00 80 2B D2 8B DA 8B C3 E9 91 00 8B .Q....+.........
0E43:0480 6C 06 8B 54 04 8B 5C 02 8B 3C 2B C0 80 E9 30 77 l..T..\..<+...0w
0E43:0490 16 0A C4 B4 00 0B C7 8B FB 8B DA 8B D5 2B ED 80 .............+..
0E43:04A0 C1 10 7E ED 80 E1 0F F6 D9 74 11 80 C1 10 0A C4 ..~......t......
0E43:04B0 D1 ED D1 DA D1 DB D1 DF D0 DC E2 F2 B1 0C 22 0E ..............".
0E43:04C0 85 01 80 F9 0C 74 30 80 F9 00 74 15 02 4C 0A 80 .....t0...t..L..
0E43:04D0 F9 04 74 23 80 F9 09 74 1E F7 D8 72 0D EB 18 EB ..t#...t...r....
0E43:04E0 8D B1 01 23 CF 0A C1 05 FF 7F B9 00 00 13 F9 13 ...#............
0E43:04F0 D9 13 D1 13 E9 78 E8 97 80 7C 0A 01 75 12 F7 D5 .....x...|..u...
0E43:0500 F7 D2 F7 D3 F7 D8 F5 83 D3 00 83 D2 00 83 D5 00 ................
0E43:0510 5F AB 93 AB 92 AB 95 AB 83 EF 08 5D C3 55 56 57 _..........].UVW
0E43:0520 87 EE 8B 4E 08 83 F9 40 7D 2C 0B C9 7D 45 81 F9 ...N...@},..}E..
0E43:0530 01 C0 7E 13 B1 0C 22 0E 85 01 02 4E 0A 80 F9 05 ..~..."....N....
0E43:0540 74 0C 80 F9 08 74 07 2B DB BE 01 C0 EB 11 BE 01 t....t.+........
0E43:0550 00 BB 00 80 EB 09 74 18 B5 20 E8 67 18 EB 11 2B ......t.. .g...+
0E43:0560 C0 89 46 00 89 46 02 89 46 04 89 5E 06 89 76 08 ..F..F..F..^..v.
0E43:0570 E9 B0 00 BE 38 00 23 F1 33 CE D1 EE D1 EE D1 EE ....8.#.3.......
0E43:0580 F7 DE 83 C6 07 83 FE 07 75 06 B4 00 8A 02 EB 02 ........u.......
0E43:0590 8B 02 2B DB 8B FE 4F 7C 06 0A 1B 88 3B EB F7 BA ..+...O|....;...
0E43:05A0 FF 00 80 E1 07 D3 EA 8B FA 47 23 D0 75 04 0A DB .........G#.u...
0E43:05B0 74 71 B5 20 E8 0D 18 33 C2 B1 0C 22 0E 85 01 80 tq. ...3..."....
0E43:05C0 F9 0C 74 18 80 F9 00 74 1E 02 4E 0A 80 F9 04 74 ..t....t..N....t
0E43:05D0 0B 80 F9 09 74 06 0A DA 75 23 EB 47 88 02 80 7E ....t...u#.G...~
0E43:05E0 07 00 75 3F E9 60 FF 0A DB 75 0C 85 C7 75 08 03 ..u?.`...u...u..
0E43:05F0 D2 3B D7 76 E7 EB 06 03 D2 3B D7 72 DF 83 EE 07 .;.v.....;.r....
0E43:0600 7C 09 03 C7 88 42 07 F6 DC EB 0F 03 C7 89 42 07 |....B........B.
0E43:0610 46 46 7F 06 80 52 07 00 72 F7 73 07 F9 D1 5E 06 FF...R..r.s...^.
0E43:0620 FF 46 08 5F 5E 5D C3 8B 44 04 8B 54 06 8B 5C 08 .F._^]..D..T..\.
0E43:0630 8A 4C 0A 83 3C 00 75 0F 83 7C 02 00 75 09 A8 7F .L..<.u..|..u...
0E43:0640 75 05 F6 C4 01 74 0F 02 C0 80 D4 00 83 D2 00 73 u....t.........s
0E43:0650 05 D1 DA D1 D8 43 83 C3 7E 7E 32 81 FB FF 00 7D .....C..~~2....}
0E43:0660 17 D1 E2 D0 E9 D0 DB D1 DA 8A C4 8A E2 8A D6 8A ................
0E43:0670 F3 AB 92 AB 83 EF 04 C3 81 7C 08 01 40 7D 09 B5 .........|..@}..
0E43:0680 08 E8 40 17 2B D2 2B C0 BB FF 00 EB D4 81 7C 08 ..@.+.+.......|.
0E43:0690 01 C0 7E 05 B5 10 E8 2B 17 2B DB 8B D3 8B C3 EB ..~....+.+......
0E43:06A0 C0 56 57 06 FC 26 8B 04 26 8B 54 02 2B F6 D1 E2 .VW..&..&.T.+...
0E43:06B0 D1 D6 2B DB 02 DE 74 30 80 FE FF 74 20 83 EB 7E ..+...t0...t ..~
0E43:06C0 F9 D0 DA 8A F2 8A D4 8A E8 B1 00 1E 07 2B C0 AB .............+..
0E43:06D0 AB 91 AB 92 AB 93 AB 96 AB 07 5F 5E C3 8B D8 0A .........._^....
0E43:06E0 DA F7 DB BB 01 40 EB D8 8B CA 0B C8 74 0E 83 EB .....@......t...
0E43:06F0 7E D0 EA 03 C0 13 D2 78 CA 4B EB F7 BB 01 C0 EB ~......x.K......
0E43:0700 C2 57 8B 44 01 8B 7C 03 8B 4C 05 8A 54 07 8B 5C .W.D..|..L..T..\
0E43:0710 08 B6 03 22 F0 0A 34 75 04 A8 08 74 11 05 04 00 ..."..4u...t....
0E43:0720 83 D7 00 83 D1 00 80 D2 00 73 03 D0 DA 43 81 C3 .........s...C..
0E43:0730 FE 03 7E 42 81 FB FF 07 7D 4A 24 F8 D0 E2 D1 EB ..~B....}J$.....
0E43:0740 D0 DA 0A C7 8A F3 8B DF D1 EF D1 D8 D1 DA D1 D9 ................
0E43:0750 D1 DB D1 EF D1 D8 D1 DA D1 D9 D1 DB 0A 44 0A D1 .............D..
0E43:0760 EF D1 D8 D1 DA D1 D9 D1 DB 5F FC AB 93 AB 91 AB ........._......
0E43:0770 92 AB 83 EF 08 C3 BA 00 00 81 7C 08 01 C0 7E 13 ..........|...~.
0E43:0780 B5 10 EB 0C 81 7C 08 01 40 7D 15 BA E0 FF B5 08 .....|..@}......
0E43:0790 E8 31 16 0A 54 0A D1 CA 2B C9 8B D9 8B C1 EB C9 .1..T...+.......
0E43:07A0 BB FF 07 EB 95 57 8C D8 8C C3 8E DB 8E C0 8B 54 .....W.........T
0E43:07B0 06 2B C0 D1 E2 D1 D0 FD 8D 7D 0A AB B1 05 D3 EA .+.......}......
0E43:07C0 74 60 81 FA FF 07 74 44 B3 10 81 EA FE 03 92 AB t`....tD........
0E43:07D0 8B 54 05 80 E6 0F 0A F3 8B 4C 03 8B 5C 01 8A 24 .T.......L..\..$
0E43:07E0 B0 00 D1 E0 D1 D3 D1 D1 D1 D2 D1 E0 D1 D3 D1 D1 ................
0E43:07F0 D1 D2 D1 E0 D1 D3 D1 D1 D1 D2 92 AB 91 AB 93 AB ................
0E43:0800 92 AB 8C D8 8C C3 8E DB 8E C0 5F C3 8A 5C 06 83 .........._..\..
0E43:0810 E3 0F 0B 5C 04 0B 5C 02 0B 1C BA 01 40 80 CB 10 ...\..\.....@...
0E43:0820 EB AC 8A 5C 06 83 E3 0F 0B 5C 04 0B 5C 02 0B 1C ...\.....\..\...
0E43:0830 75 05 BA 01 C0 EB 97 8B 54 05 80 E6 0F 8B 4C 03 u.......T.....L.
0E43:0840 8B 5C 01 8A 24 B0 04 FE C8 D0 E4 D1 D3 D1 D1 13 .\..$...........
0E43:0850 D2 79 F4 50 B4 00 2D FE 03 AB 58 B0 00 EB 9B 56 .y.P..-...X....V
0E43:0860 57 FC A5 A5 A5 A5 AD 8B 0C 3D 01 40 7D 0F 05 FE W........=.@}...
0E43:0870 3F 7C 0F D1 E0 D1 E9 D1 D8 AB 5F 5E C3 B8 FF 7F ?|........_^....
0E43:0880 EB F1 2B C0 EB ED 56 57 1E 06 8C D8 8C C3 8E C0 ..+...VW........
0E43:0890 8E DB FD 8D 74 08 8D 7D 0A AD 93 2B C0 D1 E3 D1 ....t..}...+....
0E43:08A0 D0 AB D1 EB 74 10 81 EB FE 3F 93 AB A5 A5 A5 A5 ....t....?......
0E43:08B0 FC 07 1F 5F 5E C3 B8 01 C0 AB 2B C0 AB AB AB AB ..._^.....+.....
0E43:08C0 EB EE 52 56 8B 54 06 81 E2 FF 7F 0B 14 0B 54 02 ..RV.T........T.
0E43:08D0 0B 54 04 75 21 83 FB FF 74 18 81 7F 08 01 40 7C .T.u!...t.....@|
0E43:08E0 11 8B 57 06 81 E2 FF 7F 0B 17 0B 57 02 0B 57 04 ..W........W..W.
0E43:08F0 75 45 F8 5E 5A C3 83 FB FF 74 3E 81 7F 08 01 40 uE.^Z....t>....@
0E43:0900 7C 37 8B 57 06 81 E2 FF 7F 0B 17 0B 57 02 0B 57 |7.W........W..W
0E43:0910 04 74 26 8B 54 06 3B 57 06 77 1E 72 1A 8B 54 04 .t&.T.;W.w.r..T.
0E43:0920 3B 57 04 77 14 72 10 8B 54 02 3B 57 02 77 0A 72 ;W.w.r..T.;W.w.r
0E43:0930 06 8B 14 3B 17 77 02 8B F3 57 B5 01 E8 85 14 B9 ...;.w...W......
0E43:0940 06 00 FC F3 A5 F9 5F EB AA B1 01 EB 02 B1 00 55 ......_........U
0E43:0950 8B EC 8D 66 FA 56 57 8B 76 08 8B 7E 06 8A C1 32 ...f.VW.v..~...2
0E43:0960 45 0A 32 44 0A 88 46 FA 8B 44 08 8B 5D 08 3D 01 E.2D..F..D..].=.
0E43:0970 40 7D 39 81 FB 01 40 7D 59 3B C3 7D 08 32 4D 0A @}9...@}Y;.}.2M.
0E43:0980 93 87 F7 EB 03 8A 4C 0A 88 4E FB 8B 4C 08 89 4E ......L..N..L..N
0E43:0990 FC 81 FB 01 C0 7E 07 2B C3 3D 40 00 7E 5E 8B 04 .....~.+.=@.~^..
0E43:09A0 8B 5C 02 8B 4C 04 8B 54 06 E9 30 01 53 57 8B DF .\..L..T..0.SW..
0E43:09B0 8B 7E 04 E8 0C FF 5F 5B 72 3F 81 FB 01 40 7C 26 .~...._[r?...@|&
0E43:09C0 8A 44 0A 32 46 FA 3A 45 0A 8A 46 FA 0A C0 75 23 .D.2F.:E..F...u#
0E43:09D0 EB 14 BB FF FF 8A 45 0A 32 C1 8B F7 8B 7E 04 E8 ......E.2....~..
0E43:09E0 E0 FE 72 15 EB 03 8A 44 0A 88 46 FB C7 46 FC 01 ..r....D..F..F..
0E43:09F0 40 EB AB 8B 7E 04 E8 B2 F6 E9 F3 00 88 46 FF 8B @...~........F..
0E43:0A00 05 8B 5D 02 8B 4D 04 8B 55 06 C6 46 FE 00 80 6E ..]..M..U..F...n
0E43:0A10 FF 08 7C 19 88 46 FE 8A C4 8A E3 8A DF 8A F9 8A ..|..F..........
0E43:0A20 CD 8A EA 8A D6 B6 00 80 6E FF 08 7D E7 80 66 FF ........n..}..f.
0E43:0A30 07 74 10 D1 EA D1 D9 D1 DB D1 D8 D0 5E FE FE 4E .t..........^..N
0E43:0A40 FF 75 F0 2B FF 80 7E FA 00 75 1D 03 04 13 5C 02 .u.+..~..u....\.
0E43:0A50 13 4C 04 13 54 06 73 64 D1 DA D1 D9 D1 DB D1 D8 .L..T.sd........
0E43:0A60 D0 5E FE FF 46 FC EB 54 80 76 FB 01 2B 04 1B 5C .^..F..T.v..+..\
0E43:0A70 02 1B 4C 04 1B 54 06 73 18 80 76 FB 01 F7 D2 F7 ..L..T.s..v.....
0E43:0A80 D1 F7 D3 F7 D0 F6 5E FE F5 13 C7 13 DF 13 CF 13 ......^.........
0E43:0A90 D7 BE 40 00 0A F6 78 24 4E 74 16 D0 66 FE D1 D0 ..@...x$Nt..f...
0E43:0AA0 D1 D3 D1 D1 13 D2 79 F0 83 EE 40 01 76 FC EB 0C ......y...@.v...
0E43:0AB0 90 C7 46 FC 01 C0 C6 46 FB 00 EB 20 D0 66 FE 13 ..F....F... .f..
0E43:0AC0 C7 13 DF 13 CF 13 D7 73 05 D1 DA FF 46 FC 81 7E .......s....F..~
0E43:0AD0 FC 01 40 7D 22 81 7E FC 01 C0 7E 24 FC 8B 7E 04 ..@}".~...~$..~.
0E43:0AE0 AB 93 AB 91 AB 92 AB 8B 46 FC AB 8A 46 FB AA 5F ........F...F.._
0E43:0AF0 5E 8B E5 5D C2 06 00 B5 08 C7 46 FC 01 40 EB 07 ^..]......F..@..
0E43:0B00 B5 10 C7 46 FC 01 C0 E8 BA 12 C6 46 FB 00 2B C0 ...F.......F..+.
0E43:0B10 8B D8 8B C8 8B D0 EB C4 55 8B EC 8D 66 FE 56 57 ........U...f.VW
0E43:0B20 FC 8B 76 08 8B 7E 06 8A 4C 0A 32 4D 0A 88 4E FE ..v..~..L.2M..N.
0E43:0B30 8B 5D 08 8B 44 08 3D 01 40 7D 28 81 FB 01 40 7D .]..D.=.@}(...@}
0E43:0B40 37 3B C3 7C 01 93 3D 01 C0 7E 13 03 C3 48 3D 01 7;.|..=..~...H=.
0E43:0B50 40 7D 43 40 3D 01 C0 7F 50 B5 10 E8 66 12 B8 01 @}C@=...P...f...
0E43:0B60 C0 EB 3B 57 8B DF 8B 7E 04 E8 56 FD 5F 72 38 81 ..;W...~..V._r8.
0E43:0B70 7D 08 01 C0 7E 18 EB 23 56 BB FF FF 8B F7 8B 7E }...~..#V......~
0E43:0B80 04 E8 3E FD 5E 72 20 81 7C 08 01 C0 7F 0D 8B 7E ..>.^r .|......~
0E43:0B90 04 E8 17 F5 EB 5B B5 08 E8 29 12 B8 01 40 8B 7E .....[...)...@.~
0E43:0BA0 04 8A 4E FE E8 F2 F4 EB 48 50 E8 17 F5 87 F7 E8 ..N.....HP......
0E43:0BB0 12 F5 E8 44 00 83 06 86 01 18 5F 0B D2 78 0B 4F ...D......_..x.O
0E43:0BC0 D1 E6 D1 D0 D1 D3 D1 D1 D1 D2 D1 E6 15 00 00 83 ................
0E43:0BD0 D3 00 83 D1 00 83 D2 00 73 03 D1 DA 47 8B F7 8B ........s...G...
0E43:0BE0 7E 04 AB 93 AB 91 AB 92 AB 96 AB 8A 46 FE B4 00 ~...........F...
0E43:0BF0 AB 5F 5E 8B E5 5D C2 06 00 55 57 8B 2E 86 01 2B ._^..]...UW....+
0E43:0C00 FF 8B CF 8B F7 F6 46 0F 80 74 06 8B 4E 00 8B 76 ......F..t..N..v
0E43:0C10 02 F6 46 03 80 74 0F 03 4E 0C 13 76 0E 13 FF F6 ..F..t..N..v....
0E43:0C20 46 0F 80 74 01 4F 2B DB 8B 46 0C F7 66 04 03 C8 F..t.O+..F..f...
0E43:0C30 13 F2 83 D7 00 8B 46 10 0B C0 74 17 F7 66 00 03 ......F...t..f..
0E43:0C40 C8 13 F2 83 D7 00 8B 46 10 F7 66 02 03 F0 13 FA .......F..f.....
0E43:0C50 83 D3 00 8B 46 0C F7 66 06 03 F0 13 FA 83 D3 00 ....F..f........
0E43:0C60 8B 46 0E F7 66 04 03 F0 13 FA 83 D3 00 8B 46 12 .F..f.........F.
0E43:0C70 0B C0 74 0A F7 66 00 03 F0 13 FA 83 D3 00 2B C9 ..t..f........+.
0E43:0C80 56 8B F1 8B 46 0E F7 66 06 03 F8 13 DA 83 D1 00 V...F..f........
0E43:0C90 8B 46 10 0B C0 74 17 F7 66 04 03 F8 13 DA 83 D1 .F...t..f.......
0E43:0CA0 00 8B 46 10 F7 66 06 03 D8 13 CA 83 D6 00 8B 46 ..F..f.........F
0E43:0CB0 12 0B C0 74 24 F7 66 02 03 F8 13 DA 83 D1 00 83 ...t$.f.........
0E43:0CC0 D6 00 8B 46 12 F7 66 04 03 D8 13 CA 83 D6 00 8B ...F..f.........
0E43:0CD0 46 12 F7 66 06 03 C8 13 F2 8B D6 97 5E 5F 5D C3 F..f........^_].
0E43:0CE0 55 8B EC 8D 66 F8 8B 5E 08 FF 77 06 FF 77 04 FF U...f..^..w..w..
0E43:0CF0 77 02 FF 37 2B C0 50 56 57 FC 8B 7E 06 8A 47 0A w..7+.PVW..~..G.
0E43:0D00 32 45 0A 88 46 FD 8B 75 08 8B 47 08 81 FE 01 40 2E..F..u..G....@
0E43:0D10 7D 3E 3D 01 40 7D 4F 81 FE 01 C0 7E 1F 3D 01 C0 }>=.@}O....~.=..
0E43:0D20 7E 11 2B C6 3D 01 40 7D 0F 3D 01 C0 7F 47 B5 10 ~.+.=.@}.=...G..
0E43:0D30 E8 91 10 B8 01 C0 EB 0C B5 08 EB 02 B5 04 E8 83 ................
0E43:0D40 10 B8 01 40 8A 4E FD 8B 7E 04 E8 4C F3 E9 D5 01 ...@.N..~..L....
0E43:0D50 8B F7 8B 7E 04 E8 6A FB 72 F3 81 7F 08 01 40 7C ...~..j.r.....@|
0E43:0D60 D2 E8 47 F3 EB E7 8B F3 BB FF FF 8B 7E 04 E8 51 ..G.........~..Q
0E43:0D70 FB 72 DA EB CC 89 46 FE 2B C9 8B 56 F6 8B 75 06 .r....F.+..V..u.
0E43:0D80 3B F2 77 03 2B D6 41 8B 46 F4 F7 F6 15 01 00 12 ;.w.+.A.F.......
0E43:0D90 CD 88 4E FC 89 46 FA 50 8B 05 8B 5D 02 E3 11 8B ..N..F.P...]....
0E43:0DA0 55 04 29 46 F0 19 5E F2 19 56 F4 19 76 F6 E2 F2 U.)F..^..V..v...
0E43:0DB0 5E F7 E6 89 46 EE 92 93 F7 E6 03 D8 13 CA 8B 45 ^...F..........E
0E43:0DC0 04 F7 E6 03 C8 83 D2 00 92 96 F7 65 06 03 C6 83 ...........e....
0E43:0DD0 D2 00 2B 5E F0 1B 4E F2 1B 46 F4 1B 56 F6 89 5E ..+^..N..F..V..^
0E43:0DE0 F0 89 4E F2 89 46 F4 8B 75 06 F7 F6 91 F7 F6 2B ..N..F..u......+
0E43:0DF0 D2 F9 13 C2 13 CA 2B D0 89 56 F8 19 4E FA 80 5E ......+..V..N..^
0E43:0E00 FC 00 50 8B 05 8B 5D 02 E3 11 8B 55 04 29 46 EE ..P...]....U.)F.
0E43:0E10 19 5E F0 19 56 F2 19 76 F4 E2 F2 5E F7 E6 92 93 .^..V..v...^....
0E43:0E20 F7 E6 03 D8 13 CA 8B 45 04 F7 E6 03 C8 83 D2 00 .......E........
0E43:0E30 92 96 F7 65 06 03 C6 83 D2 00 2B 5E EE 1B 4E F0 ...e......+^..N.
0E43:0E40 1B 46 F2 1B 56 F4 89 5E EE 89 4E F0 89 46 F2 8B .F..V..^..N..F..
0E43:0E50 75 06 F7 F6 91 F7 F6 2B D2 F9 13 C2 13 CA 89 46 u......+.......F
0E43:0E60 F6 01 4E F8 11 56 FA 10 56 FC 96 8B 55 02 92 8B ..N..V..V...U...
0E43:0E70 5D 04 E3 0B 29 46 EE 19 5E F0 19 56 F2 E2 F5 F7 ]...)F..^..V....
0E43:0E80 E6 92 93 F7 E6 03 D8 13 CA 8B 45 06 F7 E6 03 C1 ..........E.....
0E43:0E90 83 D2 00 2B 5E EE 1B 46 F0 1B 56 F2 89 5E EE 89 ...+^..F..V..^..
0E43:0EA0 46 F0 8B 75 04 03 F6 8B 75 06 83 D6 00 73 04 87 F..u....u....s..
0E43:0EB0 DA EB 11 D1 E3 D1 D0 D1 D2 F7 F6 93 F7 F6 D1 EB ................
0E43:0EC0 D1 D8 D0 DE B9 FF FF 8B F1 8A D1 F7 D3 F7 D0 F6 ................
0E43:0ED0 DE F5 15 00 00 13 5E F6 13 4E F8 13 76 FA 12 56 ......^..N..v..V
0E43:0EE0 FC D0 EA 73 0D D1 DE D1 D9 D1 DB D1 D8 D0 DE FF ...s............
0E43:0EF0 46 FE 2B FF 02 F6 13 C7 13 DF 13 CF 13 F7 80 D2 F.+.............
0E43:0F00 00 8B 56 FE 74 04 BE 00 80 42 81 FA 01 40 7C 03 ..V.t....B...@|.
0E43:0F10 E9 2E FE 8B 7E 04 FC AB 93 AB 91 AB 96 AB 92 AB ....~...........
0E43:0F20 8A 46 FD 98 AB 5F 5E 8B E5 5D C2 06 00 55 8B EC .F..._^..]...U..
0E43:0F30 56 57 8B 44 08 3D 01 C0 7E 29 3D 01 40 7D 28 80 VW.D.=..~)=.@}(.
0E43:0F40 7C 0A 00 75 2C E8 7C F1 E8 37 00 8B 3E 86 01 56 |..u,.|..7..>..V
0E43:0F50 57 56 E8 8B FD 57 56 56 E8 F2 F9 FF 4C 08 83 06 WV...WVV....L...
0E43:0F60 86 01 0C 5F 5E 5D C3 BB FF FF 8B FE E8 53 F9 EB ..._^].......S..
0E43:0F70 F2 B5 01 E8 4E 0E 8B FE E8 09 F1 C7 45 08 01 40 ....N.......E..@
0E43:0F80 EB E1 56 57 8B 3E 86 01 8B 5D 08 8B 55 06 8B 45 ..VW.>...]..U..E
0E43:0F90 04 8B 4D 02 D1 FB 73 07 43 D1 EA D1 D8 D1 D9 83 ..M...s.C.......
0E43:0FA0 FA FE 73 1D 53 51 8B CA 8B D8 8B F2 F9 D1 DE F7 ..s.SQ..........
0E43:0FB0 F6 4E 3B F0 76 12 46 03 F0 D1 DE 8B D1 8B C3 EB .N;.v.F.........
0E43:0FC0 EE F9 D1 DA D1 D8 EB 17 46 3B F0 73 01 96 59 5B ........F;.s..Y[
0E43:0FD0 91 F7 F6 2B D2 03 F1 D1 DE D1 D8 13 C2 13 D6 FC ...+............
0E43:0FE0 2B C9 91 AB AB 91 AB 92 AB 93 AB B8 00 00 AB 5F +.............._
0E43:0FF0 5E C3 00 02 40 42 01 03 41 43 55 8B EC FF 75 0A ^...@B..ACU...u.
0E43:1000 8D 66 FA 56 57 8B 05 8B 5D 02 8B 4D 04 8B 55 06 .f.VW...]..M..U.
0E43:1010 C7 46 FC 00 00 8B 7D 08 2B 7C 08 7D 18 EB 52 90 .F....}.+|.}..R.
0E43:1020 47 EB 3D 4F 7C FA D1 66 FC D1 E0 D1 D3 D1 D1 13 G.=O|..f........
0E43:1030 D2 72 1B 79 EE 3B 54 06 77 14 72 E7 3B 4C 04 77 .r.y.;T.w.r.;L.w
0E43:1040 0D 72 E0 3B 5C 02 77 06 72 D9 3B 04 72 D5 FF 46 .r.;\.w.r.;.r..F
0E43:1050 FC 2B 04 1B 5C 02 1B 4C 04 1B 54 06 0B FF 7F C3 .+..\..L..T.....
0E43:1060 0B D2 78 0D 74 44 4F D1 E0 D1 D3 D1 D1 13 D2 79 ..x.tDO........y
0E43:1070 F5 03 7C 08 57 8B 7E F6 AB 93 AB 91 AB 92 AB 58 ..|.W.~........X
0E43:1080 AB 8A 46 FE 98 AB 80 26 83 01 BC BF 07 00 8B 46 ..F....&.......F
0E43:1090 FC 80 7E FE 01 75 02 F7 D8 23 F8 2E 8A 95 F2 0F ..~..u...#......
0E43:10A0 08 16 83 01 5F 5E 8B E5 5D C3 87 D1 87 CB 93 83 ...._^..].......
0E43:10B0 EF 10 0B D2 75 AA 87 D1 87 CB 83 EF 10 87 D1 83 ....u...........
0E43:10C0 EF 10 0B D2 75 9A BF 01 C0 2B D2 2B C9 2B DB 2B ....u....+.+.+.+
0E43:10D0 C0 EB A1 8B 54 06 81 E2 FF 7F 0B 14 0B 54 02 0B ....T........T..
0E43:10E0 54 04 74 34 B5 01 E8 DB 0C B8 00 45 E9 91 00 8B T.t4.......E....
0E43:10F0 55 06 81 E2 FF 7F 0B 15 0B 55 02 0B 55 04 75 E4 U........U..U.u.
0E43:1100 EB 1C 55 8B EC 56 57 8B 76 06 8B 7E 04 8B 44 08 ..U..VW.v..~..D.
0E43:1110 8B 5D 08 3D 01 40 7D BB 81 FB 01 40 7D D1 8B D0 .].=.@}....@}...
0E43:1120 3B C3 7F 02 8B D3 81 FA 01 C0 7E 3B 8A 4C 0A 3A ;.........~;.L.:
0E43:1130 4D 0A 7C 49 7F 3D 3B C3 7C 34 7F 3C 8B 44 06 3B M.|I.=;.|4.<.D.;
0E43:1140 45 06 75 28 B5 03 22 2E 85 01 74 3E 8B 44 04 3B E.u(.."...t>.D.;
0E43:1150 45 04 75 18 8B 44 02 3B 45 02 75 10 80 FD 02 74 E.u..D.;E.u....t
0E43:1160 4B 8B 04 3B 05 75 05 B8 00 40 EB 14 77 0A 80 F9 K..;.u...@..w...
0E43:1170 00 75 0A B8 00 01 EB 08 80 F9 00 75 F6 B8 00 00 .u.........u....
0E43:1180 88 26 83 01 5F 5E 5D C2 04 00 8B 1C 2B 1D 8B 5C .&.._^].....+..\
0E43:1190 02 1B 5D 02 8B 5C 04 1B 5D 04 77 09 F7 DB 83 E3 ..]..\..].w.....
0E43:11A0 80 74 C4 EB C9 83 E3 80 74 BD EB CC 8B 1C 2B 1D .t......t.....+.
0E43:11B0 77 09 F7 DB 80 E7 FC 74 AE EB B3 80 E7 FC 74 A7 w......t......t.
0E43:11C0 EB B6 B8 00 40 81 7C 08 01 C0 7E 13 81 7C 08 01 ....@.|...~..|..
0E43:11D0 40 7D 11 B8 00 01 80 7C 0A 01 74 03 B8 00 00 88 @}.....|..t.....
0E43:11E0 26 83 01 C3 8B 54 06 81 E2 FF 7F 0B 14 0B 54 02 &....T........T.
0E43:11F0 0B 54 04 74 DE B5 01 E8 CA 0B B8 00 45 EB E0 B8 .T.t........E...
0E43:1200 00 40 81 7C 08 01 C0 7E 13 81 7C 08 01 40 7D 11 .@.|...~..|..@}.
0E43:1210 B8 00 04 80 7C 0A 01 75 03 0D 00 02 88 26 83 01 ....|..u.....&..
0E43:1220 C3 B8 00 05 8B 54 06 81 E2 FF 7F 0B 14 0B 54 02 .....T........T.
0E43:1230 0B 54 04 74 DE B8 00 01 EB D9 55 56 57 8B 2E 86 .T.t......UVW...
0E43:1240 01 8B 46 00 8B 5E 02 8B 4E 04 8B 56 06 2B FF 8B ..F..^..N..V.+..
0E43:1250 76 08 83 FE F0 7F 0D 8B F8 8B C3 8B D9 8B CA 2B v..............+
0E43:1260 D2 83 C6 10 46 7F 0C D1 EA D1 D9 D1 DB D1 D8 D1 ....F...........
0E43:1270 DF EB F1 D1 E7 BF 00 00 13 C7 13 DF 13 CF 13 D7 ................
0E43:1280 89 46 00 89 5E 02 89 4E 04 89 56 06 8B DF 8B CF .F..^..N..V.....
0E43:1290 8B F7 F6 46 03 80 74 0A 8B 5E 00 8B 4E 02 D1 E3 ...F..t..^..N...
0E43:12A0 D1 D1 8B 46 00 F7 66 04 03 D8 13 CA 13 F7 03 D8 ...F..f.........
0E43:12B0 13 CA 13 F7 8B D9 8B CE 2B F6 8B 46 02 F7 66 04 ........+..F..f.
0E43:12C0 03 D8 13 CA 13 F7 03 D8 13 CA 13 F7 8B 46 00 F7 .............F..
0E43:12D0 66 06 03 D8 13 CA 13 F7 03 D8 13 CA 13 F7 D1 E3 f...............
0E43:12E0 13 CF 13 F7 8B D9 8B CE 2B F6 8B 46 04 F7 E0 03 ........+..F....
0E43:12F0 D8 13 CA 13 F7 8B 46 06 F7 66 02 03 D8 13 CA 13 ......F..f......
0E43:1300 F7 03 D8 13 CA 13 F7 8B 46 06 F7 66 04 03 C8 13 ........F..f....
0E43:1310 F2 13 FF 03 C8 13 F2 83 D7 00 8B 46 06 F7 E0 03 ...........F....
0E43:1320 F0 13 FA 89 5E 00 89 4E 02 89 76 04 89 7E 06 C6 ....^..N..v..~..
0E43:1330 46 0A 00 C7 46 08 00 00 5F 5E 5D C3 55 8B EC 56 F...F..._^].U..V
0E43:1340 57 1E 06 B0 0C F6 66 06 2D 0C 00 96 03 76 04 E8 W.....f.-....v..
0E43:1350 8C ED 8B FE FE 4E 06 7E 7E 57 8B 3E 86 01 8A 45 .....N.~~W.>...E
0E43:1360 16 30 45 0A E8 92 F8 89 05 89 5D 02 89 4D 04 89 .0E.......]..M..
0E43:1370 55 06 5F 83 EF 0C 55 8B 2E 86 01 2E 8B 1D 2E 8B U._...U.........
0E43:1380 4D 02 2E 8B 55 04 2E 8B 75 06 2E 8A 45 0A 3A 46 M...U...u...E.:F
0E43:1390 0A 74 34 2B 5E 00 1B 4E 02 1B 56 04 1B 76 06 73 .t4+^..N..V..v.s
0E43:13A0 14 F7 D6 F7 D2 F7 D1 F7 DB F5 83 D1 00 83 D2 00 ................
0E43:13B0 83 D6 00 34 01 89 5E 00 89 4E 02 89 56 04 89 76 ...4..^..N..V..v
0E43:13C0 06 88 46 0A 5D EB 8D 01 5E 00 11 4E 02 11 56 04 ..F.]...^..N..V.
0E43:13D0 11 76 06 5D E9 7D FF 8B 36 86 01 FC AD 93 AD 91 .v.].}..6.......
0E43:13E0 AD 92 AD 97 AD AD 89 36 86 01 87 F7 2B FF 3C 01 .......6....+.<.
0E43:13F0 75 11 F7 D6 F7 D2 F7 D1 F7 DB F5 13 CF 13 D7 13 u...............
0E43:1400 F7 EB 12 F9 D1 DE D1 DA D1 D9 D1 DB 13 DF 13 CF ................
0E43:1410 13 D7 13 F7 47 A1 86 01 97 93 AB 91 AB 92 AB 96 ....G...........
0E43:1420 AB 93 AB B8 00 00 AB 07 1F 5F 5E 5D C2 04 00 08 ........._^]....
0E43:1430 00 00 00 00 00 00 00 00 00 00 00 00 00 B6 AA AA ................
0E43:1440 AA AA AA AA 2A 00 00 01 00 03 24 22 22 22 22 22 ....*.....$"""""
0E43:1450 02 00 00 00 00 B3 E4 00 0D D0 00 0D 00 00 00 01 ................
0E43:1460 00 6E 08 4B C7 3B 2E 00 00 00 00 00 00 C6 40 16 .n.K.;........@.
0E43:1470 99 6B 00 00 00 00 00 01 00 0C 45 92 B0 00 00 00 .k........E.....
0E43:1480 00 00 00 00 00 D5 45 D6 00 00 00 00 00 00 00 01 ......E.........
0E43:1490 00 08 00 00 00 00 00 00 00 00 00 00 00 00 00 88 ................
0E43:14A0 FF FF FF FF FF FF 7F 00 00 01 00 A6 9A AA AA AA ................
0E43:14B0 AA AA 0A 00 00 00 00 7F E6 04 5B B0 05 5B 00 00 ..........[..[..
0E43:14C0 00 01 00 EF 26 9B 01 1A A0 01 00 00 00 00 00 1D ....&...........
0E43:14D0 CE DC 93 9F 04 00 00 00 00 01 00 0F B1 4B F7 08 .............K..
0E43:14E0 00 00 00 00 00 00 00 03 D8 7B 0C 00 00 00 00 00 .........{......
0E43:14F0 00 01 00 E8 CE EB E8 41 FD 2E FF 36 2F 14 B8 31 .......A...6/..1
0E43:1500 14 50 E8 37 FE FF 36 86 01 56 56 E8 0A F6 83 06 .P.7..6..VV.....
0E43:1510 86 01 0C C3 E8 23 FD 2E FF 36 91 14 B8 93 14 50 .....#...6.....P
0E43:1520 E8 19 FE C3 E8 9D EB E8 10 FD E8 E2 EB E8 C9 FF ................
0E43:1530 E8 E4 FF C3 35 C2 68 21 A2 DA 0F C9 01 00 00 00 ....5.h!........
0E43:1540 08 00 00 00 00 00 00 00 00 00 00 00 00 00 57 55 ..............WU
0E43:1550 55 55 55 55 55 01 00 00 01 00 BE 32 33 33 33 33 UUUUU......23333
0E43:1560 03 00 00 00 00 00 7D 1E 49 92 24 09 00 00 00 00 ......}.I.$.....
0E43:1570 01 00 BC FE C6 71 1C 00 00 00 00 00 00 00 5C FF .....q........\.
0E43:1580 16 5D 00 00 00 00 00 00 01 00 D8 BB 3A 01 00 00 .]..........:...
0E43:1590 00 00 00 00 00 00 0A 0C 04 00 00 00 00 00 00 00 ................
0E43:15A0 01 00 00 00 00 00 00 00 00 E7 FD FF 00 00 BD A4 ................
0E43:15B0 D6 7B EE 64 5C B3 FF FF 00 00 B5 85 47 FC 74 30 .{.d\.......G.t0
0E43:15C0 11 A1 00 00 00 00 00 00 00 00 00 00 00 80 01 00 ................
0E43:15D0 00 00 9C FA 64 B0 B2 1D 07 E6 FE FF 00 00 9C FA ....d...........
0E43:15E0 64 B0 B2 1D 07 E6 FF FF 00 00 F5 BB 4B 04 46 56 d...........K.FV
0E43:15F0 85 AC 00 00 00 00 E6 6E D9 1F BD 09 FA E9 FE FF .......n........
0E43:1600 00 00 8D 7B 35 BD 5B 84 DD F6 FF FF 00 00 7F D5 ...{5.[.........
0E43:1610 35 02 DB 80 73 CC 00 00 00 00 55 8B EC 8D 66 FE 5...s.....U...f.
0E43:1620 56 57 56 57 56 E8 B8 F6 C7 46 FE 00 00 BF A2 15 VWVWV....F......
0E43:1630 83 7E FE 03 73 21 87 F7 E8 A3 EA 87 FE 56 FF 36 .~..s!.......V.6
0E43:1640 86 01 E8 BD FA 83 06 86 01 0C 3D 00 00 75 08 FF ..........=..u..
0E43:1650 46 FE 83 C7 0C EB D9 83 7E FE 00 75 05 E8 6D 00 F.......~..u..m.
0E43:1660 EB 65 8B 5E FE 4B 2E 8A 9F 02 00 89 5E FE 81 C3 .e.^.K......^...
0E43:1670 F6 15 8B FB 87 F7 E8 65 EA 87 FE 56 8B 3E 86 01 .......e...V.>..
0E43:1680 57 8D 45 F4 A3 86 01 50 E8 BE F2 56 57 56 E8 87 W.E....P...VWV..
0E43:1690 F4 E8 8A E9 57 56 56 E8 B3 F2 FF 36 86 01 56 56 ....WVV....6..VV
0E43:16A0 E8 3D F6 83 06 86 01 18 E8 22 00 8B 7E FE 81 C7 .=......."..~...
0E43:16B0 D2 15 87 F7 E8 27 EA 87 FE FF 36 86 01 56 56 E8 .....'....6..VV.
0E43:16C0 8B F2 83 06 86 01 0C 5F 5E 8B E5 5D C3 56 57 E8 ......._^..].VW.
0E43:16D0 F2 E9 83 7C 08 E0 7F 07 8B FE E8 1F EA EB 22 8B ...|..........".
0E43:16E0 3E 86 01 83 45 08 03 E8 50 FB 2E FF 36 40 15 B8 >...E...P...6@..
0E43:16F0 42 15 50 E8 46 FC 57 56 56 E8 1C F4 83 06 86 01 B.P.F.WVV.......
0E43:1700 0C 5F 5E C3 0D 00 00 00 00 00 00 00 00 00 00 00 ._^.............
0E43:1710 00 00 03 00 00 00 00 00 00 40 00 00 00 00 A9 AA .........@......
0E43:1720 AA AA AA AA AA 0A 00 00 00 00 78 55 55 55 55 55 ..........xUUUUU
0E43:1730 55 01 00 00 00 00 26 23 22 22 22 22 22 00 00 00 U.....&#"""""...
0E43:1740 00 00 1C 2B D8 82 2D D8 02 00 00 00 00 00 FC F9 ...+..-.........
0E43:1750 33 40 03 34 00 00 00 00 00 00 14 52 03 34 40 03 3@.4.......R.4@.
0E43:1760 00 00 00 00 00 00 1E 6C C7 3B 2E 00 00 00 00 00 .......l.;......
0E43:1770 00 00 4C B0 C9 4F 02 00 00 00 00 00 00 00 91 0E ..L..O..........
0E43:1780 E6 1A 00 00 00 00 00 00 00 00 51 76 1F 01 00 00 ..........Qv....
0E43:1790 00 00 00 00 00 00 C5 2C 0B 00 00 00 00 00 00 00 .......,........
0E43:17A0 00 00 55 56 57 8B 2E 86 01 8D 7E F4 89 3E 86 01 ..UVW.....~..>..
0E43:17B0 E8 C0 E8 57 56 56 E8 5F F3 89 2E 86 01 8B 7C 08 ...WVV._......|.
0E43:17C0 83 FF E0 7E 57 8B 04 8B 5C 02 8B 4C 04 8B 54 06 ...~W...\..L..T.
0E43:17D0 47 7D 17 D1 EA D1 D9 D1 DB D1 D8 47 7C F5 15 00 G}.........G|...
0E43:17E0 00 83 D3 00 83 D1 00 83 D2 00 83 2E 86 01 0C FC ................
0E43:17F0 8B 3E 86 01 AB 93 AB 91 AB 92 AB 2B C0 AB AB 83 .>.........+....
0E43:1800 EF 0C 2E FF 36 04 17 B8 06 17 50 E8 2E FB A1 86 ....6.....P.....
0E43:1810 01 50 56 56 E8 01 F3 83 06 86 01 0C 5F 5E 5D C3 .PVV........_^].
0E43:1820 BB F0 17 5C 29 3B AA B8 01 00 00 00 09 00 00 00 ...\);..........
0E43:1830 00 00 00 00 00 00 00 00 00 00 68 55 55 55 55 55 ..........hUUUUU
0E43:1840 55 05 00 00 00 00 BA 34 33 33 33 33 33 00 00 00 U......433333...
0E43:1850 00 00 A7 C3 48 92 24 49 02 00 00 00 00 00 4D 5D ....H.$I......M]
0E43:1860 22 C7 71 1C 00 00 00 00 00 00 24 56 EB 5C 74 01 ".q.......$V.\t.
0E43:1870 00 00 00 00 00 00 39 AD EC B1 13 00 00 00 00 00 ......9.........
0E43:1880 00 00 FD D6 80 0F 01 00 00 00 00 00 00 00 B5 7A ...............z
0E43:1890 E4 10 00 00 00 00 00 00 00 00 55 8B EC FF 75 08 ..........U...u.
0E43:18A0 56 57 8B 05 8B 5D 02 8B 4D 04 8B 55 06 81 FA 05 VW...]..M..U....
0E43:18B0 B5 77 10 D1 E0 D1 D3 D1 D1 D1 D2 BE 00 00 FF 4E .w.............N
0E43:18C0 FE EB 15 F7 D2 F7 D1 F7 D3 F7 D8 F5 83 D3 00 83 ................
0E43:18D0 D1 00 83 D2 00 BE 01 00 2B FF 0B D2 75 19 93 91 ........+...u...
0E43:18E0 92 83 EF 10 83 FF C0 7F F1 83 2E 86 01 0C 8B 3E ...............>
0E43:18F0 86 01 E8 8F E7 EB 2D 78 0B 4F D1 E0 D1 D3 D1 D1 ......-x.O......
0E43:1900 13 D2 79 F5 56 57 52 51 53 50 8B F4 E8 7B 00 BE ..y.VWRQSP...{..
0E43:1910 20 18 E8 C9 E7 8B 36 86 01 8B C4 56 50 56 E8 F7  .....6....VPV..
0E43:1920 F1 83 C4 0C 8D 76 FE 83 2E 86 01 0C 8B 3E 86 01 .....v.......>..
0E43:1930 E8 10 E8 8D 75 0C 56 57 57 E8 11 F0 57 FF 76 FC ....u.VWW...W.v.
0E43:1940 FF 76 FC E8 D2 F1 83 06 86 01 18 5F 5E 8B E5 5D .v........._^..]
0E43:1950 C3 55 8B EC 56 57 8B F7 E8 69 E7 8B 36 86 01 E8 .U..VW...i..6...
0E43:1960 28 00 BE 20 18 E8 76 E7 8B 36 86 01 56 8D 74 0C (.. ..v..6..V.t.
0E43:1970 56 56 E8 A3 F1 56 FF 76 FE FF 76 FE E8 99 F1 83 VV...V.v..v.....
0E43:1980 06 86 01 18 5F 5E 8B E5 5D C3 55 8B EC 56 57 83 ...._^..].U..VW.
0E43:1990 7C 08 C0 7E 46 83 2E 86 01 0C 8B 3E 86 01 E8 7D |..~F......>...}
0E43:19A0 E6 FF 45 08 56 57 57 E8 A3 EF 56 57 57 E8 30 F3 ..E.VWW...VWW.0.
0E43:19B0 E8 5C E7 8B 1E 86 01 83 47 08 02 E8 7C F8 2E FF .\......G...|...
0E43:19C0 36 2C 18 B8 2E 18 50 E8 72 F9 FF 36 86 01 57 56 6,....P.r..6..WV
0E43:19D0 E8 45 F1 FF 44 08 83 06 86 01 18 5F 5E 8B E5 5D .E..D......_^..]
0E43:19E0 C3 B1 00 EB 06 B1 02 EB 02 B1 04 8E C7 8B EC 8B ................
0E43:19F0 3E 86 01 8A 6D 0A 51 50 83 7D 08 E0 7F 0B 80 F9 >...m.QP.}......
0E43:1A00 02 75 03 E8 18 E6 E9 BA 00 83 7D 08 40 7E 0B E8 .u........}.@~..
0E43:1A10 99 E6 C7 45 06 21 00 E9 A9 00 C6 45 0A 00 8D 75 ...E.!.....E...u
0E43:1A20 F4 89 36 86 01 87 FE E8 27 E6 87 FE 83 6C 08 02 ..6.....'....l..
0E43:1A30 E8 C7 F5 24 07 88 46 FC 8A 5E FE 80 FB 04 74 3B ...$..F..^....t;
0E43:1A40 02 5E FC 80 E3 07 88 5E FC D1 EB 73 11 87 FE E8 .^.....^...s....
0E43:1A50 FF E5 87 FE 83 6C 08 02 56 57 57 E8 EB EE 89 3E .....l..VWW....>
0E43:1A60 86 01 8B F7 F6 46 FC 03 7A 05 E8 A7 FA EB 03 E8 .....F..z.......
0E43:1A70 81 FA 8A 5E FC D0 EB D0 EB EB 3C F6 46 FC 01 74 ...^......<.F..t
0E43:1A80 11 87 F7 E8 CB E5 87 F7 83 6C 08 02 56 57 57 E8 .........l..VWW.
0E43:1A90 B7 EE 89 3E 86 01 8B F7 E8 89 FA 8D 7C F4 8B C6 ...>........|...
0E43:1AA0 F6 46 FC 03 7A 02 87 F7 97 56 50 57 E8 31 F2 8A .F..z....VPW.1..
0E43:1AB0 5E FC D0 EB 80 E3 01 80 7E FE 02 74 03 32 5E FF ^.......~..t.2^.
0E43:1AC0 88 5D 0A 89 3E 86 01 8B E5 C3 8E C7 8B 36 86 01 .]..>........6..
0E43:1AD0 8D 7C F4 89 3E 86 01 E8 44 E5 8B 44 08 3D 01 40 .|..>...D..D.=.@
0E43:1AE0 7D 38 3D 01 C0 7E 2E B1 00 8B DE 48 7C 07 E8 38 }8=..~.....H|..8
0E43:1AF0 E6 8B DF B1 01 B5 00 86 6F 0A 51 E8 1C FB 59 80 ........o.Q...Y.
0E43:1B00 F9 01 75 0E 51 E8 49 E5 FF 4D 08 57 56 56 E8 38 ..u.Q.I..M.WVV.8
0E43:1B10 EE 59 88 6C 0A 89 36 86 01 C3 8B FE FF 74 0A E8 .Y.l..6......t..
0E43:1B20 2F E5 8F 44 0A FF 4C 08 EB EB 8E C7 8B 36 86 01 /..D..L......6..
0E43:1B30 8D 7C F4 89 3E 86 01 E8 39 E5 EB 22 8E C7 8B 36 .|..>...9.."...6
0E43:1B40 86 01 8D 7C F4 89 3E 86 01 E8 D2 E4 EB 10 8E C7 ...|..>.........
0E43:1B50 8B 36 86 01 8D 7C F4 89 3E 86 01 E8 04 E5 E8 C8 .6...|..>.......
0E43:1B60 E5 80 7D 0A 00 75 19 8B 45 08 3D 01 C0 7E 0D 3D ..}..u..E.=..~.=
0E43:1B70 01 40 7D 0C E8 23 FD 89 36 86 01 C3 B5 04 EB 02 .@}..#..6.......
0E43:1B80 B5 01 E8 3F 02 B8 01 40 8B FE B1 00 E8 0A E5 EB ...?...@........
0E43:1B90 E6 B8 40 00 EB 0E 8E C7 8B 36 86 01 8D 7C F4 EB ..@......6...|..
0E43:1BA0 1C B8 2F 00 8E C7 8B 36 86 01 8D 7C F4 89 3E 86 ../....6...|..>.
0E43:1BB0 01 FF D0 56 57 56 E8 5F EF 89 36 86 01 8B EC B8 ...VWV._..6.....
0E43:1BC0 00 00 50 8B 44 08 3D 0B 00 7F 4E 3D C0 FF 7E 5A ..P.D.=...N=..~Z
0E43:1BD0 E8 3C E5 FF 45 08 FF 36 84 01 80 26 85 01 F3 80 .<..E..6...&....
0E43:1BE0 0E 85 01 04 8B F7 E8 34 E9 8F 06 84 01 50 8B FC .......4.....P..
0E43:1BF0 E8 85 E5 FF 4C 08 8D 7C 0C 57 56 57 E8 4A ED 58 ....L..|.WVW.J.X
0E43:1C00 D1 F8 73 2D C7 04 85 64 C7 44 02 DE F9 C7 44 04 ..s-...d.D....D.
0E43:1C10 33 F3 C7 44 06 04 B5 EB 2B 8B FE B5 08 E8 A4 01 3..D....+.......
0E43:1C20 B8 01 40 B1 00 E8 71 E4 EB 40 8B FE E8 EF E3 EB ..@...q..@......
0E43:1C30 39 C7 04 00 00 C7 44 02 00 00 C7 44 04 00 00 C7 9.....D....D....
0E43:1C40 44 06 00 80 40 89 44 08 C6 44 0A 00 8B FE 8D 75 D...@.D..D.....u
0E43:1C50 0C E8 4E FB 56 57 56 E8 BE EE 56 57 56 E8 ED EC ..N.VWV...VWV...
0E43:1C60 80 7E FE 01 75 04 80 74 0A 01 89 36 86 01 8B E5 .~..u..t...6....
0E43:1C70 C3 8E C7 8D 7E 18 B5 00 8B E9 B0 0A F6 E1 03 F8 ....~...........
0E43:1C80 BE 6E 01 83 EE 0C 83 EF 0A E8 D3 EB 4D 7F F4 8B .n..........M...
0E43:1C90 CE 2B 0E 86 01 83 EE 02 BF 6C 01 FD D1 E9 74 02 .+.......l....t.
0E43:1CA0 F3 A5 47 47 89 3E 86 01 C3 8E C7 B5 00 8B E9 8A ..GG.>..........
0E43:1CB0 D9 B7 00 2E 8A 9F 02 00 8B 36 86 01 8B FE 2B FB .........6....+.
0E43:1CC0 89 3E 86 01 B9 6E 01 2B CE 74 05 FC D1 E9 F3 A5 .>...n.+.t......
0E43:1CD0 8D 76 18 E8 B0 EB 83 C7 0C 83 C6 0A 4D 7F F4 C3 .v..........M...
0E43:1CE0 8B 1E 86 01 53 8D 77 0C 56 83 C6 0C EB 14 8B 1E ....S.w.V.......
0E43:1CF0 86 01 53 8D 77 0C 56 EB 09 8B 36 86 01 56 8D 5C ..S.w.V...6..V.\
0E43:1D00 0C 53 8E C7 E8 FB F3 89 36 86 01 88 66 16 C3 80 .S......6...f...
0E43:1D10 26 85 01 FC EB 05 80 26 85 01 FE 8E C7 8B 1E 86 &......&........
0E43:1D20 01 53 8D 77 0C 56 E8 D9 F3 80 0E 85 01 03 83 C6 .S.w.V..........
0E43:1D30 0C 89 36 86 01 88 66 16 C3 8E C7 8B 36 86 01 E8 ..6...f.....6...
0E43:1D40 80 F4 88 66 16 C3 8E C7 8B 36 86 01 E8 B0 F4 89 ...f.....6......
0E43:1D50 46 0E C3 71 1C A9 1C 0F 1D 16 1D E0 1C EE 1C 39 F..q...........9
0E43:1D60 1D 46 1D E1 19 E5 19 E9 19 CA 1A 2A 1B 3C 1B 4E .F.........*.<.N
0E43:1D70 1B 91 1B 96 1B A1 1B FB FC 52 50 53 55 56 57 06 .........RPSUVW.
0E43:1D80 51 1E 8B EC 36 89 2E 8C 01 C5 76 12 AD 89 76 12 Q...6.....v...v.
0E43:1D90 8C D7 8E DF 8A CC 98 93 80 FB DC 72 1D 2E FF 97 ...........r....
0E43:1DA0 77 1D 36 81 3E 86 01 6E 01 77 16 36 8B 26 8C 01 w.6.>..n.w.6.&..
0E43:1DB0 1F 59 07 5F 5E 5D 5B 58 5A CF B5 01 E8 05 00 EB .Y._^][XZ.......
0E43:1DC0 EA CC EB E7 50 51 1E 16 1F A0 82 01 8A 0E 84 01 ....PQ..........
0E43:1DD0 80 E1 3F 80 F1 3F 0A C5 8A E0 22 E1 32 E0 F6 C4 ..?..?....".2...
0E43:1DE0 08 74 02 0C 20 84 C1 74 0F 0C 80 A2 82 01 22 C1 .t.. ..t......".
0E43:1DF0 3C 20 75 0D 1F 59 58 C3 24 7F A2 82 01 1F 59 58 < u..YX.$.....YX
0E43:1E00 C3 B8 02 35 CD 21 36 89 1E 7E 01 36 8C 06 80 01 ...5.!6..~.6....
0E43:1E10 36 8B 26 8C 01 1F 59 07 5F 5E 5D 5B 58 5A 36 FF 6.&...Y._^][XZ6.
0E43:1E20 2E 7E 01 53 51 52 B1 04 B5 0A 26 8B 1C 8A C7 D2 .~.SQR....&.....
0E43:1E30 E8 F6 E5 B2 0F 22 D7 02 C2 F6 E5 BA F0 00 22 D3 ....."........".
0E43:1E40 D3 EA 03 C2 B9 0A 00 F7 E1 83 E3 0F 03 C3 5A 59 ..............ZY
0E43:1E50 5B C3 55 8B EC 56 57 26 8A 44 09 25 80 00 D0 C0 [.U..VW&.D.%....
0E43:1E60 89 45 0A B1 04 26 8A 44 08 D3 E0 D2 E8 D5 0A BF .E...&.D........
0E43:1E70 10 27 F7 E7 93 8D 74 06 E8 A8 FF 03 C3 12 D6 8B .'....t.........
0E43:1E80 DA F7 E7 93 8B CA F7 E7 03 C8 12 D6 83 EE 02 E8 ................
0E43:1E90 91 FF 03 C3 83 D1 00 12 D6 56 8B DA F7 E7 91 8B .........V......
0E43:1EA0 F2 F7 E7 93 87 FA F7 E2 03 DE 13 F8 5E 83 EE 02 ............^...
0E43:1EB0 E8 70 FF 03 C1 13 DA 13 FA BE 10 27 F7 E6 93 8B .p.........'....
0E43:1EC0 CA F7 E6 96 87 FA F7 E2 03 CE 13 F8 83 D2 00 8B ................
0E43:1ED0 76 FE E8 4E FF 03 D8 83 D1 00 83 D7 00 83 D2 00 v..N............
0E43:1EE0 B8 40 00 0B D2 75 0D 2D 10 00 74 2C 87 D7 87 F9 .@...u.-..t,....
0E43:1EF0 87 CB EB EF 78 0B 48 D1 E3 D1 D1 D1 D7 13 D2 79 ....x.H........y
0E43:1F00 F5 8B 76 FC 89 1C 89 4C 02 89 7C 04 89 54 06 89 ..v....L..|..T..
0E43:1F10 44 08 5F 5E 8B E5 5D C3 B8 01 C0 EB E4 50 51 B0 D._^..]......PQ.
0E43:1F20 64 B1 04 92 F6 F2 8A D4 D4 0A D2 E4 0A E0 92 D4 d...............
0E43:1F30 0A D2 E4 0A C4 8A E6 AB 59 58 C3 55 8B EC 56 57 ........YX.U..VW
0E43:1F40 FC 8B 44 08 8B 1C 8B 4C 02 8B 54 06 8B 74 04 3D ..D....L..T..t.=
0E43:1F50 00 00 7C 38 2D 3C 00 7C 1F 7F 33 81 FA 0B DE 72 ..|8-<.|..3....r
0E43:1F60 17 77 2B 81 FE 3A 6B 72 0F 77 23 81 F9 3F 76 72 .w+..:kr.w#..?vr
0E43:1F70 07 77 1B 83 FB F0 77 16 B4 00 2C 04 04 10 7F 10 .w....w...,.....
0E43:1F80 8A E7 8B D9 8B CE 8B F2 2B D2 EB F0 EB 67 EB 6E ........+....g.n
0E43:1F90 2C 10 7D 0E D1 EA D1 DE D1 D9 D1 DB D0 DC FE C0 ,.}.............
0E43:1FA0 7C F2 02 E4 83 D3 00 83 D1 00 83 D6 00 83 D2 00 |...............
0E43:1FB0 96 BE 10 27 F7 F6 91 F7 F6 93 F7 F6 E8 5E FF 2B ...'.........^.+
0E43:1FC0 D2 91 F7 F6 93 F7 F6 91 F7 F6 E8 50 FF 8B D3 91 ...........P....
0E43:1FD0 F7 F6 91 F7 F6 E8 45 FF 8B D1 F7 F6 E8 3E FF D4 ......E......>..
0E43:1FE0 0A B1 04 D2 E4 0A C4 AA 8B 76 FE 8A 44 0A D0 C8 .........v..D...
0E43:1FF0 AA 5F 5E 5D C3 B0 00 B9 09 00 F3 AA EB EA B5 08 ._^]............
0E43:2000 E8 C1 FD B0 99 EB F0 FE 20 08 21 12 21 1C 21 26 ........ .!.!.!&
0E43:2010 21 2D 21 4B 21 34 21 D1 24 46 25 AC 25 AE 25 A1 !-!K!4!.$F%.%.%.
0E43:2020 06 9A 02 A5 07 43 01 DC 21 E3 21 ED 21 EA 21 F4 .....C..!.!.!.!.
0E43:2030 21 F3 21 FC 21 FB 21 A1 06 9A 02 A5 07 43 01 27 !.!.!.!......C.'
0E43:2040 06 E2 02 01 07 78 01 74 22 6E 22 0B 23 98 22 7D .....x.t"n".#."}
0E43:2050 22 A8 22 6E 22 88 22 B8 22 6E 22 D9 22 6F 23 41 "."n"."."n"."o#A
0E43:2060 23 7C 23 46 23 62 23 B5 01 E8 58 FD E9 6D 05 77 #|#F#b#...X..m.w
0E43:2070 24 F6 C4 20 75 F1 42 8A C4 8C DF 24 C0 74 0E 3C $.. u.B....$.t.<
0E43:2080 80 8C D7 72 08 8B 7E 04 77 03 8B 7E 14 26 AC 86 ...r..~.w..~.&..
0E43:2090 E0 24 07 EB 32 3C 09 75 09 26 C7 44 FD 89 E4 E9 .$..2<.u.&.D....
0E43:20A0 3A 05 E9 5C FD 8E 01 FB FC 52 50 53 55 56 57 06 :..\.....RPSUVW.
0E43:20B0 51 1E 8B EC 36 89 2E 8C 01 C4 76 12 4E B2 00 26 Q...6.....v.N..&
0E43:20C0 AD 2C 34 3C 08 73 A8 BB 07 C0 22 DC 22 FC 91 80 .,4<.s...."."...
0E43:20D0 FF C0 73 67 80 FF 40 77 12 74 14 2B C0 80 FB 06 ..sg..@w.t.+....
0E43:20E0 75 10 26 AD 89 76 12 8C DE EB 65 26 AD EB 03 26 u.&..v....e&...&
0E43:20F0 AC 98 89 76 12 B7 00 D1 E3 2E FF A7 07 20 03 46 ...v......... .F
0E43:2100 0C 03 46 08 8C DE EB 48 03 46 0C 03 46 06 8C DE ..F....H.F..F...
0E43:2110 EB 3E 03 46 0A 03 46 08 8C D6 EB 34 03 46 0A 03 .>.F..F....4.F..
0E43:2120 46 06 8C D6 EB 2A 03 46 08 8C DE EB 23 03 46 06 F....*.F....#.F.
0E43:2130 8C DE EB 1C 03 46 0C 8C DE EB 15 89 76 12 8C D0 .....F......v...
0E43:2140 8E D8 8E C0 F6 C1 01 74 33 EB 17 03 46 0A 8C D6 .......t3...F...
0E43:2150 96 80 FA 01 75 01 97 8E C0 8C D0 8E D8 F6 C1 01 ....u...........
0E43:2160 74 1A 80 FD C0 73 03 E9 99 00 F6 C5 20 75 03 E9 t....s...... u..
0E43:2170 37 02 BB 06 00 22 D9 2E FF A7 17 20 B8 38 00 22 7...."..... .8."
0E43:2180 C5 D1 E8 D1 E8 95 80 FD C0 73 2A 8B 3E 86 01 83 .........s*.>...
0E43:2190 EF 0C 89 3E 86 01 BB 06 00 22 D9 2E FF 97 1F 20 ...>....."..... 
0E43:21A0 8C D1 8E C1 BE 0C 00 8B DF 8D 00 8B D0 B9 D7 25 ...............%
0E43:21B0 2E FF A6 27 20 B7 00 2E 8A 9F 02 00 A1 86 01 03 ...' ...........
0E43:21C0 D8 F6 C1 04 8B D0 74 02 8B D3 2B F6 F6 C1 02 74 ......t...+....t
0E43:21D0 03 BE 0C 00 B9 D7 25 2E FF A6 27 20 50 53 52 51 ......%...' PSRQ
0E43:21E0 E9 6A E7 50 53 52 51 E9 2E E9 83 C6 0C 50 53 51 .j.PSRQ......PSQ
0E43:21F0 E9 0F EF 93 50 53 52 51 E9 4E E7 93 50 53 52 51 ....PSRQ.N..PSRQ
0E43:2200 E9 DD EA BD 06 00 23 E9 F6 C5 20 75 42 F6 C5 10 ......#... uB...
0E43:2210 75 1A F6 C5 08 75 54 8B 3E 86 01 B8 F4 FF 03 F8 u....uT.>.......
0E43:2220 A3 88 01 B8 D2 25 50 2E FF A6 37 20 8B 3E 86 01 .....%P...7 .>..
0E43:2230 87 F7 F6 C5 08 75 09 B8 DC 25 50 2E FF A6 3F 20 .....u...%P...? 
0E43:2240 C7 06 88 01 0C 00 B8 D2 25 50 2E FF A6 3F 20 B8 ........%P...? .
0E43:2250 08 00 22 C5 0B E8 B8 DC 25 50 F6 C5 10 75 05 2E ..".....%P...u..
0E43:2260 FF A6 47 20 87 F7 2E FF A6 57 20 E9 6E 03 B5 01 ..G .....W .n...
0E43:2270 E8 51 FB C3 B1 04 26 8B 44 02 A3 82 01 26 8B 04 .Q....&.D....&..
0E43:2280 A3 84 01 B5 00 E9 3C FB 8B 3E 86 01 83 EF 0C E8 ......<..>......
0E43:2290 27 E1 83 2E 86 01 0C C3 8B 3E 86 01 83 EF 0C E8 '........>......
0E43:22A0 B0 FB 83 2E 86 01 0C C3 8B 3E 86 01 83 EF 0C E8 .........>......
0E43:22B0 D4 E5 83 2E 86 01 0C C3 E8 86 00 E8 88 00 B8 6E ...............n
0E43:22C0 01 2B 06 86 01 B2 0C F6 F2 B9 FF FF 91 03 C9 D3 .+..............
0E43:22D0 E8 AB 2B C0 AB AB AB AB C3 E8 DC FF 8B 36 86 01 ..+..........6..
0E43:22E0 26 8B 6D F6 81 CD 55 55 EB 0F E8 72 E5 83 C6 0C &.m...UU...r....
0E43:22F0 83 C7 0A D1 E5 D1 E5 74 11 79 EF EB 0B 2B C0 B9 .......t.y...+..
0E43:2300 05 00 F3 AB D1 E5 D1 E5 75 F3 C3 BF 6E 01 26 8B ........u...n.&.
0E43:2310 6C 04 83 C6 54 81 CD 55 55 D1 ED D1 ED 73 0B 83 l...T..UU....s..
0E43:2320 EE 0A 0B ED 75 F3 EB 0F D1 ED 83 EF 0C E8 56 E5 ....u.........V.
0E43:2330 83 EE 0A D1 ED 72 F1 89 3E 86 01 83 C6 FC E9 33 .....r..>......3
0E43:2340 FF A1 84 01 AB C3 A1 86 01 2D 6E 01 B1 0C F6 F9 .........-n.....
0E43:2350 24 07 B1 03 D2 E0 8B 0E 82 01 80 E5 C7 0A E8 91 $...............
0E43:2360 AB C3 8B 36 86 01 E8 C2 E0 83 06 86 01 0C C3 8B ...6............
0E43:2370 36 86 01 E8 C5 FB 83 06 86 01 0C C3 8B 36 86 01 6............6..
0E43:2380 E8 DC E4 83 06 86 01 0C C3 C8 23 1B 24 DC 23 D6 ..........#.$.#.
0E43:2390 23 22 24 1B 24 22 24 22 24 16 24 1B 24 33 24 3E #"$.$"$"$.$.$3$>
0E43:23A0 24 3E 24 1B 24 3E 24 3E 24 B7 00 2E 8A 9F 02 00 $>$.$>$>$.......
0E43:23B0 8B 36 86 01 03 F3 B3 18 22 DD 80 E1 06 0A D9 FC .6......".......
0E43:23C0 B9 06 00 2E FF A7 89 23 83 2E 86 01 0C 8B 3E 86 .......#......>.
0E43:23D0 01 F3 A5 E9 06 02 BF 0C 00 EB 04 90 BF 00 00 81 ................
0E43:23E0 FE 62 01 74 10 87 FE B8 01 40 B1 00 E8 AA DC 01 .b.t.....@......
0E43:23F0 36 86 01 EB 55 83 C7 0C 8B D7 8B CE 2B 0E 86 01 6...U.......+...
0E43:2400 74 0E 16 07 83 EE 02 BF 6C 01 FD D1 E9 F3 A5 FC t.......l.......
0E43:2410 01 16 86 01 EB 34 F6 C5 07 74 2F B5 01 E8 A4 F9 .....4...t/.....
0E43:2420 EB 28 8B 3E 86 01 8B 05 87 04 AB 83 C6 02 E2 F6 .(.>............
0E43:2430 E9 A9 01 8B FE 8B 36 86 01 F3 A5 E9 9E 01 8B FE ......6.........
0E43:2440 8B 36 86 01 F3 A5 89 36 86 01 E9 8F 01 04 04 04 .6.....6........
0E43:2450 04 04 04 04 04 00 00 00 00 00 00 00 04 04 08 06 ................
0E43:2460 08 06 04 02 00 0A 08 04 04 04 0A 04 04 AD 24 B2 ..............$.
0E43:2470 24 BF 24 BF 24 C2 11 FF 11 BF 24 BF 24 1E 00 2F $.$.$.....$.$../
0E43:2480 00 40 00 51 00 62 00 73 00 84 00 BF 24 A2 17 9A .@.Q.b.s....$...
0E43:2490 18 24 15 1A 16 B7 24 BF 24 BF 24 BF 24 FA 0F 51 .$....$.$.$.$..Q
0E43:24A0 19 2D 0F BF 24 1D 05 30 02 BF 24 BF 24 80 74 0A .-..$..0..$.$.t.
0E43:24B0 01 C3 C6 44 0A 00 C3 56 57 E8 40 DD 5F 5E C3 B5 ...D...VW.@._^..
0E43:24C0 01 E9 00 F9 C3 E4 24 1B 25 F7 24 06 25 23 25 36 ......$.%.$.%#%6
0E43:24D0 25 BB 1F 00 22 DD 2E 8A 87 4D 24 98 97 D1 E3 2E %..."....M$.....
0E43:24E0 FF A5 C5 24 8B 3E 86 01 83 EF 0C 2E FF 97 6D 24 ...$.>........m$
0E43:24F0 89 3E 86 01 E9 E5 00 8B 36 86 01 8B FE B8 DC 25 .>......6......%
0E43:2500 50 2E FF A7 6D 24 8B 36 86 01 8B FE 83 EF 0C 2E P...m$.6........
0E43:2510 FF 97 6D 24 89 3E 86 01 E9 C1 00 83 06 86 01 0C ..m$.>..........
0E43:2520 E9 B9 00 8B 3E 86 01 8D 75 0C 2E FF 97 6D 24 89 ....>...u....m$.
0E43:2530 36 86 01 E9 A6 00 8B 3E 86 01 8D 75 0C B8 DC 25 6......>...u...%
0E43:2540 50 2E FF A7 6D 24 80 E5 1F 80 FD 03 75 4A BF 6E P...m$......uJ.n
0E43:2550 01 89 3E 86 01 B8 01 40 B1 00 E8 3C DB 8D 75 0A ..>....@...<..u.
0E43:2560 83 EF 02 FD 83 EC 60 B9 30 00 F3 A5 C7 06 82 01 ......`.0.......
0E43:2570 00 41 C7 06 84 01 3F 03 C7 06 88 01 00 00 C7 06 .A....?.........
0E43:2580 86 01 6E 01 C7 06 8E 01 65 6D C7 06 90 01 75 87 ..n.....em....u.
0E43:2590 C7 06 92 01 01 00 EB 11 80 FD 02 75 07 C6 06 82 ...........u....
0E43:25A0 01 00 EB 05 B5 01 E8 1B F8 EB 31 90 EB F6 F6 C5 ..........1.....
0E43:25B0 1F 75 F1 A1 86 01 2D 6E 01 B1 0C F6 F9 24 07 B1 .u....-n.....$..
0E43:25C0 03 D2 E0 8B 0E 82 01 80 E5 C7 0A E8 89 4E 0E EB .............N..
0E43:25D0 0B 90 36 8B 36 88 01 36 01 36 86 01 36 81 3E 86 ..6.6..6.6..6.>.
0E43:25E0 01 6E 01 77 0F 36 8B 26 8C 01 1F 59 07 5F 5E 5D .n.w.6.&...Y._^]
0E43:25F0 5B 58 5A CF CC EB EE 00 00 00 00 00 00 00 00 00 [XZ.............
;;; Segment 10A3 (10A3:0000)
10A3:0000 35 C2 68 21 A2 DA 0F C9 FE 3F 35 C2 68 21 A2 DA 5.h!.....?5.h!..
10A3:0010 0F C9 FF 3F 00 42 C0 FF 00 48 C0 FF 00 4A C0 FF ...?.B...H...J..
10A3:0020 00 00 00 3F 85 64 DE F9 33 F3 04 B5 FF 3F 00 00 ...?.d..3....?..
10A3:0030 80 7F B1 00 EB 06 B1 02 EB 02 B1 04 9B D9 E5 55 ...............U
10A3:0040 8B EC 8D 66 FE 9B DD 7E FE 9B 8A 66 FF 9E 72 0F ...f...~...f..r.
10A3:0050 75 2E 80 F9 02 75 06 9B DD D8 9B D9 E8 EB 1E 74 u....u.........t
10A3:0060 0E 7B 0C 9B DD D8 9B 2E D9 06 14 00 9B D9 E4 EB .{..............
10A3:0070 0C 9B DE D9 9B 2E D9 06 14 00 9B D9 E4 E9 A7 00 ................
10A3:0080 9B D9 E1 9B 2E DB 2E 00 00 9B D9 C9 9B D9 F8 B5 ................
10A3:0090 02 22 EC D0 ED 9B DD 7E FE 9B 8A 66 FF 9E 7A D1 .".....~...f..z.
10A3:00A0 B0 03 22 C4 D0 E4 D0 E4 D0 D0 04 FC D0 D0 80 F9 ..".............
10A3:00B0 02 75 04 02 C1 B5 00 24 07 A8 01 74 05 9B DE E9 .u.....$...t....
10A3:00C0 EB 03 9B DD D9 9B D9 F2 80 F9 04 74 29 A8 03 7A ...........t)..z
10A3:00D0 03 9B D9 C9 9B D9 C1 9B D8 C8 9B D9 C9 9B D8 C8 ................
10A3:00E0 9B DE C1 9B D9 FA D0 E8 D0 E8 32 C5 74 03 9B D9 ..........2.t...
10A3:00F0 E0 9B DE F9 EB 31 8A E0 D0 EC 80 E4 01 32 E5 74 .....1.......2.t
10A3:0100 03 9B D9 E0 A8 03 7A 1C 9B D9 C9 9B D9 E4 9B DD ......z.........
10A3:0110 7E FE 9B F6 46 FF 40 74 0B 9B DE D9 9B 2E D9 06 ~...F.@t........
10A3:0120 2E 00 EB 03 9B DE F9 8B E5 5D C3 9B D9 E5 55 8B .........]....U.
10A3:0130 EC 8D 66 FE 9B DD 7E FE 9B 8A 66 FF 9E 91 72 04 ..f...~...f...r.
10A3:0140 75 1C EB 4C 74 4A 7B 48 9B DD D8 9B 2E DB 2E 0A u..LtJ{H........
10A3:0150 00 EB 35 9B DE D9 9B 2E DB 2E 00 00 EB 2A 9B D9 ..5..........*..
10A3:0160 E1 9B D9 E8 9B D8 D1 9B DD 7E FE 9B 8A 66 FF 9E .........~...f..
10A3:0170 74 E1 73 03 9B D9 C9 9B D9 F3 73 0C 9B 2E DB 2E t.s.......s.....
10A3:0180 0A 00 9B DE E9 80 F5 02 F6 C5 02 74 03 9B D9 E0 ...........t....
10A3:0190 8B E5 5D C3 9B D9 E8 EB 08 9B D9 EC EB 03 9B D9 ..].............
10A3:01A0 ED 9B D9 C9 55 8B EC 9B D9 E5 8D 66 F6 9B DD 7E ....U......f...~
10A3:01B0 F6 9B 8A 66 F7 9E 72 0C 74 05 F6 C4 02 74 17 9B ...f..r.t....t..
10A3:01C0 DD D8 EB 04 74 0B 7B 09 9B DD D8 9B 2E D9 06 18 ....t.{.........
10A3:01D0 00 9B D9 E4 EB 24 9B D9 C0 9B DB 7E F6 9B 81 7E .....$.....~...~
10A3:01E0 FE FF 3F 75 12 81 7E FC 00 80 75 0B 9B D9 E8 9B ..?u..~...u.....
10A3:01F0 DE E9 9B D9 F9 EB 03 9B D9 F1 8B E5 5D C3 9B D9 ............]...
10A3:0200 EA B1 01 EB 0B 2B C9 EB 07 9B D9 E9 B1 01 EB 00 .....+..........
10A3:0210 E3 03 9B D9 C9 9B D9 E5 55 8B EC 8D 66 FC 9B DD ........U...f...
10A3:0220 7E FC E3 03 9B D9 C9 9B 8A 66 FD 9E 93 72 10 75 ~........f...r.u
10A3:0230 26 9B DD D8 E3 03 9B DD D8 9B D9 E8 E9 A8 00 E3 &...............
10A3:0240 03 9B DD D8 74 0B 7B 09 9B DD D8 9B 2E D9 06 1C ....t.{.........
10A3:0250 00 9B D9 E4 E9 90 00 E3 03 9B DE C9 9B D9 E1 9B ................
10A3:0260 2E D8 16 20 00 9B DD 7E FC 9B F6 46 FD 41 74 0B ... ...~...F.At.
10A3:0270 9B D9 F0 9B D9 E8 9B DE C1 EB 61 9B D9 E8 9B D9 ..........a.....
10A3:0280 C1 9B D9 7E FC 9B D9 FD 80 4E FD 0F 9B D9 6E FC ...~.....N....n.
10A3:0290 9B D9 FC 80 66 FD F3 9B D9 6E FC 9B DF 56 FE 9B ....f....n...V..
10A3:02A0 D9 C9 9B D9 E0 9B D9 C9 9B D9 FD 9B DD D9 9B DE ................
10A3:02B0 E9 81 7E FE FF 0F 7F 90 9B D9 F0 9B D9 E8 9B DE ..~.............
10A3:02C0 C1 D1 6E FE 73 09 9B 2E DB 2E 24 00 9B DE C9 9B ..n.s.....$.....
10A3:02D0 DF 46 FE 9B D9 C9 9B D9 FD 9B DD D9 F6 C7 02 74 .F.............t
10A3:02E0 06 9B D9 E8 9B DE F1 8B E5 5D C3 55 8B EC 50 56 .........].U..PV
10A3:02F0 1E F6 46 07 02 74 01 FB C5 76 02 8B 44 FF 2C 34 ..F..t...v..D.,4
10A3:0300 3C 08 73 0C 83 EE 02 81 04 CE A3 89 76 02 EB 23 <.s.........v..#
10A3:0310 77 26 F6 C4 20 75 2E 83 EE 02 89 76 02 C6 04 9B w&.. u.....v....
10A3:0320 46 8A C4 25 C0 07 D0 E8 D0 E8 D0 E8 34 18 05 26 F..%........4..&
10A3:0330 D8 89 04 1F 5E 58 5D CF 3C 09 77 09 83 EE 02 C7 ....^X].<.w.....
10A3:0340 04 90 9B EB C6 EB EC 8C 03 A0 03 B1 03 B6 03 ED ................
10A3:0350 03 FF 03 09 04 0E 04 32 00 36 00 3A 00 2B 01 9E .......2.6.:.+..
10A3:0360 01 94 01 99 01 FE 01 05 02 09 02 FB 50 56 06 55 ............PV.U
10A3:0370 8B EC C4 76 08 26 AD 89 76 08 3C DC 72 09 8B F0 ...v.&..v.<.r...
10A3:0380 98 96 2E FF 94 6B 03 5D 07 5E 58 CF FE CC 7C 0E .....k.].^X...|.
10A3:0390 B0 0A F6 E4 96 9B DB 7A 0E 83 EE 0A 7D F7 9B C3 .......z....}...
10A3:03A0 2B F6 FE CC 7C 09 9B DB 6A 0E 83 C6 0A EB F3 9B +...|...j.......
10A3:03B0 C3 B0 00 EB 03 90 B0 01 55 50 8B EC 9B D9 7E 00 ........UP....~.
10A3:03C0 9B 8B 76 00 80 66 01 FC 08 46 01 9B D9 6E 00 9B ..v..f...F...n..
10A3:03D0 D9 EE 9B DC EA 9B DE C1 89 76 00 9B D9 6E 00 9B .........v...n..
10A3:03E0 DE D9 9B DD 7E 00 9B 58 5D 88 66 0C C3 9B DE D9 ....~..X].f.....
10A3:03F0 8A 66 0D 9B DD 7E 0C 9B 8A 46 0D 89 46 0C C3 9B .f...~...F..F...
10A3:0400 D8 D9 EB EC 9B D8 D1 EB E7 9B D9 E4 EB E2 9B D9 ................
;;; Segment 10E4 (10E4:0000)
10E4:0000 E5 9B DD 7E 06 9B C3 55 8B EC CD 39 46 06 B8 F0 ...~...U...9F...
10E4:0010 7F 23 46 0C 3D 40 43 73 11 83 3E 96 00 03 7C 04 .#F.=@Cs..>...|.
10E4:0020 D9 FF EB 2F CD 3E EE 90 EB 29 CD 39 D8 FF 36 EC .../.>...).9..6.
10E4:0030 07 FF 36 EA 07 FF 36 E8 07 FF 36 E6 07 33 C0 50 ..6...6...6..3.P
10E4:0040 8D 46 06 50 B8 EE 07 50 B8 05 00 50 9A 0A 00 7E .F.P...P...P...~
;;; Segment 10E9 (10E9:0000)
10E9:0000 11 8B E5 5D CB 55 8B EC 83 EC 04 A1 02 7A 0B 06 ...].U.......z..
10E9:0010 04 7A 74 5E 33 C0 50 50 B8 08 00 50 FF 1E 02 7A .zt^3.PP...P...z
10E9:0020 83 C4 06 89 56 FE 89 46 FC 52 50 B8 08 00 50 FF ....V..F.RP...P.
10E9:0030 1E 02 7A 83 C4 06 83 7E FE 00 75 06 83 7E FC 01 ..z....~..u..~..
10E9:0040 74 5D 8B 46 FC 0B 46 FE 74 28 33 C0 50 50 B8 08 t].F..F.t(3.PP..
10E9:0050 00 50 FF 1E 02 7A 83 C4 06 8B 5E 06 8B 1F 4B D1 .P...z....^...K.
10E9:0060 E3 D1 E3 FF B7 74 08 B8 08 00 50 FF 5E FC 59 59 .....t....P.^.YY
10E9:0070 EB 2D 8B 5E 06 8B 1F 4B D1 E3 D1 E3 FF B7 76 08 .-.^...K......v.
10E9:0080 B8 D5 08 50 B8 08 12 50 9A 0C 00 EF 12 83 C4 06 ...P...P........
10E9:0090 9A 03 00 F3 10 B8 01 00 50 9A 2A 01 00 08 59 8B ........P.*...Y.
;;; Segment 10F3 (10F3:0000)
10F3:0000 E5 5D CB 9A FB 02 00 08 CB 55 8B EC 83 EC 04 33 .].......U.....3
10F3:0010 C9 B8 FE 43 BB 6A 3F 83 7E 18 00 75 06 B8 7E 40 ...C.j?.~..u..~@
10F3:0020 BB 6A 3F 8B 56 16 D1 E2 D1 D1 D1 EA 81 FA FF 7F .j?.V...........
10F3:0030 74 68 3B D0 74 09 7E 3C CD 39 46 06 EB 4D 90 CD th;.t.~<.9F..M..
10F3:0040 35 7E FC B8 00 0C CD 3D 0B 46 FC 89 46 FE CD 35 5~.....=.F..F..5
10F3:0050 6E FE CD 37 6E 0E 83 7E 18 00 75 0A CD 35 5E 06 n..7n..~..u..5^.
10F3:0060 CD 35 46 06 EB 08 CD 39 5E 06 CD 39 46 06 CD 35 .5F....9^..9F..5
10F3:0070 6E FC EB 2A 8B C2 0B 46 14 0B 46 12 0B 46 10 0B n..*...F..F..F..
10F3:0080 46 0E 74 16 3B D3 7D 12 CD 35 EE 0B C9 74 03 CD F.t.;.}..5...t..
10F3:0090 35 E0 C7 06 94 00 22 00 EB 04 CD 37 6E 0E 8B E5 5....."....7n...
;;; Segment 10FD (10FD:0000)
10FD:0000 5D CA 14 00 55 8B EC 56 8B 76 06 83 3C 04 75 0D ]...U..V.v..<.u.
10FD:0010 CD 39 06 14 09 CD 39 5C 14 CD 3D EB 05 83 3C 05 .9....9\..=...<.
;;; Segment 10FF (10FF:0000)
10FF:0000 75 05 B8 01 00 EB 02 33 C0 5E 5D CB 55 8B EC 56 u......3.^].U..V
10FF:0010 8B 46 06 3D BC EC 7D 06 CD 35 EE E9 B3 00 3D 44 .F.=..}..5....=D
10FF:0020 13 7E 08 CD 35 06 98 09 E9 A6 00 0B C0 75 06 CD .~..5........u..
10FF:0030 35 E8 E9 9C 00 0B C0 7D 02 F7 D8 BE 07 00 23 F0 5......}......#.
10FF:0040 D1 E6 D1 E6 CD 35 84 1C 09 D1 E8 D1 E8 D1 E8 D1 .....5..........
10FF:0050 E8 73 05 CD 34 0E 3C 09 75 03 EB 6A 90 D1 E8 73 .s..4.<.u..j...s
10FF:0060 05 CD 38 0E 40 09 D1 E8 73 08 CD 37 2E 48 09 CD ..8.@...s..7.H..
10FF:0070 3A C9 D1 E8 73 08 CD 37 2E 52 09 CD 3A C9 D1 E8 :...s..7.R..:...
10FF:0080 73 08 CD 37 2E 5C 09 CD 3A C9 D1 E8 73 08 CD 37 s..7.\..:...s..7
10FF:0090 2E 66 09 CD 3A C9 D1 E8 73 08 CD 37 2E 70 09 CD .f..:...s..7.p..
10FF:00A0 3A C9 D1 E8 73 08 CD 37 2E 7A 09 CD 3A C9 D1 E8 :...s..7.z..:...
10FF:00B0 73 08 CD 37 2E 84 09 CD 3A C9 D1 E8 73 08 CD 37 s..7....:...s..7
10FF:00C0 2E 8E 09 CD 3A C9 F6 46 07 80 74 05 CD 34 3E 1C ....:..F..t..4>.
;;; Segment 110C (110C:0000)
110C:0000 09 5E 5D CB B0 5F 22 C2 3C 47 75 0D 80 7F FF 30 .^].._".<Gu....0
110C:0010 75 07 4B 3B D9 77 F5 EB 07 80 7F FF 2E 75 01 4B u.K;.w.......u.K
110C:0020 C3 55 8B EC 83 EC 30 56 57 06 1E 07 8B 46 0E 3D .U....0VW....F.=
110C:0030 28 00 76 06 B8 28 00 89 46 0E 89 46 FE 8A 56 0A (.v..(..F..F..V.
110C:0040 80 E2 DF 80 FA 46 75 0B F7 D8 7E 10 2B C0 89 46 .....Fu...~.+..F
110C:0050 0E EB 09 0B C0 7F 05 B8 01 00 EB 09 80 FA 46 74 ..............Ft
110C:0060 04 40 FF 46 0E FF 76 10 3D 00 00 7E 03 8B 46 FE .@.F..v.=..~..F.
110C:0070 50 8D 5E FC 53 8D 76 D0 56 8B 46 06 50 9A 01 00 P.^.S.v.V.F.P...
110C:0080 62 11 93 8B 7E 0C FC 81 FB FF 7F 74 08 81 FB FE b...~......t....
110C:0090 7F 74 15 EB 25 B8 2B 49 83 7E FC 00 74 02 40 40 .t..%.+I.~..t.@@
110C:00A0 AB B8 4E 46 AB E9 F7 00 B8 2B 4E 83 7E FC 00 74 ..NF.....+N.~..t
110C:00B0 02 40 40 AB B0 41 AB E9 E5 00 80 7E FC 00 74 03 .@@..A.....~..t.
110C:00C0 B0 2D AA 8A 56 0A 80 E2 5F 80 FA 46 74 0F 80 FA .-..V..._..Ft...
110C:00D0 45 74 6C 83 FB FD 7C 67 3B 5E 0E 7F 62 83 FB 28 Etl...|g;^..b..(
110C:00E0 7F 5D 0B DB 7F 0F B8 30 2E AB B9 01 00 74 09 B0 .].....0.....t..
110C:00F0 30 AA 43 75 FC B9 00 00 AC 0A C0 74 0A AA 4B 75 0.Cu.......t..Ku
110C:0100 F7 B0 2E AA 41 EB F1 8B 46 0E 03 4E FE 3B C1 76 ....A...F..N.;.v
110C:0110 0D 2B C1 8B C8 03 D8 B0 30 F3 AA 4B 74 16 4B 74 .+......0..Kt.Kt
110C:0120 13 80 7E 08 00 75 0D 8A 56 0A 8B 4E 0C 87 DF E8 ..~..u..V..N....
110C:0130 D2 FE 87 FB 3B 7E 0C 75 03 B0 30 AA EB 61 90 AD ....;~.u..0..a..
110C:0140 AA B0 2E 0A E4 74 1C AA 8A C4 AA AC 0A C0 75 FA .....t........u.
110C:0150 80 7E 08 00 75 0D 8A 56 0A 8B 4E 0C 87 DF E8 A3 .~..u..V..N.....
110C:0160 FE 87 FB B0 20 22 46 0A 0C 45 AA B8 2B 2D 4B 7D .... "F..E..+-K}
110C:0170 04 86 C4 F7 DB AA 93 B9 30 30 3D 63 00 76 19 3D ........00=c.v.=
110C:0180 E7 03 76 0A 99 BB E8 03 F7 F3 02 C1 AA 92 B3 64 ..v............d
110C:0190 F6 F3 02 C1 AA 86 C4 98 B3 0A F6 F3 03 C1 AB 32 ...............2
;;; Segment 1126 (1126:0000)
1126:0000 C0 AA 07 5F 5E 8B E5 5D CA 0C 00 CB 55 8B EC 83 ..._^..]....U...
1126:0010 EC 18 56 57 C6 46 ED 00 C6 46 EE 01 C6 46 EF 00 ..VW.F...F...F..
1126:0020 C6 46 F0 00 C6 46 F1 00 C7 46 F2 00 00 C7 46 F4 .F...F...F....F.
1126:0030 01 00 CD 37 2E AC 09 CD 37 7E F6 CD 3D 06 BE 00 ...7....7~..=...
1126:0040 80 BF FE FF FF 46 F2 FF 76 0E FF 5E 06 59 0B C0 .....F..v..^.Y..
1126:0050 7D 03 EB 7E 90 98 93 F6 C3 80 75 07 F6 87 E7 10 }..~......u.....
1126:0060 01 75 E1 93 FF 4E 10 7C 64 3C 2B 74 07 3C 2D 75 .u...N.|d<+t.<-u
1126:0070 31 FE 46 ED FE 46 EF FF 4E 10 7C 51 FF 46 F2 FF 1.F..F..N.|Q.F..
1126:0080 76 0E FF 5E 06 59 80 7E EE 01 75 16 80 7E EF 00 v..^.Y.~..u..~..
1126:0090 74 10 3C 49 74 06 3C 4E 74 05 EB 06 E9 D0 01 E9 t.<It.<Nt.......
1126:00A0 07 02 C6 46 EE 00 3C 2E 74 32 3C 39 77 2B 3C 30 ...F..<.t2<9w+<0
1126:00B0 72 27 2C 30 98 47 7F 34 88 46 F6 BF 01 00 0A C0 r',0.G.4.F......
1126:00C0 75 B5 F7 DF 81 FE 00 80 74 AD 4E EB AA B0 65 E9 u.......t.N...e.
1126:00D0 8C 00 C7 46 F4 FF FF EB 6D E9 82 00 81 FE 00 80 ...F....m.......
1126:00E0 75 ED 2B F6 0B FF 7E 8F 8B F7 EB 8B 83 FF 05 77 u.+...~........w
1126:00F0 14 93 B8 0A 00 F7 66 F6 03 C3 12 D6 89 46 F6 89 ......f......F..
1126:0100 56 F8 E9 72 FF 83 FF 12 77 34 93 B8 0A 00 F7 66 V..r....w4.....f
1126:0110 FC 89 46 FC B8 0A 00 F7 66 FA 89 46 FA 52 B8 0A ..F.....f..F.R..
1126:0120 00 F7 66 F8 89 46 F8 52 B8 0A 00 F7 66 F6 03 C3 ..f..F.R....f...
1126:0130 89 46 F6 11 56 F8 5A 11 56 FA 5A 11 56 FC E9 36 .F..V.Z.V.Z.V..6
1126:0140 FF C7 46 F4 00 00 83 7E 10 00 7C 0C FF 76 0E 50 ..F....~..|..v.P
1126:0150 FF 5E 0A 59 59 FF 4E F2 CD 35 EE E9 F4 00 83 FF .^.YY.N..5......
1126:0160 FE 74 DE 81 FE 00 80 75 02 8B F7 89 7E EA 89 76 .t.....u....~..v
1126:0170 E8 2B FF 3C 45 74 04 3C 65 75 4A FF 4E 10 7C 51 .+.<Et.<euJ.N.|Q
1126:0180 FF 46 F2 FF 76 0E FF 5E 06 59 3C 2B 74 07 3C 2D .F..v..^.Y<+t.<-
1126:0190 75 12 FE 46 F0 FF 4E 10 7C 37 FF 46 F2 FF 76 0E u..F..N.|7.F..v.
1126:01A0 FF 5E 06 59 3C 39 77 1D 2C 30 72 17 98 97 BA 0A .^.Y<9w.,0r.....
1126:01B0 00 F7 E2 03 F8 81 FF 44 13 7E DA 33 FF C6 46 F1 .......D.~.3..F.
1126:01C0 01 EB D2 04 30 FF 76 0E 50 FF 5E 0A 59 59 FF 4E ....0.v.P.^.YY.N
1126:01D0 F2 F6 46 F0 FF 74 05 F7 DF F6 5E F1 8B 5E EA 0B ..F..t....^..^..
1126:01E0 DB 7D 06 CD 35 EE EB 6A 90 8B 4E E8 8B C1 03 C7 .}..5..j..N.....
1126:01F0 80 7E F1 01 74 0B 80 7E F1 FF 75 25 CD 35 EE EB .~..t..~..u%.5..
1126:0200 18 B8 FF FF 89 46 F6 89 46 F8 89 46 FA 89 46 FC .....F..F..F..F.
1126:0210 C7 46 FE FE 7F CD 37 6E F6 C7 46 F4 02 00 EB 32 .F....7n..F....2
1126:0220 90 8B C3 83 FB 12 76 03 BB 12 00 03 C1 2B CB 03 ......v......+..
1126:0230 F9 CD 3B 6E F6 8B C7 0B C0 74 17 7D 02 F7 D8 50 ..;n.....t.}...P
1126:0240 9A 0C 00 FF 10 58 0B FF 7D 05 CD 3A F9 EB 03 CD .....X..}..:....
1126:0250 3A C9 80 7E ED 00 74 03 CD 35 E0 8B 7E 12 8B 5E :..~..t..5..~..^
1126:0260 F2 01 1D 8B 7E 14 8B 5E F4 89 1D 07 EB 7E 90 FF ....~..^.....~..
1126:0270 46 F2 FF 76 0E FF 5E 06 59 FF 4E 10 7C 66 3C 4E F..v..^.Y.N.|f<N
1126:0280 75 62 FF 46 F2 FF 76 0E FF 5E 06 59 FF 4E 10 7C ub.F..v..^.Y.N.|
1126:0290 53 3C 46 75 4F 80 7E ED 00 74 07 CD 35 06 A0 09 S<FuO.~..t..5...
1126:02A0 EB 05 CD 35 06 9C 09 EB B2 FF 46 F2 FF 76 0E FF ...5......F..v..
1126:02B0 5E 06 59 FF 4E 10 7C 2C 3C 41 75 28 FF 46 F2 FF ^.Y.N.|,<Au(.F..
1126:02C0 76 0E FF 5E 06 59 FF 4E 10 7C 19 3C 4E 75 15 80 v..^.Y.N.|.<Nu..
1126:02D0 7E ED 00 74 07 CD 35 06 A8 09 EB 05 CD 35 06 A4 ~..t..5......5..
1126:02E0 09 E9 77 FF C7 46 F4 00 00 E9 55 FE 5F 5E 8B E5 ..w..F....U._^..
1126:02F0 5D CB CD 39 D8 CB 55 8B EC 83 EC 0A 56 8B 76 06 ]..9..U.....V.v.
1126:0300 CD 37 7E F6 F7 46 08 04 00 74 2D B8 01 00 50 CD .7~..F...t-...P.
1126:0310 37 6E F6 83 EC 0A CD 37 7E E8 CD 3D FF 36 FA 08 7n.....7~..=.6..
1126:0320 FF 36 F8 08 FF 36 F6 08 FF 36 F4 08 9A 09 00 F3 .6...6...6......
1126:0330 10 CD 39 1C CD 3D EB 35 F7 46 08 08 00 74 0B CD ..9..=.5.F...t..
1126:0340 37 6E F6 CD 37 3C CD 3D EB 23 33 C0 50 CD 37 6E 7n..7<.=.#3.P.7n
1126:0350 F6 83 EC 0A CD 37 7E E8 CD 3D B8 F0 7F 50 33 C0 .....7~..=...P3.
1126:0360 50 50 50 9A 09 00 F3 10 CD 35 1C CD 3D 5E 8B E5 PPP......5..=^..
;;; Segment 115D (115D:0000)
115D:0000 5D CB CB 55 8B EC CD 39 46 06 B8 F0 7F 23 46 0C ]..U...9F....#F.
115D:0010 3D 40 43 73 11 83 3E 96 00 03 7C 04 D9 FE EB 2F =@Cs..>...|..../
115D:0020 CD 3E EC 90 EB 29 CD 39 D8 FF 36 BC 09 FF 36 BA .>...).9..6...6.
115D:0030 09 FF 36 B8 09 FF 36 B6 09 33 C0 50 8D 46 06 50 ..6...6..3.P.F.P
115D:0040 B8 BE 09 50 B8 05 00 50 9A 0A 00 7E 11 8B E5 5D ...P...P...~...]
;;; Segment 1162 (1162:0000)
1162:0000 CB 55 8B EC 83 EC 0E 56 57 C7 46 F2 0A 00 06 8C .U.....VW.F.....
1162:0010 D8 8E C0 8B 7E 0E B8 FF 7F 8B 5E 06 26 8B 09 26 ....~.....^.&..&
1162:0020 21 01 D1 EB D1 EB D1 E3 2E FF A7 2D 00 33 00 39 !..........-.3.9
1162:0030 00 3F 00 CD 3C D9 05 EB 0E CD 3C DD 05 EB 08 26 .?..<.....<....&
1162:0040 80 25 F0 CD 3C DB 2D 33 DB D1 E1 D1 D3 8B 7E 0A .%..<.-3......~.
1162:0050 89 1D CD 35 E5 CD 39 7E F4 CD 3D 8B 46 F4 80 E4 ...5..9~..=.F...
1162:0060 47 80 FC 40 74 16 80 FC 05 74 0C 80 FC 01 74 02 G..@t....t....t.
1162:0070 EB 30 BA FE 7F EB 25 BA FF 7F EB 20 BA 01 00 B0 .0....%.... ....
1162:0080 30 8B 4E 0C 0B C9 7F 03 F7 D9 41 83 F9 28 76 03 0.N.......A..(v.
1162:0090 B9 28 00 FC 8B 7E 08 F3 AA 32 C0 AA CD 39 D8 E9 .(...~...2...9..
1162:00A0 1C 01 CD 35 C0 CD 37 7E F6 CD 3D 8B 46 FE 2D FF ...5..7~..=.F.-.
1162:00B0 3F BA 10 4D F7 EA 93 B4 4D 8A 46 FD D0 E0 F6 E4 ?..M....M.F.....
1162:00C0 03 C3 83 D2 00 F7 D8 83 D2 00 8B 46 0C 0B C0 7F ...........F....
1162:00D0 06 F7 D8 03 C2 7C A5 3D 12 00 7E 03 B8 12 00 8B .....|.=..~.....
1162:00E0 D8 2B C2 8B F0 74 17 7D 02 F7 D8 50 9A 0C 00 FF .+...t.}...P....
1162:00F0 10 58 0B F6 7F 05 CD 3A F9 EB 03 CD 3A C9 53 9A .X.....:....:.S.
1162:0100 0C 00 FF 10 58 CD 34 D9 CD 39 7E F4 CD 3D F6 46 ....X.4..9~..=.F
1162:0110 F5 45 74 14 42 43 83 FB 12 77 06 83 7E 0C 00 7E .Et.BC...w..~..~
1162:0120 2D CD 3A 76 F2 4B EB 26 8B C3 48 50 9A 0C 00 FF -.:v.K.&..HP....
1162:0130 10 58 CD 34 D9 CD 39 7E F4 CD 3D F6 46 F5 41 75 .X.4..9~..=.F.Au
1162:0140 0D 4A 4B 83 7E 0C 00 7E 05 CD 3A 4E F2 43 CD 35 .JK.~..~..:N.C.5
1162:0150 FC CD 3B 76 F6 8B 7E 08 03 FB 57 32 C0 FD AA 8D ..;v..~...W2....
1162:0160 76 F6 B9 04 00 CD 3D 0B DB 75 07 8A 2C 80 F5 01 v.....=..u..,...
1162:0170 EB 1A 8A 04 46 8A E0 D2 EC 24 0F 05 30 30 AA 0A ....F....$..00..
1162:0180 E8 4B 74 08 8A C4 AA 0A E8 4B 75 E6 5B 80 E5 0F .Kt......Ku.[...
1162:0190 75 06 42 43 C6 45 01 31 8B 4E 0C 0B C9 7F 04 F7 u.BC.E.1.N......
1162:01A0 D9 03 CA 83 F9 28 76 03 B9 28 00 C6 07 00 8B C3 .....(v..(......
1162:01B0 2B 46 08 2B C8 76 07 C7 07 30 00 43 E2 F9 FC 07 +F.+.v...0.C....
;;; Segment 117E (117E:0000)
117E:0000 8B C2 5F 5E 8B E5 5D CA 0A 00 55 8B EC 83 EC 1C .._^..]...U.....
117E:0010 56 8B 76 0A 8B 46 06 89 46 E4 8B 46 08 89 46 E6 V.v..F..F..F..F.
117E:0020 0B F6 75 07 CD 39 06 07 0A EB 03 CD 39 04 CD 39 ..u..9......9..9
117E:0030 5E E8 CD 3D 0B F6 75 07 CD 39 06 06 0A EB 06 8B ^..=..u..9......
117E:0040 5E 0C CD 39 07 CD 39 5E F0 CD 3D 8B 46 14 89 46 ^..9..9^..=.F..F
117E:0050 FE 8B 46 12 89 46 FC 8B 46 10 89 46 FA 8B 46 0E ..F..F..F..F..F.
117E:0060 89 46 F8 8D 46 E4 50 9A 04 00 FD 10 59 0B C0 75 .F..F.P.....Y..u
117E:0070 34 8B 5E 06 4B D1 E3 FF B7 C2 09 FF 76 08 B8 F9 4.^.K.......v...
117E:0080 09 50 B8 08 12 50 9A 0C 00 EF 12 83 C4 08 83 7E .P...P.........~
117E:0090 06 03 74 06 83 7E 06 04 75 05 B8 22 00 EB 03 B8 ..t..~..u.."....
;;; Segment 1188 (1188:0000)
1188:0000 21 00 A3 94 00 CD 39 46 F8 5E 8B E5 5D CB       !.....9F.^..]. 

fn1188_000E()
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+06]
	or	si,si
	jl	002D

l1188_0019:
	cmp	si,58
	jbe	0021

l1188_001E:
	mov	si,0057

l1188_0021:
	mov	[1078],si
	mov	al,[si+107A]
	cbw	
	xchg	ax,si
	jmp	003A

l1188_002D:
	neg	si
	cmp	si,23
	ja	001E

l1188_0034:
	mov	word ptr [1078],FFFF

l1188_003A:
	mov	ax,si
	mov	[0094],ax
	mov	ax,FFFF
;;; Segment 118C (118C:0000)
118C:0000 FF FF EB 00                                     ....           

l1188_0044:
	pop	si
	pop	bp
	retf	0002
1188:0049                            CB                            .     

fn118C_000A()
	push	bp
	mov	bp,sp
	jmp	001B

l118C_000F:
	mov	bx,[10E4]
	shl	bx,01
	shl	bx,01
	call	dword ptr [bx+797A]

l118C_001B:
	mov	ax,[10E4]
	dec	word ptr [10E4]
	or	ax,ax
	jnz	000F

l118C_0026:
	call	dword ptr [10D4]
	call	dword ptr [10D8]
	call	dword ptr [10DC]
	push	word ptr [bp+06]
	call	far 0800:012A
	pop	cx
	pop	bp
	retf	
118C:003D                                        55 8B EC              U..
118C:0040 83 3E E4 10 20 75 05 B8 01 00 EB 1E 8B 56 08 8B .>.. u.......V..
118C:0050 46 06 8B 1E E4 10 D1 E3 D1 E3 89 97 7C 79 89 87 F...........|y..
;;; Segment 1192 (1192:0000)
1192:0000 7A 79 FF 06 E4 10 33 C0 EB 00 5D CB             zy....3...].   

fn1192_000C()
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,[bp+06]
	mov	ax,[di+06]
	mov	[79FC],ax
	cmp	ax,di
	jnz	0026

l1192_001E:
	mov	word ptr [79FC],0000
	jmp	0036

l1192_0026:
	mov	si,[di+04]
	mov	bx,[79FC]
	mov	[bx+04],si
	mov	ax,[79FC]
	mov	[si+06],ax

l1192_0036:
	pop	di
	pop	si
	pop	bp
	retf	

fn1192_003A()
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,[bp+06]
	mov	ax,[bp+08]
	sub	[di],ax
	mov	si,[di]
	add	si,di
	mov	ax,[bp+08]
	inc	ax
	mov	[si],ax
	mov	[si+02],di
	mov	ax,[79FA]
	cmp	ax,di
	jnz	0061

l1192_005B:
	mov	[79FA],si
	jmp	0069

l1192_0061:
	mov	di,si
	add	di,[bp+08]
	mov	[di+02],si

l1192_0069:
	mov	ax,si
	add	ax,0004
	jmp	0070

l1192_0070:
	pop	di
	pop	si
	pop	bp
	retf	

fn1192_0074()
	push	bp
	mov	bp,sp
	push	si
	mov	ax,[bp+06]
	xor	dx,dx
	and	ax,FFFF
	and	dx,0000
	push	dx
	push	ax
	call	far 11A8:0025
	pop	cx
	pop	cx
	mov	si,ax
	cmp	si,FF
	jnz	0098

l1192_0094:
	xor	ax,ax
	jmp	00B0

l1192_0098:
	mov	ax,[79FA]
	mov	[si+02],ax
	mov	ax,[bp+06]
	inc	ax
	mov	[si],ax
	mov	[79FA],si
	mov	ax,[79FA]
	add	ax,0004
	jmp	00B0

l1192_00B0:
	pop	si
	pop	bp
	retf	

fn1192_00B3()
	push	bp
	mov	bp,sp
	push	si
	mov	ax,[bp+06]
	xor	dx,dx
	and	ax,FFFF
	and	dx,0000
	push	dx
	push	ax
	call	far 11A8:0025
	pop	cx
	pop	cx
	mov	si,ax
	cmp	si,FF
	jnz	00D7

l1192_00D3:
	xor	ax,ax
	jmp	00EC

l1192_00D7:
	mov	[79FE],si
	mov	[79FA],si
	mov	ax,[bp+06]
	inc	ax
	mov	[si],ax
	mov	ax,si
	add	ax,0004
	jmp	00EC

l1192_00EC:
	pop	si
	pop	bp
	retf	

fn1192_00EF()
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,[bp+06]
	or	di,di
	jnz	00FF

l1192_00FB:
	xor	ax,ax
	jmp	015D

l1192_00FF:
	mov	ax,di
	add	ax,000B
	and	ax,FFF8
	mov	di,ax
	cmp	word ptr [79FE],00
	jnz	0118

l1192_0110:
	push	di
	push	cs
	call	00B3
	pop	cx
	jmp	015D

l1192_0118:
	mov	si,[79FC]
	mov	ax,si
	or	ax,ax
	jz	0155

l1192_0122:
	mov	ax,[si]
	mov	dx,di
	add	dx,28
	cmp	ax,dx
	jc	0137

l1192_012D:
	push	di
	push	si
	push	cs
	call	003A
	pop	cx
	pop	cx
	jmp	015D

l1192_0137:
	mov	ax,[si]
	cmp	ax,di
	jc	014C

l1192_013D:
	push	si
	push	cs
	call	000C
	pop	cx
	inc	word ptr [si]
	mov	ax,si
	add	ax,0004
	jmp	015D

l1192_014C:
	mov	si,[si+06]
	cmp	si,[79FC]
	jnz	0122

l1192_0155:
	push	di
	push	cs
	call	0074
	pop	cx
	jmp	015D

l1192_015D:
	pop	di
	pop	si
	pop	bp
;;; Segment 11A8 (11A8:0000)
11A8:0000 CB                                              .              

fn11A8_0001()
	push	bp
	mov	bp,sp
	mov	ax,[bp+06]
	mov	dx,sp
	sub	dx,0100
	cmp	ax,dx
	jnc	0018

l11A8_0011:
	mov	[009E],ax
	xor	ax,ax
	jmp	0023

l11A8_0018:
	mov	word ptr [0094],0008
	mov	ax,FFFF
	jmp	0023

l11A8_0023:
	pop	bp
	retf	

fn11A8_0025()
	push	bp
	mov	bp,sp
	mov	ax,[bp+06]
	mov	dx,[bp+08]
	add	ax,[009E]
	adc	dx,00
	mov	cx,ax
	add	cx,0100
	adc	dx,00
	or	dx,dx
	jnz	004C

l11A8_0042:
	cmp	cx,sp
	jnc	004C

l11A8_0046:
	xchg	[009E],ax
	jmp	0057

l11A8_004C:
	mov	word ptr [0094],0008
	mov	ax,FFFF
	jmp	0057

l11A8_0057:
	pop	bp
	retf	

fn11A8_0059()
	push	bp
	mov	bp,sp
	push	word ptr [bp+06]
	push	cs
	call	0001
	pop	cx
	jmp	0066

l11A8_0066:
	pop	bp
	retf	
11A8:0068                         55 8B EC 8B 46 06 99 52         U...F..R
;;; Segment 11AF (11AF:0000)
11AF:0000 50 0E E8 B0 FF 8B E5 EB 00 5D CB                P........].    

fn11AF_000B()
	push	bp
	mov	bp,sp
	mov	cx,[bp+04]
	mov	ah,3C
	mov	dx,[bp+06]
	int	21
	jc	001C

l11AF_001A:
	jmp	0024

l11AF_001C:
	push	ax
	call	far 1188:000E
	jmp	0024

l11AF_0024:
	pop	bp
	ret	0004

fn11AF_0028()
	push	bp
	mov	bp,sp
	mov	bx,[bp+04]
	sub	cx,cx
	sub	dx,dx
	mov	ah,40
	int	21
	jmp	0038

l11AF_0038:
	pop	bp
	ret	0002

fn11AF_003C()
	push	bp
	mov	bp,sp
	sub	sp,04
	push	si
	push	di
	mov	di,[bp+08]
	test	di,C000
	jnz	0055

l11AF_004D:
	mov	ax,[1350]
	and	ax,C000
	or	di,ax

l11AF_0055:
	test	di,0100
	jnz	005E

l11AF_005B:
	jmp	00F3

l11AF_005E:
	mov	ax,[1352]
	and	[bp+0A],ax
	mov	ax,[bp+0A]
	test	ax,0180
	jnz	0075

l11AF_006C:
	mov	ax,0001
	push	ax
	call	far 1188:000E

l11AF_0075:
	xor	ax,ax
	push	ax
	push	word ptr [bp+06]
	call	far 1252:0004
	pop	cx
	pop	cx
	mov	[bp-04],ax
	cmp	ax,FFFF
	jnz	009D

l11AF_008A:
	test	word ptr [bp+0A],0080
	jz	0095

l11AF_0091:
	xor	ax,ax
	jmp	0098

l11AF_0095:
	mov	ax,0001

l11AF_0098:
	mov	[bp-04],ax
	jmp	00B3

l11AF_009D:
	test	di,0400
	jz	00B1

l11AF_00A3:
	mov	ax,0050
	push	ax
	call	far 1188:000E
	jmp	018F
11AF:00AF                                              EB                .
11AF:00B0 02                                              .              

l11AF_00B1:
	jmp	00F3

l11AF_00B3:
	test	di,00F0
	jz	00DA

l11AF_00B9:
	push	word ptr [bp+06]
	xor	ax,ax
	push	ax
	call	000B
	mov	si,ax
	mov	ax,si
	or	ax,ax
	jge	00CF

l11AF_00CA:
	mov	ax,si
	jmp	018F

l11AF_00CF:
	push	si
	call	far 120D:000A
	pop	cx
	jmp	00F8
11AF:00D8                         EB 16                           ..     

l11AF_00DA:
	push	word ptr [bp+06]
	push	word ptr [bp-04]
	call	000B
	mov	si,ax
	mov	ax,si
	or	ax,ax
	jge	00F0

l11AF_00EB:
	mov	ax,si
	jmp	018F

l11AF_00F0:
	jmp	016A
11AF:00F2       90                                          .            

l11AF_00F3:
	mov	word ptr [bp-04],0000

l11AF_00F8:
	push	di
	push	word ptr [bp+06]
	call	far 11C8:0005
	pop	cx
	pop	cx
	mov	si,ax
	mov	ax,si
	or	ax,ax
	jl	016A

l11AF_010B:
	xor	ax,ax
	push	ax
	push	si
	call	far 11F8:0008
	pop	cx
	pop	cx
	mov	[bp-02],ax
	test	ax,0080
	jz	0141

l11AF_011E:
	or	di,2000
	test	di,8000
	jz	013F

l11AF_0128:
	mov	ax,[bp-02]
	and	ax,00FF
	or	ax,0020
	push	ax
	mov	ax,0001
	push	ax
	push	si
	call	far 11F8:0008
	add	sp,06

l11AF_013F:
	jmp	014B

l11AF_0141:
	test	di,0200
	jz	014B

l11AF_0147:
	push	si
	call	0028

l11AF_014B:
	cmp	word ptr [bp-04],00
	jz	016A

l11AF_0151:
	test	di,00F0
	jz	016A

l11AF_0157:
	mov	ax,0001
	push	ax
	mov	ax,0001
	push	ax
	push	word ptr [bp+06]
	call	far 1252:0004
	add	sp,06

l11AF_016A:
	or	si,si
	jl	018B

l11AF_016E:
	test	di,0300
	jz	0179

l11AF_0174:
	mov	ax,1000
	jmp	017B

l11AF_0179:
	xor	ax,ax

l11AF_017B:
	mov	dx,di
	and	dx,F8FF
	or	ax,dx
	mov	bx,si
	shl	bx,01
	mov	[bx+1328],ax

l11AF_018B:
	mov	ax,si
	jmp	018F

l11AF_018F:
	pop	di
;;; Segment 11C8 (11C8:0000)
11C8:0000 5E 8B E5 5D CB                                  ^..].          

fn11C8_0005()
	push	bp
	mov	bp,sp
	push	si
	mov	al,01
	mov	cx,[bp+08]
	test	cx,0002
	jnz	001E

l11C8_0014:
	mov	al,02
	test	cx,0004
	jnz	001E

l11C8_001C:
	mov	al,00

l11C8_001E:
	mov	dx,[bp+06]
	mov	cl,F0
	and	cl,[bp+08]
	or	al,cl
	mov	ah,3D
	int	21
	jc	0045

l11C8_002E:
	mov	si,ax
	mov	ax,[bp+08]
	and	ax,F8FF
	or	ax,8000
	mov	bx,si
	shl	bx,01
	mov	[bx+1328],ax
	mov	ax,si
	jmp	004D

l11C8_0045:
	push	ax
	call	far 1188:000E
	jmp	004D

l11C8_004D:
	pop	si
	pop	bp
	retf	
;;; Segment 11CD (11CD:0000)
11CD:0000 55 8B EC 83 EC 02 56 57 8B 5E 04 8B 37 8B C6 89 U.....VW.^..7...
11CD:0010 46 FE 8B 5E 04 F7 47 02 40 00 74 04 8B C6 EB 1F F..^..G.@.t.....
11CD:0020 8B 5E 04 8B 7F 0A EB 0B 8B DF 47 80 3F 0A 75 03 .^........G.?.u.
11CD:0030 FF 46 FE 8B C6 4E 0B C0 75 EE 8B 46 FE EB 00 5F .F...N..u..F..._
11CD:0040 5E 8B E5 5D C2 02 00 55 8B EC 56 8B 76 06 56 9A ^..]...U..V.v.V.
11CD:0050 03 00 5B 12 59 0B C0 74 05 B8 FF FF EB 4E 83 7E ..[.Y..t.....N.~
11CD:0060 0C 01 75 10 83 3C 00 7E 0B 56 E8 93 FF 99 29 46 ..u..<.~.V....)F
11CD:0070 08 19 56 0A 81 64 02 5F FE C7 04 00 00 8B 44 08 ..V..d._......D.
11CD:0080 89 44 0A FF 76 0C FF 76 0A FF 76 08 8A 44 04 98 .D..v..v..v..D..
11CD:0090 50 9A 06 00 36 12 83 C4 08 83 FA FF 75 0A 3D FF P...6.......u.=.
11CD:00A0 FF 75 05 B8 FF FF EB 02 33 C0 EB 00 5E 5D CB 55 .u......3...^].U
11CD:00B0 8B EC 83 EC 04 56 8B 76 06 56 9A 03 00 5B 12 59 .....V.v.V...[.Y
11CD:00C0 0B C0 74 08 BA FF FF B8 FF FF EB 41 B8 01 00 50 ..t........A...P
11CD:00D0 33 C0 50 50 8A 44 04 98 50 9A 06 00 36 12 83 C4 3.PP.D..P...6...
11CD:00E0 08 89 56 FE 89 46 FC 83 3C 00 7E 19 8B 56 FE 8B ..V..F..<.~..V..
11CD:00F0 46 FC 52 50 56 E8 08 FF 99 8B D8 8B CA 58 5A 2B F.RPV........XZ+
11CD:0100 C3 1B D1 EB 06 8B 56 FE 8B 46 FC EB 00 5E 8B E5 ......V..F...^..
;;; Segment 11DE (11DE:0000)
11DE:0000 5D CB 56 57 BF 14 00 BE E8 11 EB 15 8B 44 02 25 ].VW.........D.%
11DE:0010 00 03 3D 00 03 75 07 56 9A 03 00 5B 12 59 83 C6 ..=..u.V...[.Y..
11DE:0020 10 8B C7 4F 0B C0 75 E4 5F 5E C3 55 8B EC 56 8B ...O..u._^.U..V.
11DE:0030 76 04 F7 44 02 00 02 74 03 E8 C6 FF FF 74 06 8B v..D...t.....t..
11DE:0040 44 08 89 44 0A 50 8A 44 04 98 50 9A 03 00 12 12 D..D.P.D..P.....
11DE:0050 83 C4 06 89 04 0B C0 7E 0B 81 64 02 DF FF 33 C0 .......~..d...3.
11DE:0060 EB 23 EB 1C 83 3C 00 75 0E 8B 44 02 25 7F FE 0D .#...<.u..D.%...
11DE:0070 20 00 89 44 02 EB 09 C7 04 00 00 81 4C 02 10 00  ..D........L...
11DE:0080 B8 FF FF EB 00 5E 5D C2 02 00 55 8B EC 56 8B 76 .....^]...U..V.v
11DE:0090 06 FF 04 56 9A 9F 00 DE 11 59 EB 00 5E 5D CB 55 ...V.....Y..^].U
11DE:00A0 8B EC 83 EC 02 56 8B 76 06 FF 0C 7C 0E FF 44 0A .....V.v...|..D.
11DE:00B0 8B 5C 0A 8A 47 FF B4 00 E9 DC 00 FF 04 7C 07 F7 .\..G........|..
11DE:00C0 44 02 10 01 74 0B 81 4C 02 10 00 B8 FF FF E9 C6 D...t..L........
11DE:00D0 00 81 4C 02 80 00 83 7C 06 00 74 13 56 E8 4B FF ..L....|..t.V.K.
11DE:00E0 0B C0 74 06 B8 FF FF E9 AD 00 EB BD E9 A8 00 83 ..t.............
11DE:00F0 3E 54 13 00 75 3C B8 E8 11 3B C6 75 35 8A 44 04 >T..u<...;.u5.D.
11DE:0100 98 50 9A 03 00 FB 11 59 0B C0 75 05 81 64 02 FF .P.....Y..u..d..
11DE:0110 FD B8 00 02 50 F7 44 02 00 02 74 05 B8 01 00 EB ....P.D...t.....
11DE:0120 02 33 C0 50 33 C0 50 56 9A 0B 00 FC 11 83 C4 08 .3.P3.PV........
11DE:0130 EB 9F F7 44 02 00 02 74 03 E8 C6 FE B8 01 00 50 ...D...t.......P
11DE:0140 8D 46 FF 50 8A 44 04 98 50 9A 05 00 1E 12 83 C4 .F.P.D..P.......
11DE:0150 06 3D 01 00 74 28 8A 44 04 98 50 9A 03 00 54 12 .=..t(.D..P...T.
11DE:0160 59 3D 01 00 74 07 81 4C 02 10 00 EB 0C 8B 44 02 Y=..t..L......D.
11DE:0170 25 7F FE 0D 20 00 89 44 02 B8 FF FF EB 19 80 7E %... ..D.......~
11DE:0180 FF 0D 75 07 F7 44 02 40 00 74 A7 81 64 02 DF FF ..u..D.@.t..d...
11DE:0190 8A 46 FF B4 00 EB 00 5E 8B E5 5D CB B8 E8 11 50 .F.....^..]....P
;;; Segment 11F8 (11F8:0000)
11F8:0000 0E E8 FB FE 59 EB 00 CB                         ....Y...       

fn11F8_0008()
	push	bp
	mov	bp,sp
	mov	ah,44
	mov	al,[bp+08]
	mov	bx,[bp+06]
	mov	cx,[bp+0C]
	mov	dx,[bp+0A]
	int	21
	jc	0029

l11F8_001D:
	cmp	word ptr [bp+08],00
	jnz	0027

l11F8_0023:
	mov	ax,dx
	jmp	0031

l11F8_0027:
	jmp	0031

l11F8_0029:
	push	ax
	call	far 1188:000E
	jmp	0031
;;; Segment 11FB (11FB:0000)
11FB:0000 00                                              .              

l11F8_0031:
	pop	bp
	retf	
11F8:0033          55 8B EC B8 00 44 8B 5E 06 CD 21 B8 00    U....D.^..!..
;;; Segment 11FC (11FC:0000)
11FC:0000 00 72 04 D1 E2 D1 D0 EB 00 5D CB 55 8B EC 56 57 .r.......].U..VW
11FC:0010 8B 7E 0C 8B 76 06 8B 44 0E 3B C6 75 0C 83 7E 0A .~..v..D.;.u..~.
11FC:0020 02 7F 06 81 FF FF 7F 76 06 B8 FF FF E9 B6 00 83 .......v........
11FC:0030 3E 56 13 00 75 0F B8 F8 11 3B C6 75 08 C7 06 56 >V..u....;.u...V
11FC:0040 13 01 00 EB 14 83 3E 54 13 00 75 0D B8 E8 11 3B ......>T..u....;
11FC:0050 C6 75 06 C7 06 54 13 01 00 83 3C 00 74 11 B8 01 .u...T....<.t...
11FC:0060 00 50 33 C0 50 50 56 9A 47 00 CD 11 83 C4 08 F7 .P3.PPV.G.......
11FC:0070 44 02 04 00 74 09 FF 74 08 9A 23 01 DB 12 59 81 D...t..t..#...Y.
11FC:0080 64 02 F3 FF C7 44 06 00 00 8B C6 05 05 00 89 44 d....D.........D
11FC:0090 08 89 44 0A 83 7E 0A 02 74 47 0B FF 76 43 C7 06 ..D..~..tG..vC..
11FC:00A0 D6 10 10 12 C7 06 D4 10 00 00 83 7E 08 00 75 1A ...........~..u.
11FC:00B0 57 9A EF 00 92 11 59 89 46 08 0B C0 74 07 81 4C W.....Y.F...t..L
11FC:00C0 02 04 00 EB 05 B8 FF FF EB 1B 8B 46 08 89 44 0A ...........F..D.
11FC:00D0 89 44 08 89 7C 06 83 7E 0A 01 75 05 81 4C 02 08 .D..|..~..u..L..
;;; Segment 120A (120A:0000)
120A:0000 00 33 C0 EB 00 5F 5E 5D CB                      .3..._^].      

fn120A_0009()
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+06]
	or	si,si
	jl	0019

l120A_0014:
	cmp	si,14
	jl	0024

l120A_0019:
	mov	ax,0006
	push	ax
	call	far 1188:000E
	jmp	0037

l120A_0024:
	mov	bx,si
	shl	bx,01
	mov	word ptr [bx+1328],FFFF
	push	si
	call	far 120D:000A
;;; Segment 120D (120D:0000)
120D:0000 0A 00 0D 12 59 EB 00                            ....Y..        

l120A_0037:
	pop	si
	pop	bp
	retf	

fn120D_000A()
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+06]
	mov	ah,3E
	mov	bx,si
	int	21
	jc	0025

l120D_0019:
	shl	bx,01
	mov	word ptr [bx+1328],FFFF
	xor	ax,ax
	jmp	002D

l120D_0025:
	push	ax
	call	far 1188:000E
	jmp	002D

l120D_002D:
	pop	si
	pop	bp
	retf	
;;; Segment 1210 (1210:0000)
1210:0000 56 57 BF 04 00 BE E8 11 EB 12 F7 44 02 03 00 74 VW.........D...t
1210:0010 07 56 9A 03 00 5B 12 59 4F 83 C6 10 0B FF 75 EA .V...[.YO.....u.
;;; Segment 1212 (1212:0000)
1212:0000 5F 5E CB                                        _^.            

fn1212_0003()
	push	bp
	mov	bp,sp
	sub	sp,04
	push	si
	push	di
	mov	ax,[bp+0A]
	inc	ax
	cmp	ax,0002
	jc	0021

l1212_0014:
	mov	bx,[bp+06]
	shl	bx,01
	test	word ptr [bx+1328],0200
	jz	0026

l1212_0021:
	xor	ax,ax
	jmp	00BF

l1212_0026:
	push	word ptr [bp+0A]
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	call	far 121E:0005
	add	sp,06
	mov	[bp-04],ax
	mov	ax,[bp-04]
	inc	ax
	cmp	ax,0002
	jc	0050

l1212_0043:
	mov	bx,[bp+06]
	shl	bx,01
	test	word ptr [bx+1328],8000
	jz	0056

l1212_0050:
	mov	ax,[bp-04]
	jmp	00BF
1212:0055                90                                    .         

l1212_0056:
	mov	cx,[bp-04]
	mov	si,[bp+08]
	push	ds
	pop	es
	mov	di,si
	mov	bx,si
	cld	

l1212_0063:
	lodsb	
	cmp	al,1A
	jz	0097

l1212_0068:
	cmp	al,0D
	jz	0071

l1212_006C:
	stosb	
	loop	0063

l1212_006F:
	jmp	008F

l1212_0071:
	loop	0063

l1212_0073:
	push	es
	push	bx
	mov	ax,0001
	push	ax
	lea	ax,[bp-01]
	push	ax
	push	word ptr [bp+06]
	call	far 121E:0005
	add	sp,06
	pop	bx
	pop	es
	cld	
	mov	al,[bp-01]
	stosb	

l1212_008F:
	cmp	di,bx
	jnz	0095

l1212_0093:
	jmp	0026

l1212_0095:
	jmp	00B9

l1212_0097:
	push	bx
	mov	ax,0002
	push	ax
	neg	cx
	sbb	ax,ax
	push	ax
	push	cx
	push	word ptr [bp+06]
	call	far 1236:0006
	add	sp,08
	mov	bx,[bp+06]
	shl	bx,01
	or	word ptr [bx+1328],0200
	pop	bx

l1212_00B9:
	mov	ax,di
	sub	ax,bx
	jmp	00BF

l1212_00BF:
	pop	di
;;; Segment 121E (121E:0000)
121E:0000 5E 8B E5 5D CB                                  ^..].          

fn121E_0005()
	push	bp
	mov	bp,sp
	mov	ah,3F
	mov	bx,[bp+06]
	mov	cx,[bp+0A]
	mov	dx,[bp+08]
	int	21
	jc	0019

l121E_0017:
	jmp	0021

l121E_0019:
	push	ax
	call	far 1188:000E
	jmp	0021
;;; Segment 1220 (1220:0000)
1220:0000 00                                              .              

l121E_0021:
	pop	bp
	retf	
121E:0023          55 8B EC 81 EC 8A 00 56 57 8B 46 0A 40    U......VW.F.@
121E:0030 3D 02 00 73 05 33 C0 E9 FC 00 8B 5E 06 D1 E3 F7 =..s.3.....^....
121E:0040 87 28 13 00 80 74 14 FF 76 0A FF 76 08 FF 76 06 .(...t..v..v..v.
121E:0050 9A 0C 00 31 12 83 C4 06 E9 DB 00 8B 5E 06 D1 E3 ...1........^...
121E:0060 81 A7 28 13 FF FD 8B 46 08 89 86 7C FF 8B 46 0A ..(....F...|..F.
121E:0070 89 86 78 FF 8D B6 7E FF EB 6F FF 8E 78 FF 8B 9E ..x...~..o..x...
121E:0080 7C FF FF 86 7C FF 8A 07 88 86 7B FF 3C 0A 75 04 |...|.....{.<.u.
121E:0090 C6 04 0D 46 8A 86 7B FF 88 04 46 8D 86 7E FF 8B ...F..{...F..~..
121E:00A0 D6 2B D0 81 FA 80 00 7C 40 8D 86 7E FF 8B FE 2B .+.....|@..~...+
121E:00B0 F8 57 8D 86 7E FF 50 FF 76 06 9A 0C 00 31 12 83 .W..~.P.v....1..
121E:00C0 C4 06 89 86 76 FF 3B C7 74 1B 83 BE 76 FF 00 73 ....v.;.t...v..s
121E:00D0 05 B8 FF FF EB 0D 8B 46 0A 2B 86 78 FF 03 86 76 .......F.+.x...v
121E:00E0 FF 2B C7 EB 51 8D B6 7E FF 83 BE 78 FF 00 74 03 .+..Q..~...x..t.
121E:00F0 E9 87 FF 8D 86 7E FF 8B FE 2B F8 8B C7 0B C0 76 .....~...+.....v
121E:0100 30 57 8D 86 7E FF 50 FF 76 06 9A 0C 00 31 12 83 0W..~.P.v....1..
121E:0110 C4 06 89 86 76 FF 3B C7 74 17 83 BE 76 FF 00 73 ....v.;.t...v..s
121E:0120 05 B8 FF FF EB 09 8B 46 0A 03 86 76 FF 2B C7 EB .......F...v.+..
;;; Segment 1231 (1231:0000)
1231:0000 05 8B 46 0A EB 00 5F 5E 8B E5 5D CB 55 8B EC 8B ..F..._^..].U...
1231:0010 5E 06 D1 E3 F7 87 28 13 00 08 74 12 B8 02 00 50 ^.....(...t....P
1231:0020 33 C0 50 50 FF 76 06 9A 06 00 36 12 8B E5 B4 40 3.PP.v....6....@
1231:0030 8B 5E 06 8B 4E 0A 8B 56 08 CD 21 72 0F 50 8B 5E .^..N..V..!r.P.^
1231:0040 06 D1 E3 81 8F 28 13 00 10 58 EB 08 50 9A 0E 00 .....(...X..P...
;;; Segment 1236 (1236:0000)
1236:0000 88 11 EB 00 5D CB                               ....].         

fn1236_0006()
	push	bp
	mov	bp,sp
	mov	bx,[bp+06]
	shl	bx,01
	and	word ptr [bx+1328],FDFF
	mov	ah,42
	mov	al,[bp+0C]
	mov	bx,[bp+06]
	mov	cx,[bp+0A]
	mov	dx,[bp+08]
	int	21
	jc	0028

l1236_0026:
	jmp	0031

l1236_0028:
	push	ax
	call	far 1188:000E
	cwd	
	jmp	0031
;;; Segment 1239 (1239:0000)
1239:0000 00                                              .              

l1236_0031:
	pop	bp
	retf	

fn1239_0003()
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
	push	es
	mov	di,[bp+0C]
	push	ds
	pop	es
	mov	bx,[bp+0A]
	cmp	bx,24
	ja	0071

l1239_0019:
	cmp	bl,02
	jc	0071

l1239_001E:
	mov	ax,[bp+0E]
	mov	cx,[bp+10]
	or	cx,cx
	jge	0039

l1239_0028:
	cmp	byte ptr [bp+08],00
	jz	0039

l1239_002E:
	mov	byte ptr [di],2D
	inc	di
	neg	cx
	neg	ax
	sbb	cx,00

l1239_0039:
	lea	si,[bp-22]
	jcxz	004D

l1239_003E:
	xchg	ax,cx
	sub	dx,dx
	div	bx
	xchg	ax,cx
	div	bx
	mov	[si],dl
	inc	si
	jcxz	0054

l1239_004B:
	jmp	003E

l1239_004D:
	sub	dx,dx
	div	bx
	mov	[si],dl
	inc	si

l1239_0054:
	or	ax,ax
	jnz	004D

l1239_0058:
	lea	cx,[bp-22]
	neg	cx
	add	cx,si
	cld	

l1239_0060:
	dec	si
	mov	al,[si]
	sub	al,0A
	jnc	006B

l1239_0067:
	add	al,3A
	jmp	006E

l1239_006B:
	add	al,[bp+06]

l1239_006E:
	stosb	
	loop	0060

l1239_0071:
	mov	al,00
	stosb	
	pop	es
	mov	ax,[bp+0C]
	jmp	007A

l1239_007A:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	000C
1239:0082       55 8B EC 83 7E 0A 0A 75 06 8B 46 06 99 EB   U...~..u..F...
1239:0090 05 8B 46 06 33 D2 52 50 FF 76 08 FF 76 0A B0 01 ..F.3.RP.v..v...
1239:00A0 50 B0 61 50 0E E8 5B FF EB 00 5D CB 55 8B EC FF P.aP..[...].U...
1239:00B0 76 08 FF 76 06 FF 76 0A FF 76 0C B0 00 50 B0 61 v..v..v..v...P.a
1239:00C0 50 0E E8 3E FF EB 00 5D CB 55 8B EC FF 76 08 FF P..>...].U...v..
1239:00D0 76 06 FF 76 0A FF 76 0C 83 7E 0C 0A 75 05 B8 01 v..v..v..~..u...
1239:00E0 00 EB 02 33 C0 50 B0 61 50 0E E8 16 FF EB 00 5D ...3.P.aP......]
;;; Segment 1248 (1248:0000)
1248:0000 CB                                              .              

fn1248_0001()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	pop	es
	cld	
	mov	di,[bp+06]
	xor	al,al
	mov	cx,FFFF
;;; Segment 1249 (1249:0000)
1249:0000 FF                                              .              

l1248_0011:
	repne	
	scasb	

l1248_0013:
	mov	ax,cx
	not	ax
	dec	ax
	jmp	001A

l1248_001A:
	pop	di
	pop	si
	pop	bp
	retf	

fn1249_000E()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	pop	es
	cld	
	mov	di,[bp+08]
	mov	si,di
	xor	al,al
	mov	cx,FFFF

l1249_0020:
	repne	
	scasb	

l1249_0022:
	not	cx
	mov	di,[bp+06]

l1249_0027:
	rep	
	movsb	

l1249_0029:
	mov	ax,[bp+06]
	jmp	002E

l1249_002E:
	pop	di
	pop	si
;;; Segment 124C (124C:0000)
124C:0000 5D CB                                           ].             
1249:0032       55 8B EC 56 57 1E 07 8B 7E 06 8B 76 08 8B   U..VW...~..v..
1249:0040 4E 0A D1 E9 FC F3 A5 73 01 A4 8B 46 06 EB 00 5F N......s...F..._
;;; Segment 124E (124E:0000)
124E:0000 5E 5D CB                                        ^].            

fn124E_0003()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	pop	es
	mov	di,[bp+06]
	mov	cx,[bp+08]
	mov	al,[bp+0A]
	mov	ah,al
	cld	
	test	di,0001
	jz	0020

l124E_001C:
	jcxz	0027

l124E_001E:
	stosb	
	dec	cx

l124E_0020:
	shr	cx,01

l124E_0022:
	rep	
	stosw	

l124E_0024:
	jnc	0027

l124E_0026:
	stosb	

l124E_0027:
	pop	di
	pop	si
	pop	bp
	retf	

fn124E_002B()
	push	bp
	mov	bp,sp
	push	word ptr [bp+08]
	push	word ptr [bp+0A]
	push	word ptr [bp+06]
	push	cs
	call	0003
	mov	sp,bp
	mov	ax,[bp+06]
;;; Segment 1252 (1252:0000)
1252:0000 EB 00                                           ..             

l124E_0042:
	pop	bp
	retf	

fn1252_0004()
	push	bp
	mov	bp,sp
	mov	ah,43
	mov	al,[bp+08]
	mov	cx,[bp+0A]
	mov	dx,[bp+06]
	int	21
	jc	0019

l1252_0016:
	xchg	ax,cx
	jmp	0021

l1252_0019:
	push	ax
	call	far 1188:000E
	jmp	0021
;;; Segment 1254 (1254:0000)
1254:0000 00                                              .              

l1252_0021:
	pop	bp
	retf	
1252:0023          55 8B EC 83 EC 04 8B 5E 06 D1 E3 F7 87    U......^.....
1252:0030 28 13 00 02 74 06 B8 01 00 EB 54 90 B8 00 44 8B (...t.....T...D.
1252:0040 5E 06 CD 21 72 41 F6 C2 80 75 38 B8 01 42 33 C9 ^..!rA...u8..B3.
1252:0050 33 D2 CD 21 72 31 52 50 B8 02 42 33 C9 33 D2 CD 3..!r1RP..B3.3..
1252:0060 21 89 46 FC 89 56 FE 5A 59 72 1C B8 00 42 CD 21 !.F..V.ZYr...B.!
1252:0070 72 15 3B 56 FE 72 0C 77 05 3B 46 FC 72 05 B8 01 r.;V.r.w.;F.r...
1252:0080 00 EB 0C 33 C0 EB 08 50 9A 0E 00 88 11 EB 00 8B ...3...P........
;;; Segment 125B (125B:0000)
125B:0000 E5 5D CB 55 8B EC 56 57 8B 76 06 8B 44 0E 3B C6 .].U..VW.v..D.;.
125B:0010 74 05 B8 FF FF EB 68 83 3C 00 7C 2D F7 44 02 08 t.....h.<.|-.D..
125B:0020 00 75 0C 8B 44 0A 8B D6 83 C2 05 3B C2 75 16 C7 .u..D......;.u..
125B:0030 04 00 00 8B 44 0A 8B D6 83 C2 05 3B C2 75 06 8B ....D......;.u..
125B:0040 44 08 89 44 0A 33 C0 EB 36 8B 7C 06 03 3C 47 29 D..D.3..6.|..<G)
125B:0050 3C 57 8B 44 08 89 44 0A 50 8A 44 04 98 50 9A 03 <W.D..D.P.D..P..
125B:0060 00 20 12 83 C4 06 3B C7 74 11 F7 44 02 00 02 75 . ....;.t..D...u
125B:0070 0A 81 4C 02 10 00 B8 FF FF EB 04 33 C0 EB 00 5F ..L........3..._
;;; Segment 1263 (1263:0000)
1263:0000 5E 5D CB                                        ^].            

fn1263_0003()
	push	bp
	mov	bp,sp
	mov	ax,1265
	push	ax
	mov	ax,0170
	push	ax
	mov	ax,11F8
	push	ax
	push	word ptr [bp+06]
	lea	ax,[bp+08]
	push	ax
	call	far 1288:002B
	jmp	0020
;;; Segment 1265 (1265:0000)

l1263_0020:
	pop	bp
	retf	
1263:0022       55 8B EC 8B 5E 08 FF 0F FF 76 08 8A 46 06   U...^....v..F.
1263:0030 98 50 9A 1D 00 65 12 8B E5 EB 00 5D CB 55 8B EC .P...e.....].U..
1263:0040 83 EC 02 56 8B 76 08 8A 46 06 88 46 FF FF 04 7D ...V.v..F..F...}
1263:0050 38 8A 46 FF FF 44 0A 8B 5C 0A 88 47 FF F7 44 02 8.F..D..\..G..D.
1263:0060 08 00 74 1D 80 7E FF 0A 74 06 80 7E FF 0D 75 11 ..t..~..t..~..u.
1263:0070 56 9A 03 00 5B 12 59 0B C0 74 06 B8 FF FF E9 F3 V...[.Y..t......
1263:0080 00 8A 46 FF B4 00 E9 EB 00 FF 0C F7 44 02 90 00 ..F.........D...
1263:0090 75 07 F7 44 02 02 00 75 0B 81 4C 02 10 00 B8 FF u..D...u..L.....
1263:00A0 FF E9 D0 00 81 4C 02 00 01 83 7C 06 00 74 28 83 .....L....|..t(.
1263:00B0 3C 00 74 13 56 9A 03 00 5B 12 59 0B C0 74 06 B8 <.t.V...[.Y..t..
1263:00C0 FF FF E9 AF 00 EB 0A B8 FF FF 8B 54 06 2B C2 89 ...........T.+..
1263:00D0 04 E9 79 FF E9 9D 00 83 3E 56 13 00 75 3D B8 F8 ..y.....>V..u=..
1263:00E0 11 3B C6 75 36 8A 44 04 98 50 9A 03 00 FB 11 59 .;.u6.D..P.....Y
1263:00F0 0B C0 75 05 81 64 02 FF FD B8 00 02 50 F7 44 02 ..u..d......P.D.
1263:0100 00 02 74 05 B8 02 00 EB 02 33 C0 50 33 C0 50 56 ..t......3.P3.PV
1263:0110 9A 0B 00 FC 11 83 C4 08 E9 89 FF 80 7E FF 0A 75 ............~..u
1263:0120 21 F7 44 02 40 00 75 1A B8 01 00 50 B8 8A 13 50 !.D.@.u....P...P
1263:0130 8A 44 04 98 50 9A 0C 00 31 12 83 C4 06 3D 01 00 .D..P...1....=..
1263:0140 75 1A B8 01 00 50 8D 46 06 50 8A 44 04 98 50 9A u....P.F.P.D..P.
1263:0150 0C 00 31 12 83 C4 06 3D 01 00 74 11 F7 44 02 00 ..1....=..t..D..
1263:0160 02 75 0A 81 4C 02 10 00 B8 FF FF EB 07 8A 46 FF .u..L.........F.
1263:0170 B4 00 EB 00 5E 8B E5 5D CB 55 8B EC 56 8B 76 06 ....^..].U..V.v.
1263:0180 B8 F8 11 50 56 0E E8 B4 FE 59 59 EB 00 5E 5D CB ...PV....YY..^].
1263:0190 55 8B EC 83 EC 02 56 57 8B 76 06 8B 7E 08 47 F7 U.....VW.v..~.G.
1263:01A0 44 02 08 00 74 24 EB 02 EB 00 4F 8B C7 0B C0 74 D...t$....O....t
1263:01B0 16 56 8B 5E 0A FF 46 0A 8A 07 98 50 0E E8 7D FE .V.^..F....P..}.
1263:01C0 59 59 3D FF FF 75 E1 E9 7A 00 F7 44 02 40 00 74 YY=..u..z..D.@.t
1263:01D0 3B 83 7C 06 00 74 35 8B 44 06 3B C7 73 2E 83 3C ;.|..t5.D.;.s..<
1263:01E0 00 74 0F 56 9A 03 00 5B 12 59 0B C0 74 04 33 C0 .t.V...[.Y..t.3.
1263:01F0 EB 56 4F 57 FF 76 0A 8A 44 04 98 50 9A 0C 00 31 .VOW.v..D..P...1
1263:0200 12 83 C4 06 89 46 FE 2B 7E FE EB 38 EB 02 EB 00 .....F.+~..8....
1263:0210 4F 8B C7 0B C0 74 2D FF 04 7D 15 8B 5E 0A FF 46 O....t-..}..^..F
1263:0220 0A 8A 07 FF 44 0A 8B 5C 0A 88 47 FF B4 00 EB 0F ....D..\..G.....
1263:0230 56 8B 5E 0A FF 46 0A FF 37 0E E8 E5 FD 59 59 3D V.^..F..7....YY=
1263:0240 FF FF 75 CA 8B C7 EB 00 5F 5E 8B E5 5D CA 06 00 ..u....._^..]...
;;; Segment 1288 (1288:0000)

fn1288_0000()
	push	bp
	mov	bp,sp
	mov	dx,[bp+04]
	mov	cx,0F04
	mov	bx,1393
	cld	
	mov	al,dh
	shr	al,cl
	xlat	
	stosb	
	mov	al,dh
	and	al,ch
	xlat	
	stosb	
	mov	al,dl
	shr	al,cl
	xlat	
	stosb	
	mov	al,dl
	and	al,ch
	xlat	
	stosb	
	jmp	0027

l1288_0027:
	pop	bp
	ret	0002

fn1288_002B()
	push	bp
	mov	bp,sp
	sub	sp,0096
	push	si
	push	di
	mov	word ptr [bp-56],0000
	mov	byte ptr [bp-53],50
	jmp	0077

fn1288_003F()
	push	di
	mov	cx,FFFF
	xor	al,al

l1288_0045:
	repne	
	scasb	

l1288_0047:
	not	cx
	dec	cx
	pop	di
	ret	

fn1288_004C()
	mov	[di],al
	inc	di
	dec	byte ptr [bp-53]
	jle	0076

fn1288_0054()
	push	bx
	push	cx
	push	dx
	push	es
	lea	ax,[bp-52]
	sub	di,ax
	lea	ax,[bp-52]
	push	ax
	push	di
	push	word ptr [bp+0A]
	call	dword ptr [bp+0C]
	mov	byte ptr [bp-53],50
	add	[bp-56],di
	lea	di,[bp-52]
	pop	es
	pop	dx
	pop	cx
	pop	bx

l1288_0076:
	ret	

l1288_0077:
	push	es
	cld	
	lea	di,[bp-52]
	mov	[bp+FF6C],di

l1288_0080:
	mov	di,[bp+FF6C]

l1288_0084:
	mov	si,[bp+08]

l1288_0087:
	lodsb	
	or	al,al
	jz	009D

l1288_008C:
	cmp	al,25
	jz	00A0

l1288_0090:
	mov	[di],al
	inc	di
	dec	byte ptr [bp-53]
	jg	0087

l1288_0098:
	call	0054
	jmp	0087

l1288_009D:
	jmp	0519

l1288_00A0:
	mov	[bp+FF78],si
	lodsb	
	cmp	al,25
	jz	0090

l1288_00A9:
	mov	[bp+FF6C],di
	xor	cx,cx
	mov	[bp+FF76],cx
	mov	[bp+FF6A],cx
	mov	[bp+FF75],cl
	mov	word ptr [bp+FF70],FFFF
	mov	word ptr [bp+FF72],FFFF
	jmp	00CA

l1288_00C9:
	lodsb	

l1288_00CA:
	xor	ah,ah
	mov	dx,ax
	mov	bx,ax
	sub	bl,20
	cmp	bl,60
	jnc	011F

l1288_00D8:
	mov	bl,[bx+13A3]
	mov	ax,bx
	cmp	ax,0017
	jbe	00E6

l1288_00E3:
	jmp	0507

l1288_00E6:
	mov	bx,ax
	shl	bx,01
	jmp	word ptr cs:[bx+00EF]
Jump table at 1288:00EF (48 bytes)
	1288:013A
	1288:0122
	1288:017B
	1288:012E
	1288:01A0
	1288:01AA
	1288:01EC
	1288:01F6
	1288:0206
	1288:0161
	1288:023B
	1288:0216
	1288:021A
	1288:021E
	1288:02C2
	1288:0374
	1288:0315
	1288:0335
	1288:04DA
	1288:0507
	1288:0507
	1288:0507
	1288:014D
	1288:0157
1288:00EF                                              3A                :
1288:00F0 01 22 01 7B 01 2E 01 A0 01 AA 01 EC 01 F6 01 06 .".{............
1288:0100 02 61 01 3B 02 16 02 1A 02 1E 02 C2 02 74 03 15 .a.;.........t..
1288:0110 03 35 03 DA 04 07 05 07 05 07 05 4D 01 57 01    .5.........M.W.

l1288_011F:
	jmp	0507

l1288_0122:
	cmp	ch,00
	ja	011F

l1288_0127:
	or	word ptr [bp+FF6A],01
	jmp	00C9

l1288_012E:
	cmp	ch,00
	ja	011F

l1288_0133:
	or	word ptr [bp+FF6A],02
	jmp	00C9

l1288_013A:
	cmp	ch,00
	ja	011F

l1288_013F:
	cmp	byte ptr [bp+FF75],2B
	jz	014A

l1288_0146:
	mov	[bp+FF75],dl

l1288_014A:
	jmp	00C9

l1288_014D:
	and	word ptr [bp+FF6A],DF
	mov	ch,05
	jmp	00C9

l1288_0157:
	or	word ptr [bp+FF6A],20
	mov	ch,05
	jmp	00C9

l1288_0161:
	cmp	ch,00
	ja	01AA

l1288_0166:
	test	word ptr [bp+FF6A],0002
	jnz	018F

l1288_016E:
	or	word ptr [bp+FF6A],08
	mov	ch,01
	jmp	00C9

l1288_0178:
	jmp	0507

l1288_017B:
	mov	di,[bp+06]
	mov	ax,[di]
	add	word ptr [bp+06],02
	cmp	ch,02
	jnc	0192

l1288_0189:
	mov	[bp+FF70],ax
	mov	ch,03

l1288_018F:
	jmp	00C9

l1288_0192:
	cmp	ch,04
	jnz	0178

l1288_0197:
	mov	[bp+FF72],ax
	inc	ch
	jmp	00C9

l1288_01A0:
	cmp	ch,04
	jnc	0178

l1288_01A5:
	mov	ch,04
	jmp	00C9

l1288_01AA:
	xchg	ax,dx
	sub	al,30
	cbw	
	cmp	ch,02
	ja	01CE

l1288_01B3:
	mov	ch,02
	xchg	[bp+FF70],ax
	or	ax,ax
	jl	018F

l1288_01BD:
	shl	ax,01
	mov	dx,ax
	shl	ax,01
	shl	ax,01
	add	ax,dx
	add	[bp+FF70],ax
	jmp	00C9

l1288_01CE:
	cmp	ch,04
	jnz	0178

l1288_01D3:
	xchg	[bp+FF72],ax
	or	ax,ax
	jl	018F

l1288_01DB:
	shl	ax,01
	mov	dx,ax
	shl	ax,01
	shl	ax,01
	add	ax,dx
	add	[bp+FF72],ax
	jmp	00C9

l1288_01EC:
	or	word ptr [bp+FF6A],10
	mov	ch,05
	jmp	00C9

l1288_01F6:
	or	word ptr [bp+FF6A],0100
	and	word ptr [bp+FF6A],EF
	mov	ch,05
	jmp	00C9

l1288_0206:
	and	word ptr [bp+FF6A],EF
	or	word ptr [bp+FF6A],0080
	mov	ch,05
	jmp	00C9

l1288_0216:
	mov	bh,08
	jmp	0224

l1288_021A:
	mov	bh,0A
	jmp	0229

l1288_021E:
	mov	bh,10
	mov	bl,E9
	add	bl,dl

l1288_0224:
	mov	byte ptr [bp+FF75],00

l1288_0229:
	mov	byte ptr [bp+FF6F],00
	mov	[bp+FF6E],dl
	mov	di,[bp+06]
	mov	ax,[di]
	xor	dx,dx
	jmp	024C

l1288_023B:
	mov	bh,0A
	mov	byte ptr [bp+FF6F],01
	mov	[bp+FF6E],dl
	mov	di,[bp+06]
	mov	ax,[di]
	cwd	

l1288_024C:
	inc	di
	inc	di
	mov	[bp+08],si
	test	word ptr [bp+FF6A],0010
	jz	025D

l1288_0259:
	mov	dx,[di]
	inc	di
	inc	di

l1288_025D:
	mov	[bp+06],di
	lea	di,[bp+FF7B]
	or	ax,ax
	jnz	029B

l1288_0268:
	or	dx,dx
	jnz	029B

l1288_026C:
	cmp	word ptr [bp+FF72],00
	jnz	02A0

l1288_0273:
	mov	di,[bp+FF6C]
	mov	cx,[bp+FF70]
	jcxz	0298

l1288_027D:
	cmp	cx,FF
	jz	0298

l1288_0282:
	mov	ax,[bp+FF6A]
	and	ax,0008
	jz	028F

l1288_028B:
	mov	dl,30
	jmp	0291

l1288_028F:
	mov	dl,20

l1288_0291:
	mov	al,dl
	call	004C
	loop	0291

l1288_0298:
	jmp	0084

l1288_029B:
	or	word ptr [bp+FF6A],04

l1288_02A0:
	push	dx
	push	ax
	push	di
	mov	al,bh
	cbw	
	push	ax
	mov	al,[bp+FF6F]
	push	ax
	push	bx
	call	far 1239:0003
	push	ss
	pop	es
	mov	dx,[bp+FF72]
	or	dx,dx
	jg	02BF

l1288_02BC:
	jmp	03D5

l1288_02BF:
	jmp	03E5

l1288_02C2:
	mov	[bp+FF6E],dl
	mov	[bp+08],si
	lea	di,[bp+FF7A]
	mov	bx,[bp+06]
	push	word ptr [bx]
	inc	bx
	inc	bx
	mov	[bp+06],bx
	test	word ptr [bp+FF6A],0020
	jz	02EE

l1288_02DF:
	push	word ptr [bx]
	inc	bx
	inc	bx
	mov	[bp+06],bx
	push	ss
	pop	es
	call	0000
	mov	al,3A
	stosb	

l1288_02EE:
	push	ss
	pop	es
	call	0000
	mov	byte ptr [di],00
	mov	byte ptr [bp+FF6F],00
	and	word ptr [bp+FF6A],FB
	lea	cx,[bp+FF7A]
	sub	di,cx
	xchg	di,cx
	mov	dx,[bp+FF72]
	cmp	dx,cx
	jg	0312

l1288_0310:
	mov	dx,cx

l1288_0312:
	jmp	03D5

l1288_0315:
	mov	[bp+08],si
	mov	[bp+FF6E],dl
	mov	di,[bp+06]
	mov	ax,[di]
	add	word ptr [bp+06],02
	push	ss
	pop	es
	lea	di,[bp+FF7B]
	xor	ah,ah
	mov	[di],ax
	mov	cx,0001
	jmp	040F

l1288_0335:
	mov	[bp+08],si
	mov	[bp+FF6E],dl
	mov	di,[bp+06]
	test	word ptr [bp+FF6A],0020
	jnz	0353

l1288_0347:
	mov	di,[di]
	add	word ptr [bp+06],02
	push	ds
	pop	es
	or	di,di
	jmp	035D

l1288_0353:
	les	di,[di]
	add	word ptr [bp+06],04
	mov	ax,es
	or	ax,di

l1288_035D:
	jnz	0364

l1288_035F:
	push	ds
	pop	es
	mov	di,138C

l1288_0364:
	call	003F
	cmp	cx,[bp+FF72]
	jbe	0371

l1288_036D:
	mov	cx,[bp+FF72]

l1288_0371:
	jmp	040F

l1288_0374:
	mov	[bp+08],si
	mov	[bp+FF6E],dl
	mov	di,[bp+06]
	mov	cx,[bp+FF72]
	or	cx,cx
	jge	0389

l1288_0386:
	mov	cx,0006

l1288_0389:
	push	di
	push	cx
	lea	bx,[bp+FF7B]
	push	bx
	push	dx
	mov	ax,0001
	and	ax,[bp+FF6A]
	push	ax
	mov	ax,[bp+FF6A]
	test	ax,0080
	jz	03AC

l1288_03A2:
	mov	ax,0002
	mov	word ptr [bp-02],0004
	jmp	03C3

l1288_03AC:
	test	ax,0100
	jz	03BB

l1288_03B1:
	mov	ax,0008
	mov	word ptr [bp-02],000A
	jmp	03C3

l1288_03BB:
	mov	word ptr [bp-02],0008
	mov	ax,0006

l1288_03C3:
	push	ax
	call	far 0800:4376
	mov	ax,[bp-02]
	add	[bp+06],ax
	push	ss
	pop	es
	lea	di,[bp+FF7B]

l1288_03D5:
	test	word ptr [bp+FF6A],0008
	jz	03F0

l1288_03DD:
	mov	dx,[bp+FF70]
	or	dx,dx
	jle	03F0

l1288_03E5:
	call	003F
	sub	dx,cx
	jle	03F0

l1288_03EC:
	mov	[bp+FF76],dx

l1288_03F0:
	mov	al,[bp+FF75]
	or	al,al
	jz	040C

l1288_03F8:
	cmp	byte ptr es:[di],2D
	jz	040C

l1288_03FE:
	sub	word ptr [bp+FF76],01
	adc	word ptr [bp+FF76],00
	dec	di
	mov	es:[di],al

l1288_040C:
	call	003F

l1288_040F:
	mov	si,di
	mov	di,[bp+FF6C]
	mov	bx,[bp+FF70]
	mov	ax,0005
	and	ax,[bp+FF6A]
	cmp	ax,0005
	jnz	043B

l1288_0425:
	mov	ah,[bp+FF6E]
	cmp	ah,6F
	jnz	043E

l1288_042E:
	cmp	word ptr [bp+FF76],00
	jg	043B

l1288_0435:
	mov	word ptr [bp+FF76],0001

l1288_043B:
	jmp	045C
1288:043D                                        90                    . 

l1288_043E:
	cmp	ah,78
	jz	0448

l1288_0443:
	cmp	ah,58
	jnz	045C

l1288_0448:
	or	word ptr [bp+FF6A],40
	dec	bx
	dec	bx
	sub	word ptr [bp+FF76],02
	jge	045C

l1288_0456:
	mov	word ptr [bp+FF76],0000

l1288_045C:
	add	cx,[bp+FF76]
	test	word ptr [bp+FF6A],0002
	jnz	0474

l1288_0468:
	jmp	0470

l1288_046A:
	mov	al,20
	call	004C
	dec	bx

l1288_0470:
	cmp	bx,cx
	jg	046A

l1288_0474:
	test	word ptr [bp+FF6A],0040
	jz	0488

l1288_047C:
	mov	al,30
	call	004C
	mov	al,[bp+FF6E]
	call	004C

l1288_0488:
	mov	dx,[bp+FF76]
	or	dx,dx
	jle	04B7

l1288_0490:
	sub	cx,dx
	sub	bx,dx
	mov	al,es:[si]
	cmp	al,2D
	jz	04A3

l1288_049B:
	cmp	al,20
	jz	04A3

l1288_049F:
	cmp	al,2B
	jnz	04AA

l1288_04A3:
	lodsb	
	call	004C
	dec	cx
	dec	bx

l1288_04AA:
	xchg	dx,cx
	jcxz	04B5

l1288_04AE:
	mov	al,30
	call	004C
	loop	04AE

l1288_04B5:
	xchg	dx,cx

l1288_04B7:
	jcxz	04CA

l1288_04B9:
	sub	bx,cx

l1288_04BB:
	lodsb	
	mov	[di],al
	inc	di
	dec	byte ptr [bp-53]
	jg	04C8

l1288_04C5:
	call	0054

l1288_04C8:
	loop	04BB

l1288_04CA:
	or	bx,bx
	jle	04D7

l1288_04CE:
	mov	cx,bx

l1288_04D0:
	mov	al,20
	call	004C
	loop	04D0

l1288_04D7:
	jmp	0084

l1288_04DA:
	mov	[bp+08],si
	mov	di,[bp+06]
	test	word ptr [bp+FF6A],0020
	jnz	04F2

l1288_04E8:
	mov	di,[di]
	add	word ptr [bp+06],02
	push	ds
	pop	es
	jmp	04F8

l1288_04F2:
	les	di,[di]
	add	word ptr [bp+06],04

l1288_04F8:
	mov	ax,0050
	sub	al,[bp-53]
	add	ax,[bp-56]
	mov	es:[di],ax
	jmp	0080

l1288_0507:
	mov	si,[bp+FF78]
	mov	di,[bp+FF6C]
	mov	al,25

l1288_0511:
	call	004C
	lodsb	
	or	al,al
	jnz	0511

l1288_0519:
	cmp	byte ptr [bp-53],50
	jge	0522

l1288_051F:
	call	0054

l1288_0522:
	pop	es
	mov	ax,[bp-56]
	jmp	0528

l1288_0528:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	000A
;;; Segment 12DB (12DB:0000)

fn12DB_0000()
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,[bp+06]
	cmp	word ptr [79FC],00
	jz	002B

l12DB_000F:
	mov	bx,[79FC]
	mov	di,[bx+06]
	mov	bx,[79FC]
	mov	[bx+06],si
	mov	[di+04],si
	mov	[si+06],di
	mov	ax,[79FC]
	mov	[si+04],ax
	jmp	0035

l12DB_002B:
	mov	[79FC],si
	mov	[si+04],si
	mov	[si+06],si

l12DB_0035:
	pop	di
	pop	si
	pop	bp
	retf	

fn12DB_0039()
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	push	di
	mov	si,[bp+08]
	mov	di,[bp+06]
	mov	ax,[si]
	add	[di],ax
	mov	ax,[79FA]
	cmp	ax,si
	jnz	0058

l12DB_0052:
	mov	[79FA],di
	jmp	0065

l12DB_0058:
	mov	ax,[si]
	add	ax,si
	mov	[bp-02],ax
	mov	bx,[bp-02]
	mov	[bx+02],di

l12DB_0065:
	push	si
	call	far 1192:000C
	pop	cx
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	

fn12DB_0072()
	push	si
	mov	ax,[79FE]
	cmp	ax,[79FA]
	jnz	0090

l12DB_007C:
	push	word ptr [79FE]
	call	far 11A8:0059
	pop	cx
	xor	ax,ax
	mov	[79FA],ax
	mov	[79FE],ax
	jmp	00D1

l12DB_0090:
	mov	bx,[79FA]
	mov	si,[bx+02]
	test	word ptr [si],0001
	jnz	00C3

l12DB_009D:
	push	si
	call	far 1192:000C
	pop	cx
	cmp	si,[79FE]
	jnz	00B4

l12DB_00AA:
	xor	ax,ax
	mov	[79FA],ax
	mov	[79FE],ax
	jmp	00BA

l12DB_00B4:
	mov	ax,[si+02]
	mov	[79FA],ax

l12DB_00BA:
	push	si
	call	far 11A8:0059
	pop	cx
	jmp	00D1

l12DB_00C3:
	push	word ptr [79FA]
	call	far 11A8:0059
	pop	cx
	mov	[79FA],si

l12DB_00D1:
	pop	si
	retf	

fn12DB_00D3()
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	push	di
	mov	si,[bp+06]
	dec	word ptr [si]
	mov	ax,[si]
	add	ax,si
	mov	[bp-02],ax
	mov	di,[si+02]
	test	word ptr [di],0001
	jnz	0104

l12DB_00F0:
	cmp	si,[79FE]
	jz	0104

l12DB_00F6:
	mov	ax,[si]
	add	[di],ax
	mov	bx,[bp-02]
	mov	[bx+02],di
	mov	si,di
	jmp	010A

l12DB_0104:
	push	si
	push	cs
	call	0000
	pop	cx

l12DB_010A:
	mov	bx,[bp-02]
	test	word ptr [bx],0001
	jnz	011D

l12DB_0113:
	push	word ptr [bp-02]
	push	si
	push	cs
	call	0039
	pop	cx
	pop	cx

l12DB_011D:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	

fn12DB_0123()
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+06]
	or	si,si
	jnz	0130

l12DB_012E:
	jmp	0149

l12DB_0130:
	mov	ax,si
	add	ax,FFFC
	mov	si,ax
	cmp	si,[79FA]
	jnz	0143

l12DB_013D:
	push	cs
	call	0072
;;; Segment 12EF (12EF:0000)
12EF:0000 FF EB 06                                        ...            

l12DB_0143:
	push	si
	push	cs
	call	00D3
	pop	cx

l12DB_0149:
	pop	si
	pop	bp
	retf	
12DB:014C                                     55 8B EC B8             U...
12DB:0150 65 12 50 B8 70 01 50 FF 76 06 FF 76 08 8D 46 0A e.P.p.P.v..v..F.
;;; Segment 12F1 (12F1:0000)
12F1:0000 50 9A 2B 00 88 12 EB 00 5D CB 55 8B EC 56 57 8B P.+.....].U..VW.
12F1:0010 76 06 EB 05 8B C7 88 04 46 FF 0E E8 11 7C 11 FF v.......F....|..
12F1:0020 06 F2 11 8B 1E F2 11 8A 47 FF B4 00 8B F8 EB 0C ........G.......
12F1:0030 B8 E8 11 50 9A 8A 00 DE 11 59 8B F8 8B C7 3D FF ...P.....Y....=.
12F1:0040 FF 74 05 83 FF 0A 75 CC 83 FF FF 75 09 3B 76 06 .t....u....u.;v.
12F1:0050 75 04 33 C0 EB 14 C6 04 00 F7 06 EA 11 10 00 74 u.3............t
;;; Segment 12F7 (12F7:0000)
12F7:0000 04 33 C0 EB 03 8B 46 06 EB 00 5F 5E 5D CB 55 8B .3....F..._^].U.
12F7:0010 EC 83 EC 08 C6 46 FD 00 9A 00 00 F9 13 B4 00 89 .....F..........
12F7:0020 46 F8 9A 00 00 F9 13 B1 08 D3 E8 B4 00 89 46 FA F.............F.
12F7:0030 E9 F8 00 8B 5E 0A FF 46 0A 8A 07 88 46 FD B4 00 ....^..F....F...
12F7:0040 2D 07 00 3D 06 00 77 46 8B D8 D1 E3 2E FF A7 51 -..=..wF.......Q
12F7:0050 00 5F 00 70 00 8E 00 89 00 8E 00 8E 00 7F 00 B4 ._.p............
12F7:0060 0E B0 07 9A BC 43 00 08 8A 46 FD B4 00 E9 DE 00 .....C...F......
12F7:0070 A0 04 14 B4 00 3B 46 F8 7D 03 FF 4E F8 EB 6F A0 .....;F.}..N..o.
12F7:0080 04 14 B4 00 89 46 F8 EB 65 FF 46 FA EB 60 80 3E .....F..e.F..`.>
12F7:0090 0D 14 00 75 32 83 3E 13 14 00 74 2B 8A 26 08 14 ...u2.>...t+.&..
12F7:00A0 8A 46 FD 89 46 FE 8B 46 F8 40 50 8B 46 FA 40 50 .F..F..F.@P.F.@P
12F7:00B0 9A 0F 00 EE 13 52 50 16 8D 46 FE 50 B8 01 00 50 .....RP..F.P...P
12F7:00C0 9A 34 00 EE 13 EB 22 8A 56 F8 8A 76 FA B4 02 B7 .4....".V..v....
12F7:00D0 00 9A BC 43 00 08 8A 1E 08 14 8A 46 FD B4 09 B7 ...C.......F....
12F7:00E0 00 B9 01 00 9A BC 43 00 08 FF 46 F8 EB 00 A0 06 ......C...F.....
12F7:00F0 14 B4 00 3B 46 F8 7D 0B A0 04 14 B4 00 89 46 F8 ...;F.}.......F.
12F7:0100 FF 46 FA A0 07 14 B4 00 3B 46 FA 7D 1E B0 06 50 .F......;F.}...P
12F7:0110 FF 36 04 14 FF 36 05 14 FF 36 06 14 FF 36 07 14 .6...6...6...6..
12F7:0120 B0 01 50 9A 31 00 4A 13 FF 4E FA 8B 46 08 FF 4E ..P.1.J..N..F..N
12F7:0130 08 0B C0 74 03 E9 FB FE 8A 56 F8 8A 76 FA B4 02 ...t.....V..v...
12F7:0140 B7 00 9A BC 43 00 08 8A 46 FD B4 00 EB 00 8B E5 ....C...F.......
12F7:0150 5D CA 06 00 55 8B EC 0E B8 0E 00 50 33 C0 50 FF ]...U......P3.P.
;;; Segment 130D (130D:0000)
130D:0000 76 06 8D 46 08 50 9A 2B 00 88 12 EB 00 5D CB    v..F.P.+.....].

fn130D_000F()
	cmp	byte ptr [141C],00
	jz	0020

l130D_0016:
	mov	byte ptr [141C],00
	mov	al,[141D]
	jmp	0025

l130D_0020:
	mov	ax,0700
	int	21

l130D_0025:
	mov	ah,00
	jmp	0029

l130D_0029:
	retf	
130D:002A                               56 80 3E 1C 14 00           V.>...
130D:0030 74 08 0E E8 D9 FF 8B F0 EB 0F 0E E8 D1 FF 8B F0 t...............
130D:0040 8B C6 50 9A 0E 00 45 13 59 8B C6 EB 00 5E CB 55 ..P...E.Y....^.U
130D:0050 8B EC 80 3E 1C 14 00 74 05 B8 FF FF EB 0D C6 06 ...>...t........
;;; Segment 1313 (1313:0000)
1313:0000 1C 14 01 8B 46 06 A2 1D 14 EB 00 5D CB          ....F......].  

fn1313_000D()
	push	bp
	mov	bp,sp
;;; Segment 1314 (1314:0000)
1314:0000 FF 76 06 9A 23 01 DB 12 59 5D CB                .v..#...Y].    

fn1314_000B()
	push	bp
	mov	bp,sp
	push	word ptr [bp+06]
;;; Segment 1315 (1315:0000)
1315:0000 06 9A EF 00 92 11 59 8C DA EB 00                ......Y....    

l1314_001B:
	pop	bp
	retf	

fn1315_000D()
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	bp
	mov	si,[bp+06]
	cld	
	sub	ax,ax
	cwd	
	mov	cx,000A
	mov	bh,00
	mov	di,10E7

l1315_0022:
	mov	bl,[si]
	inc	si
	test	byte ptr [bx+di],01
	jnz	0022

l1315_002A:
	mov	bp,0000
	cmp	bl,2B
	jz	0038

l1315_0032:
	cmp	bl,2D
	jnz	003B

l1315_0037:
	inc	bp

l1315_0038:
	mov	bl,[si]
	inc	si

l1315_003B:
	cmp	bl,39
	ja	006E

l1315_0040:
	sub	bl,30
	jc	006E

l1315_0045:
	mul	cx
	add	ax,bx
	adc	dl,dh
	jz	0038

l1315_004D:
	jmp	0061

l1315_004F:
	mov	di,dx
	mov	cx,000A
	mul	cx
	xchg	ax,di
	xchg	cx,dx
	mul	dx
	xchg	ax,dx
	xchg	ax,di
	add	ax,bx
	adc	dx,cx

l1315_0061:
	mov	bl,[si]
	inc	si
	cmp	bl,39
	ja	006E

l1315_0069:
	sub	bl,30
	jnc	004F

l1315_006E:
	dec	bp
	jl	0078

l1315_0071:
	neg	dx
	neg	ax
	sbb	dx,00

l1315_0078:
	pop	bp
	jmp	007B

l1315_007B:
	pop	di
	pop	si
	pop	bp
	retf	
1315:007F                                              55                U
1315:0080 8B EC FF 76 06 0E E8 84 FF 59 EB 00 5D CB 00 00 ...v.....Y..]...
;;; Segment 131E (131E:0000)
131E:0000 00 00                                           ..             

fn131E_0002()
	dec	sp
	dec	sp
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	push	es
	mov	cx,[bp+08]
	mov	ax,cs:[0000]
	or	ax,ax
	jnz	0039

l131E_0016:
	mov	ax,0040
	mov	es,ax
	mov	bx,es:[006C]
	call	005D
	sub	bx,es:[006C]
	neg	bx
	mov	ax,0037
	mul	bx
	cmp	cx,ax
	jbe	0051

l131E_0033:
	sub	cx,ax
	mov	ax,cs:[0000]

l131E_0039:
	xor	bx,bx
	mov	es,bx
	mov	dl,es:[bx]
	jcxz	0051

l131E_0042:
	mov	si,cx
	mov	cx,ax

l131E_0046:
	cmp	dl,es:[bx]
	jnz	004B

l131E_004B:
	loop	0046

l131E_004D:
	mov	cx,si
	loop	0042

l131E_0051:
	mov	ax,cs:[0000]
	pop	es
	pop	ds
	pop	di
	pop	si
	pop	bp
	inc	sp
	inc	sp
	retf	

fn131E_005D()
	push	bx
	push	cx
	push	dx
	push	es
	mov	ax,0040
	mov	es,ax
	mov	bx,006C
	mov	al,es:[bx]
	mov	cx,FFFF

l131E_006F:
	mov	dl,es:[bx]
	cmp	al,dl
	jz	006F

l131E_0076:
	cmp	dl,es:[bx]
	jnz	007D

l131E_007B:
	loop	0076

l131E_007D:
	neg	cx
	dec	cx
	mov	ax,0037
	xchg	ax,cx
	xor	dx,dx
	div	cx
	mov	cs:[0000],ax

l131E_008C:
	mov	al,es:[bx]
	mov	cx,FFFF

l131E_0092:
	mov	dl,es:[bx]
	cmp	al,dl
	jz	0092

l131E_0099:
	push	bx
	push	dx
	mov	ax,0037
	push	ax
	call	far 131E:0002
	pop	ax
	pop	dx
	pop	bx
	cmp	dl,es:[bx]
	jz	00B3

l131E_00AC:
	dec	word ptr cs:[0000]
;;; Segment 1329 (1329:0000)
1329:0000 00 EB D9                                        ...            

l131E_00B3:
	pop	es
	pop	dx
	pop	cx
	pop	bx
	ret	

fn1329_0008()
	push	bp
	mov	bp,sp
	mov	ah,2A
	int	21
	mov	bx,[bp+06]
	mov	[bx],cx
	mov	bx,[bp+06]
	mov	[bx+02],dx
	pop	bp
	retf	

fn1329_001C()
	push	bp
	mov	bp,sp
	mov	ah,2C
	int	21
	mov	bx,[bp+06]
	mov	[bx],cx
	mov	bx,[bp+06]
	mov	[bx+02],dx
	pop	bp
	retf	
;;; Segment 132C (132C:0000)

fn132C_0000()
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	push	di
	mov	di,[bp+06]
	push	ds
	pop	es
	or	di,di
	jz	002B

l132C_0011:
	mov	al,00
	mov	ah,[di]
	mov	cx,FFFF
	cld	

l132C_0019:
	repne	
	scasb	

l132C_001B:
	not	cx
	dec	cx
	jz	002B

l132C_0020:
	mov	di,[0088]
	or	di,di
	mov	[bp-02],di
	jnz	0036

l132C_002B:
	xor	ax,ax
	jmp	005B

l132C_002F:
	add	word ptr [bp-02],02
	mov	di,[bp-02]

l132C_0036:
	mov	di,[di]
	or	di,di
	jz	002B

l132C_003C:
	mov	al,[di]
	or	al,al
	jz	002B

l132C_0042:
	cmp	ah,al
	jnz	002F

l132C_0046:
	mov	bx,cx
	cmp	byte ptr [bx+di],3D
	jnz	002F

l132C_004D:
	mov	si,[bp+06]

l132C_0050:
	rep	
	cmpsb	

l132C_0052:
	xchg	bx,cx
	jnz	002F

l132C_0056:
	inc	di
	mov	ax,di
	jmp	005B

l132C_005B:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
;;; Segment 1332 (1332:0000)
1332:0000 CB                                              .              
132C:0061    55 8B EC 56 57 FF 76 06 FF 76 08 FF 76 0A FF  U..VW.v..v..v..
132C:0070 76 0C 9A 86 01 64 13 0B C0 75 04 33 C0 EB 33 8B v....d...u.3..3.
132C:0080 7E 0A 2B 7E 06 47 8B 76 08 EB 1D 1E FF 76 0E FF ~.+~.G.v.....v..
132C:0090 76 06 56 9A 0F 00 EE 13 52 50 57 9A 49 01 64 13 v.V.....RPW.I.d.
132C:00A0 8B C7 D1 E0 01 46 0E 46 3B 76 0C 7E DE B8 01 00 .....F.F;v.~....
132C:00B0 EB 00 5F 5E 5D CB 55 8B EC 56 57 8B 7E 0A 2B 7E .._^].U..VW.~.+~
132C:00C0 06 47 8B 76 08 EB 1D FF 76 06 56 9A 0F 00 EE 13 .G.v....v.V.....
132C:00D0 52 50 1E FF 76 0E 57 9A 49 01 64 13 8B C7 D1 E0 RP..v.W.I.d.....
132C:00E0 01 46 0E 46 3B 76 0C 7E DE B8 01 00 EB 00 5F 5E .F.F;v.~......_^
;;; Segment 133B (133B:0000)
133B:0000 5D CB 55 8B EC 83 EC 06 56 57 8B 76 08 FF 76 06 ].U.....VW.v..v.
133B:0010 56 FF 76 0A FF 76 0C 9A 86 01 64 13 0B C0 74 22 V.v..v....d...t"
133B:0020 FF 76 0E FF 76 10 8B 46 0A 2B 46 06 03 46 0E 50 .v..v..F.+F..F.P
133B:0030 8B 46 0C 2B C6 03 46 10 50 9A 86 01 64 13 0B C0 .F.+..F.P...d...
133B:0040 75 04 33 C0 EB 62 89 76 FA 8B 46 0C 89 46 FC C7 u.3..b.v..F..F..
133B:0050 46 FE 01 00 3B 76 10 7D 0E 8B 46 0C 89 46 FA 89 F...;v.}..F..F..
133B:0060 76 FC C7 46 FE FF FF 8B 7E FA EB 2D FF 76 0E 8B v..F....~..-.v..
133B:0070 C7 2B C6 03 46 10 50 9A 0F 00 EE 13 52 50 FF 76 .+..F.P.....RP.v
133B:0080 06 57 9A 0F 00 EE 13 52 50 8B 46 0A 2B 46 06 40 .W.....RP.F.+F.@
133B:0090 50 9A 49 01 64 13 03 7E FE 8B 46 FC 03 46 FE 3B P.I.d..~..F..F.;
;;; Segment 1345 (1345:0000)
1345:0000 C7 75 C9 B8 01 00 EB 00 5F 5E 8B E5 5D CB 55 8B .u......_^..].U.
1345:0010 EC 8D 46 06 50 B8 01 00 50 33 C0 50 9A 0E 00 F7 ..F.P...P3.P....
;;; Segment 1347 (1347:0000)
1347:0000 12 EB 00 5D CB                                  ...].          

fn1347_0005()
	push	bp
	mov	bp,sp
	mov	ax,[bp+06]
	xor	dx,dx
	mov	[1420],dx
	mov	[141E],ax
	pop	bp
	retf	

fn1347_0016()
	mov	dx,[1420]
	mov	ax,[141E]
	mov	cx,015A
	mov	bx,4E35
	call	far 0800:433A
	add	ax,0001
	adc	dx,00
	mov	[1420],dx
;;; Segment 134A (134A:0000)
134A:0000 20 14 A3 1E 14 A1 20 14 25 FF 7F EB 00           ..... .%....  

l1347_003D:
	retf	
1347:003E                                           55 8B               U.
1347:0040 EC 8A 2E 08 14 B1 20 EB 0C 8B 5E 08 89 0F 83 46 ...... ...^....F
1347:0050 08 02 FF 46 06 8B 46 06 3B 46 04 7E EC 5D C2 06 ...F..F.;F.~.]..
1347:0060 00 55 8B EC 81 EC A0 00 80 3E 0D 14 00 74 03 E9 .U.......>...t..
1347:0070 44 01 83 3E 13 14 00 75 03 E9 3A 01 80 7E 06 01 D..>...u..:..~..
1347:0080 74 03 E9 31 01 FE 46 0E FE 46 0C FE 46 0A FE 46 t..1..F..F..F..F
1347:0090 08 80 7E 10 06 74 03 E9 8E 00 8A 46 0C B4 00 50 ..~..t.....F...P
1347:00A0 8A 46 0E B4 00 50 8A 46 08 B4 00 50 8A 46 0A B4 .F...P.F...P.F..
1347:00B0 00 50 8A 46 0C B4 00 40 50 8A 46 0E B4 00 50 9A .P.F...@P.F...P.
1347:00C0 02 00 3B 13 83 C4 0C 8D 86 60 FF 50 8A 46 08 B4 ..;......`.P.F..
1347:00D0 00 50 8A 46 0E B4 00 50 8A 46 08 B4 00 50 8A 46 .P.F...P.F...P.F
1347:00E0 0E B4 00 50 9A 01 00 32 13 83 C4 0A 8D 86 60 FF ...P...2......`.
1347:00F0 50 8A 46 0E B4 00 50 8A 46 0A B4 00 50 E8 3E FF P.F...P.F...P.>.
1347:0100 8D 86 60 FF 50 8A 46 08 B4 00 50 8A 46 0A B4 00 ..`.P.F...P.F...
1347:0110 50 8A 46 08 B4 00 50 8A 46 0E B4 00 50 9A 56 00 P.F...P.F...P.V.
1347:0120 32 13 83 C4 0A E9 8C 00 8A 46 0C B4 00 40 50 8A 2........F...@P.
1347:0130 46 0E B4 00 50 8A 46 08 B4 00 48 50 8A 46 0A B4 F...P.F...HP.F..
1347:0140 00 50 8A 46 0C B4 00 50 8A 46 0E B4 00 50 9A 02 .P.F...P.F...P..
1347:0150 00 3B 13 83 C4 0C 8D 86 60 FF 50 8A 46 0C B4 00 .;......`.P.F...
1347:0160 50 8A 46 0E B4 00 50 8A 46 0C B4 00 50 8A 46 0E P.F...P.F...P.F.
1347:0170 B4 00 50 9A 01 00 32 13 83 C4 0A 8D 86 60 FF 50 ..P...2......`.P
1347:0180 8A 46 0E B4 00 50 8A 46 0A B4 00 50 E8 AF FE 8D .F...P.F...P....
1347:0190 86 60 FF 50 8A 46 0C B4 00 50 8A 46 0A B4 00 50 .`.P.F...P.F...P
1347:01A0 8A 46 0C B4 00 50 8A 46 0E B4 00 50 9A 56 00 32 .F...P.F...P.V.2
1347:01B0 13 83 C4 0A EB 1B 8A 3E 08 14 8A 66 10 8A 46 06 .......>...f..F.
1347:01C0 8A 6E 0C 8A 4E 0E 8A 76 08 8A 56 0A 9A BC 43 00 .n..N..v..V...C.
;;; Segment 1364 (1364:0000)
1364:0000 08 8B E5 5D CA 0C 00 55 8B EC 83 EC 02 56 8B 76 ...]...U.....V.v
1364:0010 04 D1 EE 8B C6 8A 16 0C 14 B6 00 8B DA 33 D2 F7 .............3..
1364:0020 F3 88 46 FE 8A 46 FE B4 00 8A 16 0C 14 B6 00 F7 ..F..F..........
1364:0030 E2 8B D6 2A D0 88 56 FF 8A 66 FE 8A 46 FF EB 00 ...*..V..f..F...
1364:0040 5E 8B E5 5D C2 04 00 55 8B EC 8B 5E 06 8B 17 8B ^..]...U...^....
1364:0050 5E 04 3B 17 74 0E B7 00 B4 02 9A BC 43 00 08 8B ^.;.t.......C...
1364:0060 5E 04 89 17 FE C2 8A C2 3A 06 0C 14 72 04 FE C6 ^.......:...r...
1364:0070 B2 00 8B 5E 06 89 17 5D C2 04 00 55 8B EC 83 EC ...^...]...U....
1364:0080 0A 56 57 9A 00 00 F9 13 8B F8 8B C7 89 46 FA 8B .VW..........F..
1364:0090 46 0C 3B 06 11 14 75 05 B8 01 00 EB 02 33 C0 89 F.;...u......3..
1364:00A0 46 FC 0B C0 74 0C FF 76 0C FF 76 0A E8 58 FF 89 F...t..v..v..X..
1364:00B0 46 F6 8B 46 08 3B 06 11 14 75 05 B8 01 00 EB 02 F..F.;...u......
1364:00C0 33 C0 89 46 FE 0B C0 74 0C FF 76 08 FF 76 06 E8 3..F...t..v..v..
1364:00D0 35 FF 89 46 F8 EB 55 83 7E FE 00 74 18 8D 46 F8 5..F..U.~..t..F.
1364:00E0 50 8D 46 FA 50 E8 5F FF B7 00 B4 08 9A BC 43 00 P.F.P._.......C.
1364:00F0 08 8B F0 EB 0A C4 5E 06 26 8B 37 83 46 06 02 83 ......^.&.7.F...
1364:0100 7E FC 00 74 1D 8D 46 F6 50 8D 46 FA 50 E8 37 FF ~..t..F.P.F.P.7.
1364:0110 8B C6 8A DC B9 01 00 B7 00 B4 09 9A BC 43 00 08 .............C..
1364:0120 EB 0A C4 5E 0A 26 89 37 83 46 0A 02 8B 46 04 FF ...^.&.7.F...F..
1364:0130 4E 04 0B C0 75 A1 8B D7 B7 00 B4 02 9A BC 43 00 N...u.........C.
1364:0140 08 5F 5E 8B E5 5D C2 0A 00 55 8B EC 80 3E 0D 14 ._^..]...U...>..
1364:0150 00 75 1D 83 3E 13 14 00 74 16 FF 76 0E FF 76 0C .u..>...t..v..v.
1364:0160 FF 76 0A FF 76 08 FF 76 06 9A 34 00 EE 13 EB 12 .v..v..v..4.....
1364:0170 FF 76 0E FF 76 0C FF 76 0A FF 76 08 FF 76 06 E8 .v..v..v..v..v..
1364:0180 F9 FE 5D CA 0A 00 55 8B EC A0 0C 14 B4 00 8B C8 ..]...U.........
1364:0190 A0 0B 14 B4 00 8B D0 8B 46 0C 3B C1 77 2A 8B 46 ........F.;.w*.F
1364:01A0 08 3B C1 77 23 8B 46 0C 3B 46 08 7F 1B 8B 46 0A .;.w#.F.;F....F.
1364:01B0 3B C2 77 14 8B 46 06 3B C2 77 0D 8B 46 0A 3B 46 ;.w..F.;.w..F.;F
1364:01C0 06 7F 05 B8 01 00 EB 02 33 C0 EB 00 5D CA 08 00 ........3...]...
;;; Segment 1381 (1381:0000)
1381:0000 55 8B EC 56 B4 2B 8B 76 06 8B 0C 8B 54 02 CD 21 U..V.+.v....T..!
1381:0010 5E 5D CB 55 8B EC 56 B4 2D 8B 76 06 8B 0C 8B 54 ^].U..V.-.v....T
;;; Segment 1383 (1383:0000)
1383:0000 02 CD 21 5E 5D CB                               ..!^].         

fn1383_0006()
	push	bp
	mov	bp,sp
	mov	bx,[bp+06]
	mov	ax,34DD
	mov	dx,0012
	cmp	dx,bx
	jnc	0030

l1383_0016:
	div	bx
	mov	bx,ax
	in	al,61
	test	al,03
	jnz	0028

l1383_0020:
	or	al,03
	out	61,al
	mov	al,B6
	out	43,al

l1383_0028:
	mov	al,bl
	out	42,al
	mov	al,bh
	out	42,al
;;; Segment 1386 (1386:0000)

l1383_0030:
	pop	bp
	retf	

fn1383_0032()
	in	al,61
	and	al,FC
	out	61,al
	retf	
1383:0039                            55 8B EC FF 76 08 FF          U...v..
1383:0040 76 0A 8B 5E 06 FF 37 9A 02 00 4C 12 8B E5 8B 46 v..^..7...L....F
1383:0050 08 8B 5E 06 01 07 8B 1F C6 07 00 33 C0 EB 00 5D ..^........3...]
1383:0060 CA 06 00 55 8B EC 8B 5E 06 C6 07 00 0E B8 09 00 ...U...^........
1383:0070 50 8D 46 06 50 FF 76 08 8D 46 0A 50 9A 2B 00 88 P.F.P.v..F.P.+..
1383:0080 12 EB 00 5D CB 55 8B EC 8B 5E 06 C6 07 00 0E B8 ...].U...^......
1383:0090 09 00 50 8D 46 06 50 FF 76 08 FF 76 0A 9A 2B 00 ..P.F.P.v..v..+.
;;; Segment 138D (138D:0000)
138D:0000 88 12 EB 00 5D CB 55 8B EC 83 EC 08 8D 46 FC 50 ....].U......F.P
138D:0010 8D 46 F8 50 8B 5E 06 FF 77 02 FF 37 9A 36 01 98 .F.P.^..w..7.6..
138D:0020 13 83 C4 08 8D 46 F8 50 9A 00 00 81 13 59 8D 46 .....F.P.....Y.F
138D:0030 FC 50 9A 13 00 81 13 59 33 C0 EB 00 8B E5 5D CB .P.....Y3.....].

fn138D_0040()
	push	bp
	mov	bp,sp
	sub	sp,0C
	lea	ax,[bp-0C]
	push	ax
	call	far 1329:0008
	pop	cx
	lea	ax,[bp-08]
	push	ax
	call	far 1329:001C
	pop	cx
	lea	ax,[bp-08]
	push	ax
	lea	ax,[bp-0C]
	push	ax
	call	far 1398:000D
	pop	cx
	pop	cx
	mov	[bp-02],dx
	mov	[bp-04],ax
	cmp	word ptr [bp+06],00
	jz	0083

l138D_0075:
	mov	dx,[bp-02]
	mov	ax,[bp-04]
	mov	bx,[bp+06]
	mov	[bx+02],dx
;;; Segment 1395 (1395:0000)
1395:0000 02 89 07                                        ...            

l138D_0083:
	mov	dx,[bp-02]
	mov	ax,[bp-04]
	jmp	008B

l138D_008B:
	mov	sp,bp
	pop	bp
	retf	

fn1395_000F()
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	ax,ds
	mov	es,ax
	cld	
	mov	di,[bp+08]
	mov	si,di
	xor	al,al
	mov	bx,[bp+0A]
	mov	cx,bx

l1395_0025:
	repne	
	scasb	

l1395_0027:
	sub	bx,cx
	mov	di,[bp+06]
	xchg	bx,cx

l1395_002E:
	rep	
	movsb	
;;; Segment 1398 (1398:0000)

l1395_0030:
	mov	cx,bx

l1395_0032:
	rep	
	stosb	

l1395_0034:
	mov	ax,[bp+06]
	jmp	0039

l1395_0039:
	pop	di
	pop	si
	pop	bp
	retf	

fn1398_000D()
	push	bp
	mov	bp,sp
	sub	sp,06
	push	si
	push	di
	call	far 13CA:0000
	mov	dx,[145A]
	mov	ax,[1458]
	add	ax,A600
	adc	dx,12CE
	mov	[bp-04],dx
	mov	[bp-06],ax
	mov	bx,[bp+06]
	mov	si,[bx]
	add	si,F844
	mov	ax,si
	sar	ax,01
	sar	ax,01
	cwd	
	mov	cx,0786
	mov	bx,1F80
	call	far 0800:433A
	add	[bp-06],ax
	adc	[bp-04],dx
	mov	ax,si
	and	ax,0003
	cwd	
	mov	cx,01E1
	mov	bx,3380
	call	far 0800:433A
	add	[bp-06],ax
	adc	[bp-04],dx
	test	si,0003
	jz	0075

l1398_006C:
	add	word ptr [bp-06],5180
	adc	word ptr [bp-04],01

l1398_0075:
	xor	di,di
	mov	bx,[bp+06]
	mov	al,[bx+03]
	cbw	
	mov	si,ax
	dec	si
	jmp	008B

l1398_0083:
	dec	si
	mov	al,[si+1422]
	cbw	
	add	di,ax

l1398_008B:
	or	si,si
	jg	0083

l1398_008F:
	mov	bx,[bp+06]
	mov	al,[bx+02]
	cbw	
	dec	ax
	add	di,ax
	mov	bx,[bp+06]
	cmp	byte ptr [bx+03],02
	jle	00AC

l1398_00A2:
	mov	bx,[bp+06]
	test	word ptr [bx],0003
	jnz	00AC

l1398_00AB:
	inc	di

l1398_00AC:
	mov	ax,di
	mov	dx,0018
	mul	dx
	mov	bx,[bp+08]
	mov	dl,[bx+01]
	mov	dh,00
	add	ax,dx
	mov	[bp-02],ax
	cmp	word ptr [145C],00
	jz	00E9

l1398_00C7:
	mov	bx,[bp+08]
	mov	al,[bx+01]
	mov	ah,00
	push	ax
	push	di
	xor	ax,ax
	push	ax
	mov	bx,[bp+06]
	mov	ax,[bx]
	add	ax,F84E
	push	ax
	call	far 13CA:0175
	or	ax,ax
	jz	00E9

l1398_00E6:
	dec	word ptr [bp-02]

l1398_00E9:
	mov	ax,[bp-02]
	cwd	
	xor	cx,cx
	mov	bx,0E10
	call	far 0800:433A
	add	[bp-06],ax
	adc	[bp-04],dx
	mov	bx,[bp+08]
	mov	al,[bx]
	mov	ah,00
	cwd	
	xor	cx,cx
	mov	bx,003C
	call	far 0800:433A
	mov	bx,[bp+08]
	mov	bl,[bx+03]
	mov	bh,00
	push	dx
	push	ax
	mov	ax,bx
	cwd	
	pop	bx
	pop	cx
	add	bx,ax
	adc	cx,dx
	add	[bp-06],bx
	adc	[bp-04],cx
	mov	dx,[bp-04]
	mov	ax,[bp-06]
	jmp	0130

l1398_0130:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	retf	
1398:0136                   55 8B EC 56 57 8B 7E 0C 8B 76       U..VW.~..v
1398:0140 0A 9A 00 00 CA 13 8B 16 5A 14 A1 58 14 05 00 A6 ........Z..X....
1398:0150 81 D2 CE 12 29 46 06 19 56 08 C6 45 02 00 33 D2 ....)F..V..E..3.
1398:0160 B8 3C 00 52 50 FF 76 08 FF 76 06 9A B0 44 00 08 .<.RP.v..v...D..
1398:0170 88 45 03 33 D2 B8 3C 00 52 50 FF 76 08 FF 76 06 .E.3..<.RP.v..v.
1398:0180 9A A7 44 00 08 89 56 08 89 46 06 33 D2 B8 3C 00 ..D...V..F.3..<.
1398:0190 52 50 FF 76 08 FF 76 06 9A B0 44 00 08 88 05 33 RP.v..v...D....3
1398:01A0 D2 B8 3C 00 52 50 FF 76 08 FF 76 06 9A A7 44 00 ..<.RP.v..v...D.
1398:01B0 08 89 56 08 89 46 06 33 D2 B8 F8 88 52 50 FF 76 ..V..F.3....RP.v
1398:01C0 08 FF 76 06 9A A7 44 00 08 D1 E0 D1 E0 05 BC 07 ..v...D.........
1398:01D0 89 04 33 D2 B8 F8 88 52 50 FF 76 08 FF 76 06 9A ..3....RP.v..v..
1398:01E0 B0 44 00 08 89 56 08 89 46 06 83 7E 08 00 7C 40 .D...V..F..~..|@
1398:01F0 7F 07 81 7E 06 50 22 76 37 81 6E 06 50 22 83 5E ...~.P"v7.n.P".^
1398:0200 08 00 FF 04 33 D2 B8 38 22 52 50 FF 76 08 FF 76 ....3..8"RP.v..v
1398:0210 06 9A A7 44 00 08 01 04 33 D2 B8 38 22 52 50 FF ...D....3..8"RP.
1398:0220 76 08 FF 76 06 9A B0 44 00 08 89 56 08 89 46 06 v..v...D...V..F.
1398:0230 83 3E 5C 14 00 74 40 33 D2 B8 18 00 52 50 FF 76 .>\..t@3....RP.v
1398:0240 08 FF 76 06 9A B0 44 00 08 50 33 D2 B8 18 00 52 ..v...D..P3....R
1398:0250 50 FF 76 08 FF 76 06 9A A7 44 00 08 50 33 C0 50 P.v..v...D..P3.P
1398:0260 8B 04 05 4E F8 50 9A 75 01 CA 13 0B C0 74 08 83 ...N.P.u.....t..
1398:0270 46 06 01 83 56 08 00 33 D2 B8 18 00 52 50 FF 76 F...V..3....RP.v
1398:0280 08 FF 76 06 9A B0 44 00 08 88 45 01 33 D2 B8 18 ..v...D...E.3...
1398:0290 00 52 50 FF 76 08 FF 76 06 9A A7 44 00 08 89 56 .RP.v..v...D...V
1398:02A0 08 89 46 06 83 46 06 01 83 56 08 00 F7 04 03 00 ..F..F...V......
1398:02B0 75 2E 83 7E 08 00 7C 12 7F 06 83 7E 06 3C 76 0A u..~..|....~.<v.
1398:02C0 83 6E 06 01 83 5E 08 00 EB 16 83 7E 08 00 75 10 .n...^.....~..u.
1398:02D0 83 7E 06 3C 75 0A C6 44 03 02 C6 44 02 1D EB 3C .~.<u..D...D...<
1398:02E0 C6 44 03 00 EB 15 8A 44 03 98 8B D8 8A 87 22 14 .D.....D......".
1398:02F0 98 99 29 46 06 19 56 08 FE 44 03 8A 44 03 98 8B ..)F..V..D..D...
1398:0300 D8 8A 87 22 14 98 99 3B 56 08 7C DA 75 05 3B 46 ..."...;V.|.u.;F
1398:0310 06 72 D3 FE 44 03 8A 46 06 88 44 02 5F 5E 5D CB .r..D..F..D._^].
;;; Segment 13CA (13CA:0000)

fn13CA_0000()
	push	si
	push	di
	mov	ax,145E
	push	ax
	call	far 132C:0000
	pop	cx
	mov	di,ax
	mov	ax,di
	or	ax,ax
	jnz	0017

l13CA_0014:
	jmp	007C
13CA:0016                   90                                  .        

l13CA_0017:
	push	di
	call	far 1248:0001
	pop	cx
	cmp	ax,0004
	jc	007C

l13CA_0023:
	mov	al,[di]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],0C
	jz	007C

l13CA_002F:
	mov	al,[di+01]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],0C
	jz	007C

l13CA_003C:
	mov	al,[di+02]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],0C
	jz	007C

l13CA_0049:
	cmp	byte ptr [di+03],2D
	jz	0062

l13CA_004F:
	cmp	byte ptr [di+03],2B
	jz	0062

l13CA_0055:
	mov	al,[di+03]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],02
	jz	007C

l13CA_0062:
	mov	al,[di+03]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],02
	jnz	00AF

l13CA_006F:
	mov	al,[di+04]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],02
	jnz	00AF

l13CA_007C:
	mov	word ptr [145C],0001
	mov	word ptr [145A],0000
	mov	word ptr [1458],4650
	mov	ax,1461
	push	ax
	push	word ptr [1454]
	call	far 1249:000E
	pop	cx
	pop	cx
	mov	ax,1465
	push	ax
	push	word ptr [1456]
	call	far 1249:000E
	pop	cx
	pop	cx
	jmp	0172

l13CA_00AF:
	mov	ax,0004
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [1456]
	call	far 124E:002B
	add	sp,06
	mov	ax,0003
	push	ax
	push	di
	push	word ptr [1454]
	call	far 1395:000F
	add	sp,06
	mov	bx,[1454]
	mov	byte ptr [bx+03],00
	mov	ax,di
	add	ax,0003
	push	ax
	call	far 1315:000D
	pop	cx
	xor	cx,cx
	mov	bx,0E10
	call	far 0800:433A
	mov	[145A],dx
	mov	[1458],ax
	mov	word ptr [145C],0000
	mov	si,0003
	jmp	016B

l13CA_0103:
	mov	bx,si
	mov	al,[bx+di]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],0C
	jz	016A

l13CA_0111:
	mov	ax,di
	add	ax,si
	push	ax
	call	far 1248:0001
	pop	cx
	cmp	ax,0003
	jc	0143

l13CA_0121:
	mov	bx,si
	add	bx,di
	mov	al,[bx+01]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],0C
	jz	0143

l13CA_0132:
	mov	bx,si
	add	bx,di
	mov	al,[bx+02]
	cbw	
	mov	bx,ax
	test	byte ptr [bx+10E7],0C
	jnz	0145

l13CA_0143:
	jmp	0172

l13CA_0145:
	mov	ax,0003
	push	ax
	mov	ax,di
	add	ax,si
	push	ax
	push	word ptr [1456]
	call	far 1395:000F
	add	sp,06
	mov	bx,[1456]
	mov	byte ptr [bx+03],00
	mov	word ptr [145C],0001
	jmp	0172

l13CA_016A:
	inc	si

l13CA_016B:
	mov	bx,si
	cmp	byte ptr [bx+di],00
	jnz	0103

l13CA_0172:
	pop	di
	pop	si
	retf	

fn13CA_0175()
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,[bp+08]
	or	si,si
	jnz	01A9

l13CA_0181:
	mov	di,[bp+0A]
	cmp	word ptr [bp+0A],3B
	jc	0196

l13CA_018A:
	mov	ax,[bp+06]
	add	ax,0046
	test	ax,0003
	jnz	0196

l13CA_0195:
	dec	di

l13CA_0196:
	xor	si,si
	jmp	019B

l13CA_019A:
	inc	si

l13CA_019B:
	mov	bx,si
	shl	bx,01
	mov	ax,[bx+143A]
	cmp	ax,di
	jbe	019A

l13CA_01A7:
	jmp	01C8

l13CA_01A9:
	cmp	si,03
	jc	01B9

l13CA_01AE:
	mov	ax,[bp+06]
	add	ax,0046
	test	ax,0003
	jz	01BC

l13CA_01B9:
	dec	word ptr [bp+0A]

l13CA_01BC:
	mov	bx,si
	dec	bx
	shl	bx,01
	mov	ax,[bx+143A]
	add	[bp+0A],ax

l13CA_01C8:
	cmp	si,04
	jc	0245

l13CA_01CD:
	jz	01D6

l13CA_01CF:
	cmp	si,0A
	ja	0245

l13CA_01D4:
	jnz	0240

l13CA_01D6:
	mov	bx,si
	shl	bx,01
	cmp	word ptr [bp+06],10
	jle	01EF

l13CA_01E0:
	cmp	si,04
	jnz	01EF

l13CA_01E5:
	mov	cx,[bx+1438]
	add	cx,07
	jmp	01F3
13CA:01EE                                           90                  .

l13CA_01EF:
	mov	cx,[bx+143A]

l13CA_01F3:
	mov	bx,[bp+06]
	add	bx,07B2
	test	bl,03
	jz	0200

l13CA_01FF:
	dec	cx

l13CA_0200:
	mov	bx,[bp+06]
	inc	bx
	sar	bx,01
	sar	bx,01
	add	bx,cx
	mov	ax,016D
	mul	word ptr [bp+06]
	add	ax,bx
	add	ax,0004
	xor	dx,dx
	mov	bx,0007
	div	bx
	sub	cx,dx
	mov	ax,[bp+0A]
	cmp	si,04
	jnz	0234

l13CA_0226:
	cmp	ax,cx
	ja	0240

l13CA_022A:
	jnz	0245

l13CA_022C:
	cmp	byte ptr [bp+0C],02
	jc	0245

l13CA_0232:
	jmp	0240

l13CA_0234:
	cmp	ax,cx
	jc	0240

l13CA_0238:
	jnz	0245

l13CA_023A:
	cmp	byte ptr [bp+0C],01
	ja	0245
;;; Segment 13EE (13EE:0000)

l13CA_0240:
	mov	ax,0001
	jmp	0249

l13CA_0245:
	xor	ax,ax
	jmp	0249

l13CA_0249:
	pop	di
	pop	si
	pop	bp
	retf	0008
13CA:024F                                              55                U
13CA:0250 8B EC 8B 46 06 48 8A 16 0C 14 B6 00 F7 E2 03 06 ...F.H..........
13CA:0260 0F 14 8B 56 08 4A 03 C2 D1 E0 8B 16 11 14 EB 00 ...V.J..........
13CA:0270 5D CA 04 00 55 8B EC 83 EC 02 56 57 A0 0E 14 B4 ]...U.....VW....
13CA:0280 00 89 46 FE 1E 8B 4E 06 E3 5A C4 7E 0C C5 76 08 ..F...N..Z.~..v.
13CA:0290 FC 3B F7 73 0A 8B C1 48 D1 E0 03 F0 03 F8 FD 83 .;.s...H........
13CA:02A0 7E FE 00 75 04 F3 A5 EB 3B BA DA 03 8C C0 8C DB ~..u....;.......
13CA:02B0 3B C3 74 11 FA EC D0 C8 72 FB EC D0 C8 73 FB A5 ;.t.....r....s..
13CA:02C0 FB E2 F1 EB 1F FA EC D0 C8 72 FB EC D0 C8 73 FB .........r....s.
13CA:02D0 AD FB 8B D8 EC D0 C8 72 FB EC D0 C8 73 FB 8B C3 .......r....s...
13CA:02E0 AB FB E2 E1 FC 1F EB 00 5F 5E 8B E5 5D CA 0A 00 ........_^..]...
;;; Segment 13F9 (13F9:0000)
13F9:0000 B4 03 B7 00 9A BC 43 00 08 8B C2 EB 00 CB 0E E8 ......C.........
13F9:0010 EE FF B4 00 8A 16 04 14 B6 00 2B C2 40 EB 00 CB ..........+.@...
13F9:0020 0E E8 DC FF B1 08 D3 E8 B4 00 8A 16 05 14 B6 00 ................
13F9:0030 2B C2 40 EB 00 CB 00 00 00 00 00 00 00 00 00 00 +.@.............
;;; Segment 13FD (13FD:0000)
13FD:0000 00 00 00 00 54 75 72 62 6F 2D 43 20 2D 20 43 6F ....Turbo-C - Co
13FD:0010 70 79 72 69 67 68 74 20 28 63 29 20 31 39 38 38 pyright (c) 1988
13FD:0020 20 42 6F 72 6C 61 6E 64 20 49 6E 74 6C 2E 00 4E  Borland Intl..N
13FD:0030 75 6C 6C 20 70 6F 69 6E 74 65 72 20 61 73 73 69 ull pointer assi
13FD:0040 67 6E 6D 65 6E 74 0D 0A 44 69 76 69 64 65 20 65 gnment..Divide e
13FD:0050 72 72 6F 72 0D 0A 41 62 6E 6F 72 6D 61 6C 20 70 rror..Abnormal p
13FD:0060 72 6F 67 72 61 6D 20 74 65 72 6D 69 6E 61 74 69 rogram terminati
13FD:0070 6F 6E 0D 0A 00 00 00 00 00 00 00 00 00 00 00 00 on..............
13FD:0080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0090 00 00 00 00 00 00 00 00 00 00 00 00 0E 7A 0E 7A .............z.z
13FD:00A0 0E 7A 00 00 00 00 00 00 00 00 00 00 00 00 00 00 .z..............
13FD:00B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:00C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:00D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:00E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:00F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0190 00 00 00 00 3C 00 1E 00 0A 00 00 40 9C 45 52 4F ....<......@.ERO
13FD:01A0 42 00 0A 20 41 67 75 61 72 67 65 20 6F 20 63 61 B.. Aguarge o ca
13FD:01B0 72 72 65 67 61 6D 65 6E 74 6F 20 64 6F 73 20 64 rregamento dos d
13FD:01C0 65 73 65 6E 68 6F 73 2E 2E 2E 00 41 54 41 43 2D esenhos....ATAC-
13FD:01D0 43 2E 42 4D 50 00 0A 20 43 61 72 72 65 67 61 6D C.BMP.. Carregam
13FD:01E0 65 6E 74 6F 20 63 6F 6E 63 6C 75 69 64 6F 00 0A ento concluido..
13FD:01F0 20 41 70 65 72 74 65 20 71 75 61 6C 71 75 65 72  Aperte qualquer
13FD:0200 20 74 65 63 6C 61 20 70 61 72 61 20 69 6E 69 63  tecla para inic
13FD:0210 69 61 72 00 00 25 30 37 2E 30 66 00 25 30 37 2E iar..%07.0f.%07.
13FD:0220 30 66 00 50 41 52 41 42 45 4E 53 20 21 00 47 41 0f.PARABENS !.GA
13FD:0230 4D 45 20 4F 56 45 52 00 45 6E 74 72 65 20 73 65 ME OVER.Entre se
13FD:0240 75 20 6E 6F 6D 65 20 3A 00 1B 5B 31 38 3B 32 30 u nome :..[18;20
13FD:0250 66 00 41 70 65 72 74 65 20 71 75 61 6C 71 75 65 f.Aperte qualque
13FD:0260 72 20 74 65 63 6C 61 20 70 2F 20 72 65 63 6F 6D r tecla p/ recom
13FD:0270 65 63 61 72 2E 2E 2E 00 00 00 00 00 00 00 10 40 ecar...........@
13FD:0280 F8 C1 63 1A DC A5 4C 40 00 00 00 00 00 00 34 40 ..c...L@......4@
13FD:0290 00 00 30 41 00 00 60 43 00 00 00 00 00 00 1C 40 ..0A..`C.......@
13FD:02A0 00 00 00 43 00 00 60 41 00 00 00 00 00 00 F0 3F ...C..`A.......?
13FD:02B0 00 00 00 00 00 00 20 40 00 00 00 00 00 00 59 40 ...... @......Y@
13FD:02C0 00 00 00 00 00 00 49 40 00 00 00 00 00 40 8F 40 ......I@.....@.@
13FD:02D0 00 00 00 00 00 40 7F 40 50 65 72 73 6F 6E 61 67 .....@.@Personag
13FD:02E0 65 6E 73 20 65 20 76 61 6C 6F 72 65 73 20 3A 00 ens e valores :.
13FD:02F0 53 75 61 20 4E 61 76 65 00 4F 20 49 6E 69 6D 69 Sua Nave.O Inimi
13FD:0300 67 6F 3A 20 31 30 30 20 70 6F 6E 74 6F 73 00 50 go: 100 pontos.P
13FD:0310 6F 77 65 72 20 55 70 3A 20 35 30 20 70 6F 6E 74 ower Up: 50 pont
13FD:0320 6F 73 20 2B 20 70 6F 64 65 72 20 64 65 20 66 6F os + poder de fo
13FD:0330 67 6F 00 56 69 64 61 20 45 78 74 72 61 3A 20 4D go.Vida Extra: M
13FD:0340 61 69 73 20 75 6D 61 20 76 69 64 61 00 42 6F 6E ais uma vida.Bon
13FD:0350 75 73 3A 20 31 30 30 30 20 70 6F 6E 74 6F 73 00 us: 1000 pontos.
13FD:0360 50 72 65 73 73 69 6F 6E 65 20 71 75 61 6C 71 75 Pressione qualqu
13FD:0370 65 72 20 74 65 63 6C 61 2E 2E 2E 00 45 54 45 20 er tecla....ETE 
13FD:0380 4C 41 55 52 4F 20 47 4F 4D 45 53 00 33 30 20 61 LAURO GOMES.30 a
13FD:0390 6E 6F 73 00 52 6F 62 73 6F 6E 20 64 6F 73 20 53 nos.Robson dos S
13FD:03A0 61 6E 74 6F 73 20 46 72 61 6E 63 61 00 48 00 52 antos Franca.H.R
13FD:03B0 69 63 61 72 64 6F 20 53 2E 20 53 69 6C 76 61 00 icardo S. Silva.
13FD:03C0 65 20 52 6F 67 65 72 20 41 6C 76 61 72 65 6E 67 e Roger Alvareng
13FD:03D0 61 00 41 50 52 45 53 45 4E 54 41 4D 20 2E 2E 2E a.APRESENTAM ...
13FD:03E0 00 41 54 41 43 2D 43 00 48 00 48 00 41 54 41 43 .ATAC-C.H.H.ATAC
13FD:03F0 2D 43 28 63 29 20 54 6F 64 6F 73 20 6F 73 20 64 -C(c) Todos os d
13FD:0400 69 72 65 69 74 6F 73 20 72 65 73 65 72 76 61 64 ireitos reservad
13FD:0410 6F 73 2E 2E 2E 00 2E 2E 2E 20 61 20 74 75 72 6D os....... a turm
13FD:0420 61 20 32 6F 2E 20 4F 20 64 61 20 61 72 65 61 20 a 2o. O da area 
13FD:0430 64 65 20 50 44 20 65 00 20 61 20 45 54 45 20 4C de PD e. a ETE L
13FD:0440 41 55 52 4F 20 47 4F 4D 45 53 20 70 65 6C 6F 73 AURO GOMES pelos
13FD:0450 20 73 65 75 73 20 33 30 20 61 6E 6F 73 00 50 72  seus 30 anos.Pr
13FD:0460 65 73 73 69 6F 6E 65 20 75 6D 61 20 74 65 63 6C essione uma tecl
13FD:0470 61 20 70 61 72 61 20 73 65 67 75 69 72 2E 2E 2E a para seguir...
13FD:0480 00 45 54 45 20 4C 41 55 52 4F 20 47 4F 4D 45 53 .ETE LAURO GOMES
13FD:0490 00 33 30 20 61 6E 6F 73 00 53 43 4F 52 45 20 3A .30 anos.SCORE :
13FD:04A0 00 52 45 43 4F 52 44 3A 00 49 6E 73 74 72 75 63 .RECORD:.Instruc
13FD:04B0 6F 65 73 00 53 65 75 20 6F 62 6A 65 74 69 76 6F oes.Seu objetivo
13FD:04C0 20 65 27 20 64 65 73 74 72 75 69 72 20 61 73 20  e' destruir as 
13FD:04D0 6E 61 76 65 73 00 69 6E 69 6D 69 67 61 73 20 71 naves.inimigas q
13FD:04E0 75 65 20 73 6F 62 72 65 76 6F 61 6D 20 73 6F 62 ue sobrevoam sob
13FD:04F0 72 65 20 76 6F 63 65 2E 00 2E 50 61 72 61 20 69 re voce...Para i
13FD:0500 73 73 6F 20 76 6F 63 65 20 64 69 73 70 6F 65 20 sso voce dispoe 
13FD:0510 64 65 20 75 6D 20 63 61 6E 68 61 6F 00 20 64 65 de um canhao. de
13FD:0520 20 6C 6F 6E 67 6F 20 61 6C 63 61 6E 63 65 2E 20  longo alcance. 
13FD:0530 41 70 65 72 74 65 20 3C 41 4C 54 3E 20 70 2F 20 Aperte <ALT> p/ 
13FD:0540 00 61 74 69 72 61 72 2E 20 55 74 69 6C 69 7A 65 .atirar. Utilize
13FD:0550 20 74 61 6D 62 65 6D 20 61 73 20 74 65 63 6C 61  tambem as tecla
13FD:0560 73 00 53 48 49 46 54 20 70 61 72 61 20 73 65 20 s.SHIFT para se 
13FD:0570 6D 6F 76 65 72 2E 53 65 20 64 65 73 74 72 75 69 mover.Se destrui
13FD:0580 72 20 6F 00 28 50 29 20 6F 62 74 65 72 61 20 6D r o.(P) obtera m
13FD:0590 61 69 73 20 64 6F 69 73 20 74 69 72 6F 73 20 65 ais dois tiros e
13FD:05A0 78 74 72 61 73 2E 00 48 61 27 2C 20 65 6E 74 72 xtras..Ha', entr
13FD:05B0 65 74 61 6E 74 6F 2C 20 75 6D 20 70 6F 72 65 6D etanto, um porem
13FD:05C0 2E 2E 2E 20 73 65 20 35 20 00 6E 61 76 65 73 20 ... se 5 .naves 
13FD:05D0 64 65 73 63 65 72 65 6D 20 70 61 72 61 20 6F 20 descerem para o 
13FD:05E0 66 69 6D 20 64 61 20 74 65 6C 61 2E 2E 2E 00 47 fim da tela....G
13FD:05F0 41 4D 45 20 4F 56 45 52 21 21 20 54 65 6D 20 75 AME OVER!! Tem u
13FD:0600 6D 20 69 6E 64 69 63 61 64 6F 72 20 61 62 61 69 m indicador abai
13FD:0610 78 6F 20 00 71 75 65 20 69 6E 64 69 63 61 20 61 xo .que indica a
13FD:0620 73 20 6E 61 76 65 73 20 71 75 65 20 64 65 73 63 s naves que desc
13FD:0630 65 72 61 6D 2C 73 6F 00 71 75 65 20 61 6F 20 63 eram,so.que ao c
13FD:0640 6F 6E 74 72 61 72 69 6F 2E 2E 2E 20 41 73 73 69 ontrario... Assi
13FD:0650 6D 20 73 65 20 74 65 6D 20 32 20 00 6E 61 76 65 m se tem 2 .nave
13FD:0660 73 20 73 69 67 6E 69 66 69 63 61 20 71 75 65 20 s significa que 
13FD:0670 33 20 6A 61 20 64 65 73 63 65 72 61 6D 2E 2E 2E 3 ja desceram...
13FD:0680 00 44 65 20 76 65 7A 20 65 6D 20 71 75 61 6E 64 .De vez em quand
13FD:0690 6F 20 65 73 73 65 20 73 69 6D 62 6F 6C 6F 20 63 o esse simbolo c
13FD:06A0 61 69 20 6E 61 00 74 65 6C 61 2E 20 53 65 20 64 ai na.tela. Se d
13FD:06B0 65 73 74 72 75 69 2D 6C 6F 2C 20 76 6F 63 65 20 estrui-lo, voce 
13FD:06C0 22 67 61 6E 68 61 22 20 33 20 76 69 2D 00 64 61 "ganha" 3 vi-.da
13FD:06D0 73 20 65 78 74 72 61 73 2E 20 54 65 6D 20 74 61 s extras. Tem ta
13FD:06E0 6D 62 65 6D 20 75 6D 20 28 42 29 20 71 75 65 20 mbem um (B) que 
13FD:06F0 64 61 20 00 31 30 30 30 20 70 6F 6E 74 6F 73 20 da .1000 pontos 
13FD:0700 73 65 20 76 6F 63 65 20 64 65 73 74 72 75 69 2D se voce destrui-
13FD:0710 6C 6F 00 42 20 4F 20 41 20 20 20 53 20 4F 20 52 lo.B O A   S O R
13FD:0720 20 54 20 45 20 20 20 21 20 21 20 21 00 50 72 65  T E   ! ! !.Pre
13FD:0730 73 73 69 6F 6E 65 20 71 75 61 6C 71 75 65 72 20 ssione qualquer 
13FD:0740 74 65 63 6C 61 20 70 61 72 61 20 63 6F 6D 65 63 tecla para comec
13FD:0750 61 72 2E 2E 2E 00 53 65 6C 65 63 69 6F 6E 65 20 ar....Selecione 
13FD:0760 61 20 76 65 6C 6F 63 69 64 61 64 65 00 31 2E 20 a velocidade.1. 
13FD:0770 4C 65 6E 74 6F 00 32 2E 20 4D 65 64 69 6F 00 33 Lento.2. Medio.3
13FD:0780 2E 20 52 61 70 69 64 6F 00 50 72 65 73 73 69 6F . Rapido.Pressio
13FD:0790 6E 65 20 71 75 61 6C 71 75 65 72 20 74 65 63 6C ne qualquer tecl
13FD:07A0 61 00 45 73 63 6F 6C 68 61 20 61 20 64 69 66 69 a.Escolha a difi
13FD:07B0 63 75 6C 64 61 64 65 00 31 2E 20 46 61 63 69 6C culdade.1. Facil
13FD:07C0 00 32 2E 20 44 69 66 69 63 69 6C 00 50 72 65 73 .2. Dificil.Pres
13FD:07D0 73 69 6F 6E 65 20 71 75 61 6C 71 75 65 72 20 74 sione qualquer t
13FD:07E0 65 63 6C 61 00 00 00 00 00 00 20 04 F0 7F 63 6F ecla...... ...co
13FD:07F0 73 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 s...............
13FD:0800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9C 1E ................
13FD:0820 50 56 B8 00 F0 8E D8 80 3E FE FF FD 75 06 E4 62 PV......>...u..b
13FD:0830 24 01 75 2E B8 FD 13 8E D8 A0 84 01 8A 26 82 01 $.u..........&..
13FD:0840 0E 1F 83 3E 96 00 00 BE F6 07 74 08 D9 34 9B 8A ...>......t..4..
13FD:0850 04 8A 64 02 F6 C4 80 74 09 F6 D0 22 C4 EA A5 03 ..d....t..."....
13FD:0860 00 00 5E 58 1F 0E E8 05 00 2E FF 2E F2 07 CF 9B ..^X............
13FD:0870 00 00 CB 00 81 00 8C 08 82 00 93 08 83 00 9C 08 ................
13FD:0880 84 00 A8 08 85 00 B1 08 86 00 BB 08 44 6F 6D 61 ............Doma
13FD:0890 69 6E 00 44 65 6E 6F 72 6D 61 6C 00 44 69 76 69 in.Denormal.Divi
13FD:08A0 64 65 20 62 79 20 30 00 4F 76 65 72 66 6C 6F 77 de by 0.Overflow
13FD:08B0 00 55 6E 64 65 72 66 6C 6F 77 00 50 61 72 74 69 .Underflow.Parti
13FD:08C0 61 6C 20 6C 6F 73 73 20 6F 66 20 70 72 65 63 69 al loss of preci
13FD:08D0 73 69 6F 6E 00 46 6C 6F 61 74 69 6E 67 20 70 6F sion.Floating po
13FD:08E0 69 6E 74 20 65 72 72 6F 72 3A 20 25 73 2E 0A 00 int error: %s...
13FD:08F0 FF FF 7F 7F FF FF FF FF FF FF EF 7F FF FF FF FF ................
13FD:0900 FF FF FF FF FE 7F 00 00 C0 7F 00 00 00 00 00 00 ................
13FD:0910 00 80 01 00 00 00 00 00 00 00 00 00 00 00 80 3F ...............?
13FD:0920 00 00 20 41 00 00 C8 42 00 00 7A 44 00 40 1C 46 .. A...B..zD.@.F
13FD:0930 00 50 C3 47 00 24 74 49 80 96 18 4B 20 BC BE 4C .P.G.$tI...K ..L
13FD:0940 00 80 E0 37 79 C3 41 43 9E B5 70 2B A8 AD C5 9D ...7y.AC..p+....
13FD:0950 69 40 D5 A6 CF FF 49 1F 78 C2 D3 40 DF 8C E9 80 i@....I.x..@....
13FD:0960 C9 47 BA 93 A8 41 8C DE F9 9D FB EB 7E AA 51 43 .G...A......~.QC
13FD:0970 C7 91 0E A6 AE A0 19 E3 A3 46 17 0C 75 81 86 75 .........F..u..u
13FD:0980 76 C9 48 4D E5 5D 3D C5 5D 3B 8B 9E 92 5A 9B 97 v.HM.]=.];...Z..
13FD:0990 20 8A 02 52 60 C4 25 75 00 00 80 7F 00 00 80 7F  ..R`.%u........
13FD:09A0 00 00 80 FF 00 00 C0 7F 00 00 C0 FF 00 00 00 00 ................
13FD:09B0 00 00 00 00 00 00 00 00 00 00 20 04 F0 7F 73 69 .......... ...si
13FD:09C0 6E 00 CE 09 D5 09 DA 09 E3 09 ED 09 F3 09 44 4F n.............DO
13FD:09D0 4D 41 49 4E 00 53 49 4E 47 00 4F 56 45 52 46 4C MAIN.SING.OVERFL
13FD:09E0 4F 57 00 55 4E 44 45 52 46 4C 4F 57 00 54 4C 4F OW.UNDERFLOW.TLO
13FD:09F0 53 53 00 50 4C 4F 53 53 00 25 73 3A 20 25 73 20 SS.PLOSS.%s: %s 
13FD:0A00 65 72 72 6F 72 0A 00 00 00 00 00 00 00 00 00 00 error...........
13FD:0A10 A0 28 00 08 01 00 00 00 00 00 00 00 00 00 00 00 .(..............
13FD:0A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 0A ................
13FD:0A80 00 00 00 00 00 00 00 00 00 00 00 54 52 49 50 00 ...........TRIP.
13FD:0A90 00 00 00 00 00 00 00 00 00 00 4C 49 54 54 00 00 ..........LITT..
13FD:0AA0 00 00 00 00 00 00 00 00 00 53 41 4E 53 00 00 00 .........SANS...
13FD:0AB0 00 00 00 00 00 00 00 00 47 4F 54 48 00 00 00 00 ........GOTH....
13FD:0AC0 00 00 00 00 00 00 00 53 43 52 49 00 00 00 00 00 .......SCRI.....
13FD:0AD0 00 00 00 00 00 00 53 49 4D 50 00 00 00 00 00 00 ......SIMP......
13FD:0AE0 00 00 00 00 00 54 53 43 52 00 00 00 00 00 00 00 .....TSCR.......
13FD:0AF0 00 00 00 00 4C 43 4F 4D 00 00 00 00 00 00 00 00 ....LCOM........
13FD:0B00 00 00 00 45 55 52 4F 00 00 00 00 00 00 00 00 00 ...EURO.........
13FD:0B10 00 00 42 4F 4C 44 00 00 00 00 00 00 00 00 00 00 ..BOLD..........
13FD:0B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 4E 09 00 .............N..
13FD:0BB0 08 4E 09 00 08 00 00 00 00 00 00 00 00 00 00 00 .N..............
13FD:0BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0C00 00 00 00 00 00 00 00 00 B5 0B C8 0B 00 00 00 00 ................
13FD:0C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 ................
13FD:0C20 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0C70 00 00 00 00 06 00 43 47 41 00 00 00 00 00 00 43 ......CGA......C
13FD:0C80 47 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 GA..............
13FD:0C90 45 47 41 56 47 41 00 00 00 45 47 41 56 47 41 00 EGAVGA...EGAVGA.
13FD:0CA0 00 00 00 00 00 00 00 00 00 00 49 42 4D 38 35 31 ..........IBM851
13FD:0CB0 34 00 00 49 42 4D 38 35 31 34 00 00 00 00 00 00 4..IBM8514......
13FD:0CC0 00 00 00 00 48 45 52 43 00 00 00 00 00 48 45 52 ....HERC.....HER
13FD:0CD0 43 00 00 00 00 00 00 00 00 00 00 00 00 00 41 54 C.............AT
13FD:0CE0 54 00 00 00 00 00 00 41 54 54 00 00 00 00 00 00 T......ATT......
13FD:0CF0 00 00 00 00 00 00 00 00 50 43 33 32 37 30 00 00 ........PC3270..
13FD:0D00 00 50 43 33 32 37 30 00 00 00 00 00 00 00 00 00 .PC3270.........
13FD:0D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0D70 00 00 00 00 00 00 00 00 00 00 78 78 78 78 00 00 ..........xxxx..
13FD:0D80 00 00 00 4E 6F 20 45 72 72 6F 72 00 00 00 00 00 ...No Error.....
13FD:0D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0DE0 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF 42 ...............B
13FD:0DF0 61 64 20 4D 6F 64 65 00 00 00 00 00 00 00 00 00 ad Mode.........
13FD:0E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:0E10 00 00 00 00 00 00 00 4E 6F 20 65 72 72 6F 72 00 .......No error.
13FD:0E20 28 42 47 49 29 20 67 72 61 70 68 69 63 73 20 6E (BGI) graphics n
13FD:0E30 6F 74 20 69 6E 73 74 61 6C 6C 65 64 00 47 72 61 ot installed.Gra
13FD:0E40 70 68 69 63 73 20 68 61 72 64 77 61 72 65 20 6E phics hardware n
13FD:0E50 6F 74 20 64 65 74 65 63 74 65 64 00 44 65 76 69 ot detected.Devi
13FD:0E60 63 65 20 64 72 69 76 65 72 20 66 69 6C 65 20 6E ce driver file n
13FD:0E70 6F 74 20 66 6F 75 6E 64 20 28 00 49 6E 76 61 6C ot found (.Inval
13FD:0E80 69 64 20 64 65 76 69 63 65 20 64 72 69 76 65 72 id device driver
13FD:0E90 20 66 69 6C 65 20 28 00 4E 6F 74 20 65 6E 6F 75  file (.Not enou
13FD:0EA0 67 68 20 6D 65 6D 6F 72 79 20 74 6F 20 6C 6F 61 gh memory to loa
13FD:0EB0 64 20 64 72 69 76 65 72 00 4F 75 74 20 6F 66 20 d driver.Out of 
13FD:0EC0 6D 65 6D 6F 72 79 20 69 6E 20 73 63 61 6E 20 66 memory in scan f
13FD:0ED0 69 6C 6C 00 4F 75 74 20 6F 66 20 6D 65 6D 6F 72 ill.Out of memor
13FD:0EE0 79 20 69 6E 20 66 6C 6F 6F 64 20 66 69 6C 6C 00 y in flood fill.
13FD:0EF0 46 6F 6E 74 20 66 69 6C 65 20 6E 6F 74 20 66 6F Font file not fo
13FD:0F00 75 6E 64 20 28 00 4E 6F 74 20 65 6E 6F 75 67 68 und (.Not enough
13FD:0F10 20 6D 65 6D 6F 72 79 20 74 6F 20 6C 6F 61 64 20  memory to load 
13FD:0F20 66 6F 6E 74 00 49 6E 76 61 6C 69 64 20 67 72 61 font.Invalid gra
13FD:0F30 70 68 69 63 73 20 6D 6F 64 65 20 66 6F 72 20 73 phics mode for s
13FD:0F40 65 6C 65 63 74 65 64 20 64 72 69 76 65 72 00 47 elected driver.G
13FD:0F50 72 61 70 68 69 63 73 20 65 72 72 6F 72 00 47 72 raphics error.Gr
13FD:0F60 61 70 68 69 63 73 20 49 2F 4F 20 65 72 72 6F 72 aphics I/O error
13FD:0F70 00 49 6E 76 61 6C 69 64 20 66 6F 6E 74 20 66 69 .Invalid font fi
13FD:0F80 6C 65 20 28 00 49 6E 76 61 6C 69 64 20 66 6F 6E le (.Invalid fon
13FD:0F90 74 20 6E 75 6D 62 65 72 00 49 6E 76 61 6C 69 64 t number.Invalid
13FD:0FA0 20 50 72 69 6E 74 65 72 20 49 6E 69 74 69 61 6C  Printer Initial
13FD:0FB0 69 7A 65 00 50 72 69 6E 74 65 72 20 4D 6F 64 75 ize.Printer Modu
13FD:0FC0 6C 65 20 4E 6F 74 20 4C 69 6E 6B 65 64 00 49 6E le Not Linked.In
13FD:0FD0 76 61 6C 69 64 20 46 69 6C 65 20 56 65 72 73 69 valid File Versi
13FD:0FE0 6F 6E 20 4E 75 6D 62 65 72 00 47 72 61 70 68 69 on Number.Graphi
13FD:0FF0 63 73 20 65 72 72 6F 72 20 28 00 29 00 0D 0A 42 cs error (.)...B
13FD:1000 47 49 20 45 72 72 6F 72 3A 20 4E 6F 74 20 69 6E GI Error: Not in
13FD:1010 20 67 72 61 70 68 69 63 73 20 6D 6F 64 65 0D 0A  graphics mode..
13FD:1020 0D 0A 24 00 0D 0A 42 47 49 20 45 72 72 6F 72 3A ..$...BGI Error:
13FD:1030 20 47 72 61 70 68 69 63 73 20 6E 6F 74 20 69 6E  Graphics not in
13FD:1040 69 74 69 61 6C 69 7A 65 64 20 28 75 73 65 20 27 itialized (use '
13FD:1050 69 6E 69 74 67 72 61 70 68 27 29 0D 0A 0D 0A 24 initgraph')....$
13FD:1060 00 2E 42 47 49 00 2E 43 48 52 00 00 FF 00 00 00 ..BGI..CHR......
13FD:1070 00 00 00 00 00 FF 00 00 00 00 00 13 02 02 04 05 ................
13FD:1080 06 08 08 08 14 15 05 13 FF 16 05 11 02 FF FF FF ................
13FD:1090 FF FF FF FF FF FF FF FF FF FF 05 05 FF FF FF FF ................
13FD:10A0 FF FF FF FF FF FF FF FF FF FF FF FF 0F FF 23 02 ..............#.
13FD:10B0 FF 0F FF FF FF FF 13 FF FF 02 02 05 0F 02 FF FF ................
13FD:10C0 FF 13 FF FF FF FF FF FF FF FF 23 FF FF FF FF 23 ..........#....#
13FD:10D0 FF 13 FF 00 09 00 8C 11 09 00 8C 11 09 00 8C 11 ................
13FD:10E0 00 00 00 10 00 00 00 20 20 20 20 20 20 20 20 20 .......         
13FD:10F0 21 21 21 21 21 20 20 20 20 20 20 20 20 20 20 20 !!!!!           
13FD:1100 20 20 20 20 20 20 20 01 40 40 40 40 40 40 40 40        .@@@@@@@@
13FD:1110 40 40 40 40 40 40 40 02 02 02 02 02 02 02 02 02 @@@@@@@.........
13FD:1120 02 40 40 40 40 40 40 40 14 14 14 14 14 14 04 04 .@@@@@@@........
13FD:1130 04 04 04 04 04 04 04 04 04 04 04 04 04 04 04 04 ................
13FD:1140 04 04 40 40 40 40 40 40 18 18 18 18 18 18 08 08 ..@@@@@@........
13FD:1150 08 08 08 08 08 08 08 08 08 08 08 08 08 08 08 08 ................
13FD:1160 08 08 40 40 40 40 20 00 00 00 00 00 00 00 00 00 ..@@@@ .........
13FD:1170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:11A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:11B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:11C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:11D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:11E0 00 00 00 00 00 00 00 00 00 00 09 02 00 00 00 00 ................
13FD:11F0 00 00 00 00 00 00 E8 11 00 00 0A 02 01 00 00 00 ................
13FD:1200 00 00 00 00 00 00 F8 11 00 00 02 02 02 00 00 00 ................
13FD:1210 00 00 00 00 00 00 08 12 00 00 43 02 03 00 00 00 ..........C.....
13FD:1220 00 00 00 00 00 00 18 12 00 00 42 02 04 00 00 00 ..........B.....
13FD:1230 00 00 00 00 00 00 28 12 00 00 00 00 FF 00 00 00 ......(.........
13FD:1240 00 00 00 00 00 00 38 12 00 00 00 00 FF 00 00 00 ......8.........
13FD:1250 00 00 00 00 00 00 48 12 00 00 00 00 FF 00 00 00 ......H.........
13FD:1260 00 00 00 00 00 00 58 12 00 00 00 00 FF 00 00 00 ......X.........
13FD:1270 00 00 00 00 00 00 68 12 00 00 00 00 FF 00 00 00 ......h.........
13FD:1280 00 00 00 00 00 00 78 12 00 00 00 00 FF 00 00 00 ......x.........
13FD:1290 00 00 00 00 00 00 88 12 00 00 00 00 FF 00 00 00 ................
13FD:12A0 00 00 00 00 00 00 98 12 00 00 00 00 FF 00 00 00 ................
13FD:12B0 00 00 00 00 00 00 A8 12 00 00 00 00 FF 00 00 00 ................
13FD:12C0 00 00 00 00 00 00 B8 12 00 00 00 00 FF 00 00 00 ................
13FD:12D0 00 00 00 00 00 00 C8 12 00 00 00 00 FF 00 00 00 ................
13FD:12E0 00 00 00 00 00 00 D8 12 00 00 00 00 FF 00 00 00 ................
13FD:12F0 00 00 00 00 00 00 E8 12 00 00 00 00 FF 00 00 00 ................
13FD:1300 00 00 00 00 00 00 F8 12 00 00 00 00 FF 00 00 00 ................
13FD:1310 00 00 00 00 00 00 08 13 00 00 00 00 FF 00 00 00 ................
13FD:1320 00 00 00 00 00 00 18 13 01 20 02 20 02 20 04 A0 ......... . . ..
13FD:1330 02 A0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF ................
13FD:1340 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ................
13FD:1350 00 40 FF FF 00 00 00 00 70 72 69 6E 74 20 73 63 .@......print sc
13FD:1360 61 6E 66 20 3A 20 66 6C 6F 61 74 69 6E 67 20 70 anf : floating p
13FD:1370 6F 69 6E 74 20 66 6F 72 6D 61 74 73 20 6E 6F 74 oint formats not
13FD:1380 20 6C 69 6E 6B 65 64 0D 0A 00 0D 00 28 6E 75 6C  linked.....(nul
13FD:1390 6C 29 00 30 31 32 33 34 35 36 37 38 39 41 42 43 l).0123456789ABC
13FD:13A0 44 45 46 00 14 14 01 14 15 14 14 14 14 02 00 14 DEF.............
13FD:13B0 03 04 14 09 05 05 05 05 05 05 05 05 05 14 14 14 ................
13FD:13C0 14 14 14 14 14 14 14 14 0F 17 0F 08 14 14 14 07 ................
13FD:13D0 14 16 14 14 14 14 14 14 14 14 14 0D 14 14 14 14 ................
13FD:13E0 14 14 14 14 14 14 10 0A 0F 0F 0F 08 0A 14 14 06 ................
13FD:13F0 14 12 0B 0E 14 14 11 14 0C 14 14 0D 14 14 14 14 ................
13FD:1400 14 14 14 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1410 00 00 00 01 00 43 4F 4D 50 41 51 00 00 00 01 00 .....COMPAQ.....
13FD:1420 00 00 1F 1C 1F 1E 1F 1E 1F 1F 1E 1F 1E 1F 1F 1C ................
13FD:1430 1F 1E 1F 1E 1F 1F 1E 1F 1E 1F 00 00 1F 00 3B 00 ..............;.
13FD:1440 5A 00 78 00 97 00 B5 00 D4 00 F3 00 11 01 30 01 Z.x...........0.
13FD:1450 4E 01 6D 01 06 7A 0A 7A 50 46 00 00 01 00 54 5A N.m..z.zPF....TZ
13FD:1460 00 45 53 54 00 45 44 54 00 00 C1 02 81 03 CB 43 .EST.EDT.......C
13FD:1470 21 00 0C 11 53 43 00 08 0C 00 26 11 F6 02 26 11 !...SC....&...&.
13FD:1480 F2 02 26 11 58 43 00 08 58 43 00 08 58 43 00 08 ..&.XC..XC..XC..
13FD:1490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:14A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:14B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:14C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:14D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:14E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:14F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:15A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:15B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:15C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:15D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:15E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:15F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:16A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:16B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:16C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:16D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:16E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:16F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:17A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:17B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:17C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:17D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:17E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:17F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:18A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:18B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:18C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:18D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:18E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:18F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:19A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:19B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:19C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:19D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:19E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:19F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:1FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:20A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:20B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:20C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:20D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:20E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:20F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:21A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:21B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:21C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:21D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:21E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:21F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:22A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:22B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:22C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:22D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:22E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:22F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:23A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:23B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:23C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:23D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:23E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:23F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:24A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:24B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:24C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:24D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:24E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:24F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:25A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:25B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:25C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:25D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:25E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:25F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:26A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:26B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:26C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:26D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:26E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:26F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:27A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:27B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:27C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:27D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:27E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:27F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:28A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:28B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:28C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:28D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:28E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:28F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:29A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:29B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:29C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:29D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:29E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:29F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:2FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:30A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:30B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:30C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:30D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:30E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:30F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:31A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:31B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:31C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:31D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:31E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:31F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:32A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:32B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:32C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:32D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:32E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:32F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:33A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:33B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:33C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:33D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:33E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:33F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:34A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:34B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:34C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:34D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:34E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:34F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:35A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:35B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:35C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:35D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:35E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:35F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:36A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:36B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:36C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:36D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:36E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:36F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:37A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:37B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:37C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:37D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:37E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:37F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:38A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:38B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:38C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:38D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:38E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:38F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:39A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:39B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:39C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:39D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:39E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:39F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:3FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:40A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:40B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:40C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:40D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:40E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:40F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:41A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:41B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:41C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:41D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:41E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:41F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:42A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:42B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:42C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:42D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:42E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:42F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:43A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:43B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:43C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:43D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:43E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:43F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:44A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:44B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:44C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:44D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:44E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:44F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:45A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:45B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:45C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:45D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:45E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:45F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:46A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:46B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:46C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:46D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:46E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:46F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:47A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:47B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:47C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:47D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:47E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:47F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:48A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:48B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:48C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:48D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:48E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:48F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:49A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:49B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:49C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:49D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:49E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:49F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:4FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:50A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:50B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:50C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:50D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:50E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:50F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:51A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:51B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:51C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:51D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:51E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:51F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:52A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:52B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:52C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:52D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:52E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:52F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:53A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:53B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:53C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:53D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:53E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:53F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:54A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:54B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:54C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:54D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:54E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:54F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:55A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:55B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:55C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:55D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:55E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:55F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:56A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:56B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:56C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:56D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:56E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:56F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:57A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:57B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:57C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:57D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:57E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:57F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:58A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:58B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:58C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:58D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:58E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:58F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:59A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:59B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:59C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:59D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:59E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:59F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:5FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:60A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:60B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:60C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:60D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:60E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:60F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:61A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:61B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:61C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:61D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:61E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:61F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:62A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:62B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:62C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:62D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:62E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:62F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:63A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:63B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:63C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:63D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:63E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:63F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:64A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:64B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:64C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:64D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:64E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:64F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:65A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:65B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:65C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:65D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:65E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:65F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:66A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:66B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:66C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:66D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:66E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:66F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:67A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:67B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:67C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:67D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:67E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:67F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:68A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:68B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:68C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:68D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:68E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:68F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:69A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:69B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:69C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:69D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:69E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:69F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:6FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:70A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:70B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:70C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:70D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:70E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:70F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:71A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:71B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:71C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:71D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:71E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:71F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:72A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:72B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:72C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:72D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:72E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:72F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:73A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:73B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:73C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:73D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:73E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:73F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:74A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:74B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:74C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:74D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:74E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:74F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:75A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:75B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:75C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:75D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:75E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:75F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:76A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:76B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:76C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:76D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:76E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:76F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:77A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:77B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:77C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:77D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:77E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:77F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:78A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:78B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:78C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:78D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:78E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:78F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7970 00 00 00 00 00 00 00 00 00 00                   ..........     
Call table at 13FD:797A (694 bytes)
13FD:797A                               00 00 00 00 00 00           ......
13FD:7980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:79A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:79B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:79C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:79D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:79E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:79F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
13FD:7A90 FB 52 08 02 8F 11 00 00 E9 01 18 00 00 00 86 01 .R..............
13FD:7AA0 86 01 61 00 00 00 00 00 00 00 00 00 00 00 00 00 ..a.............
13FD:7AB0 60 DE 00 00 00 00 00 00 01 00 00 00 00 00 00 00 `...............
13FD:7AC0 01 00 00 00 00 00 00 00 01 02 00 00 00 00 00 00 ................
13FD:7AD0 00 01 03 00 00 00 00 00 00 00 01 04 00 00 00 00 ................
13FD:7AE0 00 00 00 01 05 00 00 00 32 06 00 00 01 06 00 00 ........2.......
13FD:7AF0 00 32 0E 00 00 01 07 00 00 00 32 16 00 00 01 08 .2........2.....
13FD:7B00 00 00 00 00 40 00 00 01 09 00 00 00 32 5C 00 00 ....@.......2\..
13FD:7B10 01 0A 00 00 00 00 80 00 00 01 0B 00 00 00 3D A2 ..............=.
13FD:7B20 00 00 01 0C 00 00 00 00 C0 00 00 01 0D 00 00 00 ................
13FD:7B30 32 FE 00 00 01 0E 00 00 00 2A 01 00 00 00 0F 00 2........*......
13FD:7B40 00 00 B0 01 00 00 00 10 00 00 00 ED 01 00 00 00 ................
13FD:7B50 11 00 00 00 05 02 00 00 00 12 00 00 00 FB 02 00 ................
13FD:7B60 00 00 13 00 00 00 A5 03 00 00 00 14 00 00 00 DC ................
13FD:7B70 05 00 00 00 15 00 00 00 F7 05 00 00 00 16 00 00 ................
13FD:7B80 00 04 06 00 00 00 17 00 00 00 A7 07 00 00 00 18 ................
13FD:7B90 00 00 00 C2 07 00 00 00 19 00 00 00 38 09 00 00 ............8...
13FD:7BA0 00 1A 00 00 00 4E 09 00 00 00 1B 00 00 00 16 0A .....N..........
13FD:7BB0 00 00 00 1C 00 00 00 D4 0A 00 00 00 1D 00 00 00 ................
13FD:7BC0 BA 0B 00 00 00 1E 00 00 00 EA 0B 00 00 00 1F 00 ................
13FD:7BD0 00 00 89 0C 00 00 00 20 00 00 00 A4 0E 00 00 00 ....... ........
13FD:7BE0 21 00 00 00 94 0F 00 00 00 22 00 00 00 FC 11 00 !........"......
13FD:7BF0 00 00 23 00 00 00 EA 12 00 00 00 24 00 00 00 93 ..#........$....
13FD:7C00 13 00 00 00 25 00 00 00 19 14 00 00 00 26 00 00 ....%........&..
13FD:7C10 00 36 14 00 00 00 27 00 00 00 64 14 00 00 00 28 .6....'...d....(
13FD:7C20 00 00 00 08 15 00 00 00 29 00 00 00 20 15 00 00 ........)... ...
