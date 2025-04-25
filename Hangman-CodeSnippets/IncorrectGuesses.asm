; Check if the guessed letter was incorrect
mov al, flag2        ; flag2 is set to 1 in `checkGuess` if the letter is NOT in the word
cmp al, 0            ; check if it's zero (means guess was correct)
jz match             ; jump to "match" label if guess was correct

; If letter was incorrect, show a message and reduce a life
mov ah,40h           ; function to write string (used with interrupt 10h here for styling)
mov bx,1             ; file handle (stdout)
mov cx,SIZEOF msg7-3 ; size of incorrect message
mov si,offset msg7   ; address of incorrect letter message
mov dx,OFFSET msg7   ; redundant, used by custom 'coloring'
call coloring        ; print colored message
int 10h              ; BIOS interrupt to display on screen

call crlf            ; move cursor to new line

mov al, numTry       ; load current number of remaining tries
dec al               ; decrease number of tries (life lost!)
mov numTry, al       ; save updated number of tries
jmp nextt            ; jump to continue next round
