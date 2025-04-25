match:
mov ah,40h           ; prepare to show correct guess message
mov bx,1             ; file handle
mov cx,SIZEOF msg8-3
mov si,offset msg8
mov dx,OFFSET msg8
call coloring        ; print colored message for correct guess
int 10h              ; display

call crlf            ; move to a new line
