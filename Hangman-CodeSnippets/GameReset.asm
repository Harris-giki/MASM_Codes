blankArray proc
xor ecx,ecx
xor esi, esi
mov ecx, 10              ; loop 10 times (max month size)

blank:
mov hide_month[esi], '-' ; set guessed letters to '-'
int 10h                  ; visual cursor move (can be skipped)
mov month[esi], 0        ; clear actual month
mov monthC[esi],0        ; copy used for logic/comparison

inc esi
Loop blank

mov count, 0             ; reset character count
mov letter, 0            ; reset input letter
mov numtry, 3            ; reset tries to 3
mov flag1, 0             ; clear win flag
mov flag2, 0             ; clear incorrect guess flag
ret
blankArray endp
