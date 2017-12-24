		.model tiny

		.data

Level1			dw  0
Level2			dw  0
LevelE1			dw  02h
LevelE2			dw  00h
LevelN1			dw  01h
LevelN2			dw  100h
LevelH1			dw  0h
LevelH2			dw  9999h
checkleftlost	db  0
checkrightlost	db  0
checkcrashL		db  0
checkcrashR		db  0
rowold   		db  12
colold			db	40 
row   			db  12
col 			db	40 
rowdummy		db	1
coldummy		db	1
checkstart		db  0
score_txt	db  "Score: $",0
match_txt   db   'MATCH   ( : )$',0
p1			db	'player1: $',0
p2			db	'player2: $',0
spcbar      db  'press spacebar for start a game !!$',0
match       db  1
Score1		db	0 
Score2      db  0
win1		db  0
win2		db  0
row1    	db  2
row2		db	2
row_pad1    db	10
row_pad2    db  12
row_tmpL   	db  10
row_tmpR   	db  12
row_tmpL2   db  10
row_tmpR2   db  12
b1			db  3
b2			db	3
keep		db  0
buff        db  10        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
            db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
            db  10 dup(0) ;CHARACTERS ENTERED BY USER.
buff2       db  10        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
            db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
            db  10 dup(0) ;CHARACTERS ENTERED BY USER.
name1_txt	db	'player1: $',0
name2_txt	db	'player2: $',0
mframe		db	' *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *			     	                			      *',10,13,' *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *$',0
frame		db  ' ::::::::::::::::',10,13,'                                 ::            ::',10,13,'                                 ::::::::::::::::$',0
page1   	db  ' *	 ___  _              ___  ___  _ _  ___     ___  _        ',10,13,' *	| . \<_>._ _  ___   | . \| . || \ |/  _>   |  _>| |_  ___  ___ ',10,13,' *	|  _/| || ` |/ . |  |  _/| | ||   || <_/\  | <__| . |<_> |/ ._>',10,13,' *	|_|  |_||_|_|\_. |  |_|  `___`|_\_|`____/  `___/|_|_|<___|\___.',10,13,' *	             <___| $',0
page2   	db  '   ___                         , _      ',10,13,'            / (_)                       /|/ \        ',10,13,'            \__   _  _  _|_  _   ,_      |   |   __,   _  _  _    _  ',10,13,'            /    / |/ |  |  |/  /  |     |   |  /  |  / |/ |/ |  |/  ',10,13,'            \___/  |  |_/|_/|__/   |_/   |   |_/\_/|_/  |  |  |_/|__/$',0
winner_txt	db	'	_|          _|  _|_|_|  _|      _|  _|      _|  _|_|_|_|  _|_|_|   ',10,13,'	_|          _|    _|    _|_|    _|  _|_|    _|  _|        _|    _|',10,13,'	_|    _|    _|    _|    _|  _|  _|  _|  _|  _|  _|_|_|    _|_|_|   ',10,13,'	  _|  _|  _|      _|    _|    _|_|  _|    _|_|  _|        _|    _| ',10,13,'	    _|  _|      _|_|_|  _|      _|  _|      _|  _|_|_|_|  _|    _| $',0
modec     db      '1. Good Mode',10,13,' *                              2. Better Mode',10,13,' *                              3. Best Mode',10,13,' *                              4. How to play$',0
exit_txt  db      '[Press ESC to Exit]$',0
key_txt   db      '[Press spacebar to go menu]$',0
howto     db	  '     		       __         ____ __      __     _      ',10,13,'     		  )__//  )(   /    /  /  )    /__)/  /_|(__/ ',10,13,'     		 /  /(__/ |/|/    (  (__/    /   (__(  | /   $',0
how1      db	  "- There will have ball(@) direct to your paddle ,you must shift paddle for ",10,13, " get ball. If you can't ,Another player's Score will increase.",10,10,10,13,'   - The game have 3 matchs ,each of match will play until have one player get',10,13,' 5 Score.',10,10,10,13,'   - You can control your paddle by using ',10,10,13,'		* player1 * press [W] -> Shift paddle Up',10,13,'		            press [S] -> Shift paddle Down',10,13,'		* player2 * press [Up Arrow]   -> Shift paddle Up',10,13,'	  	    	    press [Down Arrow] -> Shift paddle Down $',0
how4      db	  "Let's fun! :-D [press any key to go back]$",0
mode      db      12						; Default row for select mode [first mode]			
	sound_loading   	dw 3619,25
                        dw 1,32
                        dw 3619,25
                        dw 1,75
                        dw 3619,25
                        dw 1,75
                        dw 4560,25
                        dw 1,25
                        dw 3619,25
                        dw 1,75
                        dw 3043,25
                        dw 1,112
                        dw 6087,25
                        dw 1,142
                        dw 0,0 
						
	sound_play			dw 3834, 100 ;D#
						dw  3416, 100 ;F
						dw  3224, 100 ;F#
						dw  2873, 100 ;G#
						dw  3416, 100 ;F
						dw  3224, 100 ;F#
						dw  2873, 100 ;G#
						dw  2559, 100 ;A#
						dw  3224, 100 ;F#
						dw  2873, 100 ;G#
						dw  2559, 100 ;A#
						dw  2152, 100 ;C#
						dw  2873, 100 ;G#
						dw  2559, 100 ;A#
						dw  2152, 100 ;C#
						dw  1917, 100 ;D#
						dw  2559, 100 ;A#
						dw  2152, 100 ;C#
						dw  1917, 100 ;D#
						dw  1715, 100 ;F
						dw  10,5
						dw  1917, 25 ;D#
						dw  1715, 800 ;F
						dw  00h,00h
						
	sound_game			dw  10,1
						dw 3619, 100 ;E
						dw  3834, 100 ;D#
						dw  4063, 100 ;D
						dw  4304, 100 ;C#
						dw  10,5
						dw  3043, 100 ;G
						dw  3224, 100 ;F#
						dw  3416, 100 ;F
						dw  3619, 100 ;E
						dw  10,5
						dw  2559, 100 ;A#
						dw  2711, 100 ;A
						dw  2873, 100 ;G#
						dw  3043, 100 ;G
						dw  10,5
						dw  2152, 125 ;C#
						dw  10,250
						dw  4304, 800 ;C#
						dw  00h,00h

    sound_updown    	dw 5000,20
                        dw 0,0

    sound_select    	dw 5000,20
                        dw 1,10
                        dw 4000,20
                        dw 0,0

    sound_back      	dw 4000,20
                        dw 1,10
                        dw 5000,20
                        dw 0,0

    sound_exit      	dw 4000,20
                        dw 1,10
                        dw 5000,20
                        dw 1,10
                        dw 7000,20
                        dw 0,0

    sound_gameover  	dw 3000,20
                        dw 1,25
                        dw 3500,20
                        dw 1,25
                        dw 4000,20
                        dw 1,25
                        dw 4500,10
                        dw 1,25
                        dw 6000,10
                        dw 0,0
						
		.code
		org 0100h
start:
;;;;;;;;;;;;;;;;;page1 - Show menu ;;;;;;;;;;;;;;;;;;;;
	
page_1:
	mov		Score1,0
	mov		Score2,0
	mov		match,1
	mov		win1,0
	mov		win2,0
	mov		checkstart,0

	mov		ah, 00h			;Set screen 80*25  	
	mov		al, 03h
	int		10h

	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 3
	mov		dl, 0
	int		10h
	mov     ah, 09h			;Show logo
    mov     dx, offset mframe
    int     21h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 5
	mov		dl, 0
	int		10h
	mov     ah, 09h			;Show logo
    mov     dx, offset page1
    int     21h

	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 12
	mov		dl, 32
	int		10h
	mov     ah, 09h			;Print choice mode
    mov     dx, offset modec
    int     21h

	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 17
	mov		dl, 30
	int		10h
	mov     ah, 09h			;Print exit
    mov     dx, offset exit_txt
    int     21h
	
	mov     si, offset sound_game
	call    sound


whichMenu:
	mov		ah, 02h			; Move cursor
	mov		bh, 00h
	mov		dh, mode
	mov		dl, 30			
	int		10h
	mov     ah, 09h			
	mov		al, '>'
	mov		bh,	0
	mov		bl,	0Ah
	mov		cx, 1
	int     10h 
	
	mov		ah, 02h			; Move cursor
	mov		bh, 00h
	mov		dh, mode
	mov		dl, 47			
	int		10h
	mov     ah, 09h			
	mov		al, '<'
	mov		bh,	0
	mov		bl,	0Ah
	mov		cx, 1
	int     10h 

	mov		ah, 02h			; Hide cursor
	mov		bh, 00h
	mov		dh, -1
	mov		dl, -1
	int		10h

	mov		ah, 00h			; wait for typing keyboard (save in ah=alphabet ,al=ASCII)
	mov 	ax, 00h			; clear register 
	int		16h
	

	cmp 	al, 27			; ESC =27 in ASCII
	je	 	exit_game
	jmp		exit_game_end
exit_game:
	call	@end

exit_game_end:

	cmp		ah, 80			; Down Arrow = 80 in Scancode
	jnz		jmpsht2			; Next check key
	
	mov		ah, 02h			; Move cursor
	mov		bh, 00h
	mov		dh, mode
	mov		dl, 30			
	int		10h
	mov     ah, 09h			
	mov		al, '>'
	mov		bh,	0
	mov		bl,	00h			;print black color
	mov		cx, 1
	int     10h 
	
	mov		ah, 02h			; Move cursor
	mov		bh, 00h
	mov		dh, mode
	mov		dl, 47			
	int		10h
	mov     ah, 09h			
	mov		al, '<'
	mov		bh,	0
	mov		bl,	00h			;print black color
	mov		cx, 1
	int     10h 
	
	cmp		mode, 15
	jge		jmpsht1			; If row >= 15 skip to menu (not move >    <)
	inc		mode			; If not , mode++
    mov     si, offset sound_updown
    call    sound
jmpsht1:
	
	jmp		whichMenu			; jmp to menu for reset located of >,<
jmpsht2:
	cmp		ah, 72			; Up Arrow = 72 in Scancode
	jnz		jmpsht3			; loop menu until don't press Up/Down Arrow
	
	mov		ah, 02h			; Move cursor
	mov		bh, 00h
	mov		dh, mode
	mov		dl, 30			
	int		10h
	mov     ah, 09h			
	mov		al, '>'
	mov		bh,	0
	mov		bl,	00h			;print black color
	mov		cx, 1
	int     10h 
	
	mov		ah, 02h			; Move cursor
	mov		bh, 00h
	mov		dh, mode
	mov		dl, 47			
	int		10h
	mov     ah, 09h			
	mov		al, '<'
	mov		bh,	0
	mov		bl,	00h			;print black color
	mov		cx, 1
	int     10h 
	
	cmp		mode, 12
	jle		jmpsht1			; If row <= 12 skip to menu (not move >     <)
	dec		mode			; If not , mode--
    mov     si, offset sound_updown
    call    sound
	jmp		jmpsht1
jmpsht3:
	
	cmp		ax, 1C0Dh		; Check Enter key
	je		jmpsht5			; If Press Enter ,then go to next page
	jmp		jmpsht1			; If not , go to menu again
	
page_1_tmp12: jmp page_1
	
jmpsht5:
    mov     si, offset sound_select
    call    sound

	cmp		mode, 12		; Select easy
	je		PlayGame		
	cmp		mode, 13		; Select normal
	je		Playgame
	cmp		mode, 14		; Select hard
	je		PlayGame
	cmp		mode, 15		; Select how to play
	je		menu_help

PlayGame:
	mov     si, offset sound_loading
    call    sound
	cmp 	mode,12
	je		Mode_Easy
	cmp		mode,13
	je		Mode_Norm
	cmp		mode,14
	je		Mode_Hard
	
Mode_Easy:
	mov		ax,LevelE1		; Set speed of ball
	mov		Level1,ax
	mov		bx,LevelE2
	mov		Level2,bx
	jmp		page_2
Mode_Norm:
	mov		ax,LevelN1
	mov		Level1,ax
	mov		bx,LevelN2
	mov		Level2,bx
	jmp		page_2
Mode_Hard:
	mov		ax,LevelH1
	mov		Level1,ax
	mov		bx,LevelH2
	mov		Level2,bx
	jmp		page_2

menu_help:
	call	@help
	jmp		page_1
	
page_1_tmp11: jmp page_1_tmp12
;;;;;;;;;;;;;;;;;;;;;;;;page2 - Enter Name;;;;;;;;;;;;;;;;;;;;;;;;;;;
page_2:	mov		ah, 00h			;Set screen 80*25  	
		mov		al, 03h
		int		10h
		
		mov		ah, 02h			;Move cursor
		mov		bh, 00h
		mov		dh, 2
		mov		dl, 10
		int		10h
		
		mov     ah, 09h			;Show logo
		mov     dx, offset page2
		int     21h
		
		mov		ah, 02h			;Move cursor
		mov		bh, 00h
		mov		dh, 10
		mov		dl, 32
		int		10h
		
		mov     ah, 09h			;Show logo
		mov     dx, offset frame
		int     21h
		
		mov		ah, 02h			;Move cursor
		mov		bh, 00h
		mov		dh, 11
		mov		dl, 23
		int		10h
		
		mov     ah, 09h			;Show logo
		mov     dx, offset name1_txt
		int     21h
		
		mov		ah, 02h			;Move cursor
		mov		bh, 00h
		mov		dh, 14
		mov		dl, 32
		int		10h
		
		mov     ah, 09h			;Show logo
		mov     dx, offset frame
		int     21h
		
		mov		ah, 02h			;Move cursor
		mov		bh, 00h
		mov		dh, 15
		mov		dl, 23
		int		10h
		
		mov     ah, 09h			;Show logo
		mov     dx, offset name2_txt
		int     21h
		
		mov		ah, 02h			;Move cursor
		mov		bh, 00h
		mov		dh, 11
		mov		dl, 35
		int		10h
		
;======================Enter Name==========================;
;CAPTURE STRING FROM KEYBOARD.                                    
        mov ah, 0Ah 			;SERVICE TO CAPTURE STRING FROM KEYBOARD.
        mov dx, offset buff
        int 21h                 
		
;CHANGE CHR(13) BY '$'.
        mov si, offset buff + 1 ;NUMBER OF CHARACTERS ENTERED.
        mov cl, [ si ] 			;MOVE LENGTH TO CL.
        mov ch, 0      			;CLEAR CH TO USE CX. 
        inc cx					;TO REACH CHR(13).
        add si, cx 				;NOW SI POINTS TO CHR(13).
        mov al, '$'
        mov [ si ], al 			;REPLACE CHR(13) BY '$'.      
			
		
		mov		ah, 02h			;Move cursor
		mov		bh, 00h
		mov		dh, 15
		mov		dl, 35
		int		10h

;CAPTURE STRING FROM KEYBOARD.                                    
        mov ah, 0Ah 			;SERVICE TO CAPTURE STRING FROM KEYBOARD.
        mov dx, offset buff2
        int 21h                 
		
;CHANGE CHR(13) BY '$'.
        mov si, offset buff2 + 1 ;NUMBER OF CHARACTERS ENTERED.
        mov cl, [ si ] 			 ;MOVE LENGTH TO CL.
        mov ch, 0      			;CLEAR CH TO USE CX. 
        inc cx 					;TO REACH CHR(13).
        add si, cx 				;NOW SI POINTS TO CHR(13).
        mov al, '$'
        mov [ si ], al 			;REPLACE CHR(13) BY '$'. 
		
				
		mov		ah, 02h			; Hide cursor
		mov		bh, 00h
		mov		dh, -1
		mov		dl, -1
		int		10h

		mov     si, offset sound_play
		call    sound
		
		jmp Game
page_1_tmp10: jmp page_1_tmp11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Game:	
	mov		ah, 00h			;Set screen 80*25  	
	mov		al, 03h
	int		10h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 0
	mov		dl, 2
	int		10h
	mov     ah, 09h			;Show name player1
    mov     dx, offset p1
    int     21h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 0
	mov		dl, 59
	int		10h
	mov     ah, 09h			;Show name player2
    mov     dx, offset p2
    int     21h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 0
	mov		dl, 30
	int		10h
	mov     ah, 09h			;Print exit
    mov     dx, offset exit_txt
    int     21h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 0
	mov		dl, 11
	int		10h
			
	mov ah, 9 				;SERVICE TO DISPLAY STRING.
    mov dx, offset buff + 2 ;MUST END WITH '$'.
    int 21h
			
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 0
	mov		dl, 68
	int		10h
			
	mov ah, 9 				 ;SERVICE TO DISPLAY STRING.
    mov dx, offset buff2 + 2 ;MUST END WITH '$'.
    int 21h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 33
	int		10h
	mov     ah, 09h			
    mov     dx, offset match_txt
    int     21h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 39
	int		10h
	mov     ah, 09h			;Show order of match
	add     match, 30h
	mov		al, match
	mov		bh,	0
	mov		bl,	07h
	mov		cx, 1
	int     10h
	sub     match, 30h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 42
	int		10h
	mov     ah, 09h			;Show amount of winner1
	add     win1, 30h
	mov		al, win1
	mov		bh,	0
	mov		bl,	07h
	mov		cx, 1
	int     10h
	sub     win1, 30h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 44
	int		10h
	mov     ah, 09h			;Show amount of winner2
	add     win2, 30h
	mov		al, win2
	mov		bh,	0
	mov		bl,	07h
	mov		cx, 1
	int     10h
	sub     win2, 30h


	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 2
	int		10h
	mov     ah, 09h			;Show text Score
    mov     dx, offset score_txt
    int     21h
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 70
	int		10h
	mov     ah, 09h			;Show text Score
    mov     dx, offset score_txt
    int     21h

	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 1
	mov		dl, 2
	int		10h

	mov     ah, 09h			
	mov		al, '_'
	mov		bh,	0
	mov		bl,	01h
	mov		cx, 76
	int     10h 
	
	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 22
	mov		dl, 2
	int		10h

	mov     ah, 09h			
	mov		al, '_'
	mov		bh,	0
	mov		bl,	01h
	mov		cx, 76
	int     10h 


row_L:	mov		ah, 02h		;Move cursor
	mov		bh, 00h
	mov		dh, row1
	mov		dl, 1
	int		10h
	
	mov     ah, 09h			
	mov		al, '|'
	mov		bh,	0
	mov		bl,	01h
	mov		cx, 1
	int     10h 
	
	inc		row1
	cmp		row1,22
	jle		row_L
	mov		row1,2
	jmp     row_R

main_tmp7: jmp main
Game_tmp6: jmp Game
page_1_tmp9: jmp page_1_tmp10
row_R:	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, row2
	mov		dl, 78
	int		10h
	
	mov     ah, 09h			
	mov		al, '|'
	mov		bh,	0
	mov		bl,	01h
	mov		cx, 1
	int     10h 
	
	inc		row2
	cmp		row2,22
	jle		row_R
	mov		row2,2
	jmp 	main

Game_tmp5: jmp Game_tmp6
page_1_tmp8: jmp page_1_tmp9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GAME;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
main:
b_l:mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, b1
	mov		dl, 8
	int		10h
	
	mov     ah, 09h			
	mov		al, '|'
	mov		bh,	0
	mov		bl,	04h
	mov		cx, 1
	int     10h 
	
	inc		b1
	cmp		b1,21
	jle		b_l
	mov     b1,3
	jmp		b_r

b_r:mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, b2
	mov		dl, 71
	int		10h
	
		mov     ah, 09h			
	mov		al, '|'
	mov		bh,	0
	mov		bl,	04h
	mov		cx, 1
	int     10h 
	
	inc		b2
	cmp		b2,21
	jle		b_r	
	mov		b2,3

Update_Scr:			
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 9
	int		10h
	mov     ah, 09h			;Show Score player1
	add     Score1, 30h
	mov		al, Score1
	mov		bh,	0
	mov		bl,	07h
	mov		cx, 1
	int     10h
	sub     Score1, 30h
			
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, 24
	mov		dl, 77
	int		10h
	mov     ah, 09h			;Show Score player2
	add     Score2, 30h
	mov		al, Score2
	mov		bh,	0
	mov		bl,	07h
	mov		cx, 1
	int     10h
	sub     Score2, 30h

L:	mov		ah,row_tmpL
	mov 	row_pad1,ah
	add		row_pad1,4h
pad_L: 	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh, row_tmpL
	mov		dl, 6
	int		10h
	
	mov     ah, 09h			;Creat paddle of player1
	mov		al, 'X'
	mov		bh,	0
	mov		bl,	0Bh
	mov		cx, 1
	int     10h 
	
	inc		row_tmpL
	mov		ah,row_pad1
	cmp		row_tmpL,ah
	jle		pad_L
	sub		row_tmpL,5h
	mov     ah,row_tmpL
	mov		row_pad1,ah
	jmp		R
;-----------------------------------------
Game_tmp4: jmp Game_tmp5	
main_tmp5: jmp main
pad_L_tmp: jmp pad_L
page_1_tmp7: jmp page_1_tmp8
;-----------------------------------------
R:	mov		ah, row_tmpR
	mov 	row_pad2,ah
	add		row_pad2,4h
pad_R:	
	mov		ah, 02h			;Move cursor
	mov		bh, 00h
	mov		dh,row_tmpR
	mov		dl, 73
	int		10h
	
	mov     ah, 09h			;Creat paddle of player2
	mov		al, 'X'
	mov		bh,	0
	mov		bl,	0Eh
	mov		cx, 1
	int     10h 
	
	inc		row_tmpR
	mov     ah,row_pad2
	cmp		row_tmpR,ah
	jle		pad_R
	sub		row_tmpR,5h
	mov     ah,row_tmpR
	mov		row_pad2,ah
	
	mov		ah, 02h			; Hide cursor
	mov		bh, 00h
	mov		dh, -1
	mov		dl, -1
	int		10h
	
	mov		ah,row_tmpL
	mov		checkcrashL,ah
	mov		ah,row_tmpR
	mov		checkcrashR,ah
	
	cmp  	checkstart,0
	je		restart
	jmp		setball
Game_tmp3: jmp Game_tmp4
page_1_tmp6: jmp page_1_tmp7		
restart:	mov 	ah, 02h				;set cursor position
			mov 	bh, 00h
			mov 	dh, row 			;row before add rowdummy
			mov 	dl, col				;column	before add coldummy
			int 	10h

			mov     ah, 09h   			;set colour
			mov     al, '@'
			mov     bh, 00h
			mov     bl, 00h				;black colour
			mov     cx, 01h
			int     10h
			
			mov 	ah, 02h				;set cursor position
			mov 	bh, 00h
			mov 	dh, 12 				;row 
			mov 	dl, 40				;column
			int 	10h

			mov     ah, 09h   			;set colour
			mov     al, '@'
			mov     bh, 00h
			mov     bl, 0Ah
			mov     cx, 01h
			int     10h
			
			mov		ah, 02h			; Hide cursor
			mov		bh, 00h
			mov		dh, -1
			mov		dl, -1
			int		10h	
			
			mov		row,12
			mov 	col,40
			mov		rowold,12
			mov 	colold,40
			cmp		checkleftlost,1
			je		soundleftlost
			cmp		checkrightlost,1
			je		soundrightlost
			jmp		setball

soundleftlost:
			mov ax,0
			push ax
			push dx
			push cx
			push bx
			mov     al, 182         ; Prepare the speaker for the
					out     43h, al         ;  note.
					mov     ax, 5000		; Frequency number (in decimal)
									;  for middle C.
					out     42h, al         ; Output low byte.
					mov     al, ah          ; Output high byte.
					out     42h, al
					in      al, 61h         ; Turn on note (get value from
																	;  port 61h).
					or      al, 00000011b   ; Set bits 1 and 0.
					out     61h, al         ; Send new value.
					mov     bx, 1 ; Pause for duration of note.


		.pppause1:
					mov     cx, 65535


		.pppause2:
					dec     cx
					jne     .pppause2
					dec     bx
					jne     .pppause1
					in      al, 61h         ; Turn off note (get value from
																	;  port 61h).
					and     al, 11111100b   ; Reset bits 1 and 0.
					out     61h, al         ; Send new value.
			pop ax
			pop dx
			pop cx
			pop bx
			jmp leftlost
			
soundrightlost:
			mov ax,0
			push ax
			push dx
			push cx
			push bx
			mov     al, 182         ; Prepare the speaker for the
					out     43h, al         ;  note.
					mov     ax, 5000		; Frequency number (in decimal)
									;  for middle C.
					out     42h, al         ; Output low byte.
					mov     al, ah          ; Output high byte.
					out     42h, al
					in      al, 61h         ; Turn on note (get value from
																	;  port 61h).
					or      al, 00000011b   ; Set bits 1 and 0.
					out     61h, al         ; Send new value.
					mov     bx, 1 ; Pause for duration of note.


		.ppppause1:
					mov     cx, 65535


		.ppppause2:
					dec     cx
					jne     .ppppause2
					dec     bx
					jne     .ppppause1
					in      al, 61h         ; Turn off note (get value from
																	;  port 61h).
					and     al, 11111100b   ; Reset bits 1 and 0.
					out     61h, al         ; Send new value.
			pop ax
			pop dx
			pop cx
			pop bx
			jmp rightlost
			
leftlost:
			mov		checkleftlost,0
			mov 	rowdummy,1
			mov 	coldummy,1
			jmp		setball
			
rightlost:	mov 	checkrightlost,0
			mov 	rowdummy,1
			mov 	coldummy,-1
			jmp 	setball
			
setball:	mov 	ah, 02h				;set cursor position
			mov 	bh, 00h
			mov 	dh, row 			;row 
			mov 	dl, col				;column
			int 	10h

			mov     ah, 09h   			;set colour
			mov     al, '@'
			mov     bh, 00h
			mov     bl, 0Ah
			mov     cx, 01h
			int     10h
			
			mov		ah, 02h				; Hide cursor
			mov		bh, 00h
			mov		dh, -1
			mov		dl, -1
			int		10h
			jmp		checkstartgame
;--------------------------------------------			
Game_tmp2: jmp Game_tmp3		
;--------------------------------------------	
checkstartgame:
			cmp		checkstart,0	;press spacebar only when start game
			jne		ReadKey
			
Readspacebar:
			mov		checkstart,1	
			
			mov		ah, 02h			;Move cursor
			mov		bh, 00h
			mov		dh, 6
			mov		dl, 22
			int		10h
			
			mov     ah, 09h			;Show logo
			mov     dx, offset spcbar
			int     21h
			
			mov		ah, 02h			; Hide cursor
			mov		bh, 00h
			mov		dh, -1
			mov		dl, -1
			int		10h
			
			mov 	ah,00h			;keyboard
			int 	16h
			
			
			
			cmp 	ah,39h			;spacebar
			je		Deletetxt
			cmp     al,27
			jz 		page_1_tmp5
			
			jmp		Readspacebar
	

			
Deletetxt:  mov		ah, 02h			;Move cursor
			mov		bh, 00h
			mov		dh, 6
			mov		dl, 22
			int		10h
			mov     ah, 09h   		;set colour
			mov     al, '0'
			mov     bh, 00h
			mov     bl, 00h
			mov     cx, 22h
			int     10h

			jmp 	ReadKey

ReadKey:	
			
			mov 	ah, 01h 		;Check buffer
			int		16h
			jz		movepositionball;Buffer not empty
	
			
			mov 	ah,00h			;keyboard
			int 	16h
			
			jmp		Find_rt
			
Find_rt:	cmp     al,27			;Press 'ESC'
			jz 		page_1_tmp5
			cmp     ah,80			;Press Down Arrow
			jz		jmp_Down_shf_R_tmp	
			cmp		ah,72			;Press Up Arrow
			jz      jmp_Up_shf_R_tmp
			cmp     ah,1Fh			;Press 'S'
			jz      jmp_Down_shf_L
			cmp     ah,11h	
			jz      jmp_Up_shf_L	;Press 'W'
			
			jmp		movepositionball ;jmp to shift ball
			
;;;;;;;;;;;;;;;;;;;;jump zone;;;;;;;;;;;;;;;;;;;;;;;;;
jmp_main_tmp4: jmp main_tmp4
jmp_Down_shf_R_tmp: jmp	Down_shf_R_tmp
jmp_Up_shf_R_tmp: jmp Up_shf_R_tmp
jmp_Down_shf_L : jmp Down_shf_L
jmp_Up_shf_L : jmp Up_shf_L
jmpmain : jmp main
Game_tmp1: jmp Game_tmp2
page_1_tmp5:;mov     si, offset sound_play
			;call    sound
			jmp 	page_1_tmp6
overgame_tmp: jmp overgame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

movepositionball:
			mov 	ah, 02h				;set cursor position
			mov 	bh, 00h
			mov 	dh, row 			;row before add rowdummy
			mov 	dl, col				;column	before add coldummy
			int 	10h

			mov     ah, 09h   			;set colour
			mov     al, '@'
			mov     bh, 00h
			mov     bl, 00h				;black colour
			mov     cx, 01h
			int     10h
			
			mov		ah, 02h				; Hide cursor
			mov		bh, 00h
			mov		dh, -1
			mov		dl, -1
			int		10h
			
			mov		ah,rowdummy
			add		row,ah
			mov		ah,coldummy
			add		col,ah
			
			mov 	ah, 02h				;set cursor position
			mov 	bh, 00h
			mov 	dh, row 			;row 
			mov 	dl, col				;column
			int 	10h
			jmp		printad
			
Game_tmp: 	inc     match
			cmp     match, 4
			jz      overgame
			mov		Score1,0
			mov		Score2,0
			jmp 	Game_tmp1
overgame:	call 	@gameover
			jmp		exit_tmp4
			
printad:	mov     ah, 09h   			;set colour
			mov     al, '@'
			mov     bh, 00h
			mov     bl, 0Ah
			mov     cx, 01h
			int     10h
			
			mov		ah, 02h				; Hide cursor
			mov		bh, 00h
			mov		dh, -1
			mov		dl, -1
			int		10h
			
			mov		cx,  Level1			;Set delay time
			mov		dx,  Level2
			mov		ah,  86h
			int		15h
			
			cmp 	row,21
			je		jmpcheckcornerlow
			cmp		row,2
			je		jmpcheckcornerhigh
			cmp		col,72
			je		jmpcheckpaddleright
			cmp		col,7
			je		jmpcheckpaddleleft
			cmp		col,2
			je		restartmain1						;left lost
			cmp		col,77
			je		restartmain2						;right lost
			jmp		ReadKey

restartmain1: 
			mov		checkleftlost,1
			mov 	checkstart,0
			inc     Score2
			cmp     Score2, 5
			jz		Game_tmp_R
			jmp		main
			
Game_tmp_R: inc     win2			;player2 get Score
			jmp 	Game_tmp

restartmain2: 
			mov 	checkrightlost,1
			mov 	checkstart,0
			inc     Score1
			cmp     Score1, 5
			jz		Game_tmp_L
			jmp		main

Game_tmp_L: inc     win1			;player2 get Score
			jmp 	Game_tmp
	
;;;;;;;;;;;jump zone;;;;;;;;;;;;
jmpleftdown: jmp leftdown
jmpleftup: jmp leftup
jmprightup: jmp rightup
jmprightdown: jmp rightdown
jmpexit_esc: jmp exit_esc	
jmpcheckpaddleright: jmp checkpaddleright
jmpcheckpaddleleft: jmp checkpaddleleft
jmpcheckcornerhigh: jmp checkcornerhigh
jmpcheckcornerlow: jmp checkcornerlow
jmpbeepL: jmp beepL
page_1_tmp4: jmp page_1_tmp5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;;;;;;check if ball go to corner, let ball bounce to old position;;;;;;;;;;						
checkcornerlow:
			cmp		col,72
			je		jmpleftup
			cmp 	col,7
			je		jmprightup
			jmp 	edgelow
			
checkcornerhigh:
			cmp		col,72
			je		jmpleftdown
			cmp 	col,7
			je		jmprightdown
			jmp 	edgehigh
			
;;;;;;;;if the ball crash paddle;;;;;;;;;;;;;;;
checkpaddleleft:
			mov		ah,row
			sub		checkcrashL,1h
			cmp		checkcrashL,ah
			je		jmpbeepL
			add		checkcrashL,1h
			cmp		checkcrashL,ah
			je		jmpbeepL
			add		checkcrashL,1h
			cmp		checkcrashL,ah
			je		jmpbeepL
			add		checkcrashL,1h
			cmp		checkcrashL,ah
			je		jmpbeepL
			add		checkcrashL,1h
			cmp		checkcrashL,ah
			je		jmpbeepL
			add		checkcrashL,1h
			cmp		checkcrashL,ah
			je		jmpbeepL
			add		checkcrashL,1h
			cmp		checkcrashL,ah
			je		jmpbeepL
			jmp		ReadKey
			
checkpaddleright:
			mov		ah,row
			sub		checkcrashR,1h
			cmp		checkcrashR,ah
			je		jmpbeepR
			add		checkcrashR,1h
			cmp		checkcrashR,ah
			je		jmpbeepR
			add		checkcrashR,1h
			cmp		checkcrashR,ah
			je		jmpbeepR
			add		checkcrashR,1h
			cmp		checkcrashR,ah
			je		jmpbeepR
			add		checkcrashR,1h
			cmp		checkcrashR,ah
			je		jmpbeepR
			add		checkcrashR,1h
			cmp		checkcrashR,ah
			je		jmpbeepR
			add		checkcrashR,1h
			cmp		checkcrashR,ah
			je		jmpbeepR
			jmp		ReadKey
			
;;;;;;;;;;;;;;;;;jump zone;;;;;;;;;;;;;;;;;;

jmpbeepR: jmp beepR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;sound when ball crash paddle;;;;;;;;;;;;;;;;;;;;;;;;;;;
beepL:
			mov ax,0
			push ax
			push dx
			push cx
			push bx
			mov     al, 182         ; Prepare the speaker for the
					out     43h, al         ;  note.
					mov     ax, 1140		; Frequency number (in decimal)
									;  for middle C.
					out     42h, al         ; Output low byte.
					mov     al, ah          ; Output high byte.
					out     42h, al
					in      al, 61h         ; Turn on note (get value from
																	;  port 61h).
					or      al, 00000011b   ; Set bits 1 and 0.
					out     61h, al         ; Send new value.
					mov     bx, 1 ; Pause for duration of note.


		.pause1:
					mov     cx, 65535


		.pause2:
					dec     cx
					jne     .pause2
					dec     bx
					jne     .pause1
					in      al, 61h         ; Turn off note (get value from
																	;  port 61h).
					and     al, 11111100b   ; Reset bits 1 and 0.
					out     61h, al         ; Send new value.
			pop ax
			pop dx
			pop cx
			pop bx
			jmp edgeleft
			
beepR:
			mov ax,0
			push ax
			push dx
			push cx
			push bx
			mov     al, 182         ; Prepare the speaker for the
					out     43h, al         ;  note.
					mov     ax, 1140		; Frequency number (in decimal)
									;  for middle C.
					out     42h, al         ; Output low byte.
					mov     al, ah          ; Output high byte.
					out     42h, al
					in      al, 61h         ; Turn on note (get value from
																	;  port 61h).
					or      al, 00000011b   ; Set bits 1 and 0.
					out     61h, al         ; Send new value.
					mov     bx, 1 ; Pause for duration of note.


		.ppause1:
					mov     cx, 65535


		.ppause2:
					dec     cx
					jne     .ppause2
					dec     bx
					jne     .ppause1
					in      al, 61h         ; Turn off note (get value from
																	;  port 61h).
					and     al, 11111100b   ; Reset bits 1 and 0.
					out     61h, al         ; Send new value.
			pop ax
			pop dx
			pop cx
			pop bx
			jmp edgeright
			
;;;;;;;;;;;;jump zone;;;;;;;;;;;;;
page_1_tmp3: jmp page_1_tmp4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;if the ball found edge;;;;;;;;;;;;;;;			
edgelow:	mov		ah,col
			cmp		colold,ah
			jl		rightup
			jmp		leftup

edgehigh:	mov		ah,col
			cmp		colold,ah
			jl		rightdown
			jmp		leftdown
			
edgeright:	mov 	ah,row
			cmp		rowold,ah
			jl		leftdown
			jmp		leftup
			
edgeleft:	mov 	ah,row
			cmp		rowold,ah
			jl		rightdown
			jmp		rightup
			
;;;;;;;;;;;;next position of ball;;;;;;;;;;;;;;;;;;;			
rightup:	mov		ah,row
			mov		rowold,ah
			mov		ah,col
			mov		colold,ah
			mov		coldummy,1
			mov		rowdummy,-1
			jmp		ReadKey

leftup:		mov		ah,row
			mov		rowold,ah
			mov		ah,col
			mov		colold,ah
			mov		coldummy,-1
			mov		rowdummy,-1
			jmp		ReadKey	

rightdown:	mov		ah,row
			mov		rowold,ah
			mov		ah,col
			mov		colold,ah
			mov		coldummy,1
			mov		rowdummy,1
			jmp		ReadKey			
			
leftdown:	mov		ah,row
			mov		rowold,ah
			mov		ah,col
			mov		colold,ah
			mov		coldummy,-1
			mov		rowdummy,1
			jmp		ReadKey	
			
;========================Shift paddle player1=============================			
	
Down_shf_L:							;Shift paddle Down
			mov 	al,	row_tmpL		
			mov 	keep, al
			cmp		row_tmpL, 16
			jg		Restart_Down_L
			inc		row_tmpL			
			jmp     Restart_Down_L
			
main_tmp4: jmp main_tmp5

Restart_Down_L:						
			
			mov 	ah,	02h
			mov 	dh,	keep
			mov 	dl, 6
			int 	10h
			
			mov 	ah, 09h 		; Write a colored char
			mov 	al, ' '
			mov 	bh, 00
			mov 	bl, 00h 		; black Color
			mov 	cx , 1
			int 	10h
			jmp     main_tmp3
			
Up_shf_R_tmp: jmp Up_shf_R_tmp2
Down_shf_R_tmp: jmp Down_shf_R_tmp2
main_tmp3: jmp main_tmp4		
	
Up_shf_L:							;Shift paddle Up
			cmp		row_tmpL, 3
			jle		Restart_Up_L			
			dec     row_tmpL
			jmp     Restart_Up_L
			
Restart_Up_L:
			mov 	al,	row_tmpL
			mov 	keep, al
			add		keep, 5h

			mov 	ah, 02h
			mov 	dh, keep
			mov 	dl, 6
			int 	10h
			
			mov 	ah, 09h 	; Write a colored char
			mov 	al, ' '
			mov 	bh, 00
			mov 	bl, 00h 	; black Color
			mov 	cx , 1
			int 	10h
			jmp     main_tmp2
;-----------------------------------------------------------------			
main_tmp2: jmp main_tmp3
Up_shf_R_tmp2: jmp Up_shf_R
Down_shf_R_tmp2: jmp Down_shf_R
page_1_tmp2: jmp page_1_tmp3
;--------------------------------------------------------------------

;========================Shift paddle player2=============================	

Down_shf_R:							;Shift paddle Down
			mov 	al,	row_tmpR		
			mov 	keep, al
			cmp		row_tmpR, 16
			jg		Restart_Down_R
			inc		row_tmpR			
			jmp     Restart_Down_R

main_tmp1:  jmp		main_tmp2
			
Restart_Down_R:
			mov 	ah,	02h
			mov 	dh,	keep
			mov 	dl, 73
			int 	10h
			
			mov 	ah, 09h 		; Write a colored char
			mov 	al, ' '
			mov 	bh, 00
			mov 	bl, 00h 		; black Color
			mov 	cx , 1
			int 	10h
			
			jmp 	main_tmp1

Up_shf_R:							;Shift paddle Up
			cmp		row_tmpR, 3
			jle		Restart_Up_R			
			dec     row_tmpR
			jmp     Restart_Up_R
			
Restart_Up_R:
			mov 	al,	row_tmpR
			mov 	keep, al
			add		keep, 5h

			mov 	ah, 02h
			mov 	dh, keep
			mov 	dl, 73
			int 	10h
			
			mov 	ah, 09h 	; Write a colored char
			mov 	al, ' '
			mov 	bh, 00
			mov 	bl, 00h 	; black Color
			mov 	cx , 1
			int 	10h
			jmp     main_tmp1	
			
page_1_tmp1: jmp page_1_tmp2
;====================== @help =========================;
@help		proc
	mov		ah, 00h			; clear screen	
	mov		al, 03h
	int		10h

	mov		ah, 02h			; move cursor
	mov		bh, 00h
	mov		dh, 1
	mov		dl, 0
	int		10h
	mov     ah, 09h
    mov     dx, offset howto
    int     21h
	
	mov		ah, 02h			; move cursor
	mov		bh, 00h
	mov		dh, 5
	mov		dl, 3
	int		10h
	mov     ah, 09h
    mov     dx, offset how1
    int     21h

	mov		ah, 02h			; move cursor
	mov		bh, 00h
	mov		dh, 21
	mov		dl, 18
	int		10h
	mov     ah, 09h
    mov     dx, offset how4
    int     21h

	mov		ah, 00h			; wait for typing keyboard 
	xor		ax, ax
	int		16h
    mov     si, offset sound_back ; wait already , play sound
    call    sound
	ret
@help		endp
;====================== @help =========================;
page_1_tmpp: jmp page_1_tmp1
;====================== @gameover =========================;
@gameover	proc
	mov		ah, 00h			; clear screen	
	mov		al, 03h
	int		10h

	mov		ah, 02h			; set cursor
	mov		bh, 00h
	mov		dh, 5
	mov		dl, 0
	int		10h
	mov     ah, 09h			;Show logo
    mov     dx, offset winner_txt
    int     21h
	
	mov		ah, win2
	cmp		win1, ah
	jg		win1win
	jl		win2win
	jmp		choice
win1win:
	mov		ah, 02h			; set cursor
	mov		bh, 00h
	mov		dh, 12
	mov		dl, 31
	int		10h
	
	mov ah, 9 ;SERVICE TO DISPLAY STRING.
    mov dx, offset p1
    int 21h

	mov		ah, 02h			; set cursor
	mov		bh, 00h
	mov		dh, 12
	mov		dl, 40
	int		10h
	
	mov ah, 9 ;SERVICE TO DISPLAY STRING.
    mov dx, offset buff + 2 ;MUST END WITH '$'.
    int 21h

	jmp		choice
	
page_1_tmp: jmp page_1_tmpp
	
win2win:
	mov		ah, 02h			; set cursor
	mov		bh, 00h
	mov		dh, 12
	mov		dl, 31
	int		10h
	
	mov ah, 9 ;SERVICE TO DISPLAY STRING.
    mov dx, offset p2
    int 21h
	
	mov		ah, 02h			; set cursor
	mov		bh, 00h
	mov		dh, 12
	mov		dl, 40
	int		10h
	
	mov ah, 9 ;SERVICE TO DISPLAY STRING.
    mov dx, offset buff2 + 2 ;MUST END WITH '$'.
    int 21h
	
	jmp		choice
choice:
	mov		ah, 02h			; set cursor
	mov		bh, 00h
	mov		dh, 15
	mov		dl, 29
	int		10h
	mov     ah, 09h			;Show logo
    mov     dx, offset key_txt
    int     21h
	
	mov		ah, 02h			; set cursor
	mov		bh, 00h
	mov		dh, 16
	mov		dl, 29
	int		10h
	mov     ah, 09h			;Show logo
    mov     dx, offset exit_txt
    int     21h
	
    mov     si, offset sound_gameover
    call    sound
waitp:
	mov		ah, 00h			; wait for select
	xor		ax, ax
	int		16h
	cmp		ah,39h
	jz		page_1_tmp
	cmp   	al,27
	jz      exitt
	jmp		waitp
exitt:    mov     si, offset sound_back
    call    sound
	ret
@gameover		endp
;====================== @gameover =========================;

exit_tmp4:	jmp exit_esc


;====================== @end =========================;			
@end	proc
		mov  si, offset sound_exit
	    call sound
		mov	 ah, 00h			; Set screen 80*25 (clear screen)
		mov	 al, 03h
		int	 10h
	
		mov  ah, 4Ch 		; Terminate with Error Code
		int  21h 
		ret
			
@end		endp
;====================== @end ========================
;====================== @sound ========================
sound proc
        push ds
        pop  es
           
        mov  dx,61h                  ; turn speaker on
        in   al,dx                   ;
        or   al,03h                  ;
        out  dx,al                   ;
        mov  dx,43h                  ; get the timer ready
        mov  al,0B6h                 ;
        out  dx,al                   ;

LoopIt: lodsw                        ; load desired freq.
        or   ax,ax                   ; if freq. = 0 then done
        jz   short LDone             ;
        mov  dx,42h                  ; port to out
        out  dx,al                   ; out low order
        xchg ah,al                   ;
        out  dx,al                   ; out high order
        lodsw                        ; get duration
        mov  cx,ax                   ; put it in cx (16 = 1 second)
        call PauseIt                 ; pause it
        jmp  short LoopIt

LDone:  mov  dx,61h                  ; turn speaker off
        in   al,dx                   ;
        and  al,0FCh                 ;
        out  dx,al                   ;

        ret
sound endp

PauseIt proc
        mov  ax,0040h
        mov  es,ax

        ; wait for it to change the first time
        mov  al,es:[006Ch]
@a:     cmp  al,es:[006Ch]
        je   short @a

        ; wait for it to change again
loop_it:mov  al,es:[006Ch]
@b:     cmp  al,es:[006Ch]
        je   short @b

        sub  cx,55
        jns  short loop_it

        ret
PauseIt endp
;=====================sound==========================;
			
			
			
exit_esc:	mov		ah, 00h			;Set screen 80*25  	
			mov		al, 03h
			int		10h
			ret
			end start