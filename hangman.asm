data segment ;message display   
    
    welcome_message db "Eman Sarah Afi (A00051) Presents: HANGMAN (X_X)"
    new_line1 db 13, 10, "$" 
    
    
    instruction db "Guess the right letters for the word. Guessing a wrong letter will lose a life. You have SIX LIVES in total. GOOD LUCK!"
    
    new_line2 db 13, 10, "$" 
    
    
    
    type_message db "Type a letter: "
    new_line3 db 13, 10, "$"
    
    hangman_0 db " ______$"
    hangman_1 db "  |   |$"
    hangman_2 db "  | (X_X)$"
    hangman_3 db "  |  /|\$" 
    hangman_4 db "  |  / \$"
    hangman_5 db " _|_$"
    hangman_6 db "|   |   $"
    next_line db 0ah, 0dh, "$"
    
    win_lose_message db "GAME OVER!$"
    new_line4 db 13, 10, "$" 
    
    new_line5 db 13, 10, "$" 
    
    new_line6 db 13, 10, "$"
    
    word db "CHALLENGE$"
  
               
    discovered_word db 9 dup ("_"), "$"
    
   
    word_size db 9
     
    
    lives db 6                 
    hits db 0
    errors db 0  
    



ends 


stack segment
    dw   128  dup(?)
ends         

extra segment
    
ends

code segment
start:
    ;set segment registers
    mov     ax, data
    mov     ds, ax
    mov     ax, extra
    mov     es, ax    
   
     

;loops          
main_loop:
    lea     dx, welcome_message
    call    print  
    lea     dx, new_line1
    call    print  
    call    print 
    
    lea     dx,  new_line2
    call    print
    call    print
    lea     dx, instruction
    call    print
    
    lea     dx, new_line3
    call    print
    call    print 
    
    
    lea     dx, discovered_word
    call    print 
    
    lea     dx, new_line4
    call    print    
    call    print
 
    lea     dx, type_message
    call    print
    
    lea     dx, new_line5
    call    print
    call    print              

    call    check
    
    call    read_keyboard   
    call    update
    
    
    call    clear_screen     
    loop    main_loop 
          
          
check:                   
    mov     bl, ds:[lives] 
    mov     bh, ds:[errors]
    cmp     bl, bh 
    je      game_over_lose
    
    mov     bl, ds:[word_size]  
    mov     bh, ds:[hits]
    cmp     bl, bh 
    je      game_over_win
    
    ret          
    
    
update:  
    lea     si, word
    lea     di, discovered_word   
    mov     bx, 0
        
    update_loop:
    cmp     ds:[si], "$"
    je      end_word

    
    ; check if letter is already taken
    cmp     ds:[di], al
    je      increment
    
    
    ; check if letter is on the word    
    cmp     ds:[si], al
    je      equals
                 
    increment:
    inc     si
    inc     di   
    jmp     update_loop    
                 
    equals:
    mov     ds:[di], al
    inc     hits

    
    mov     bx, 1
    jmp     increment             
    
    end_word:  
    cmp     bx, 1
    je      end_update
    inc     errors
    
    
    end_update:
    ret

;what happens when the player finishes the game (win or lose)
game_over_lose: 
    call    print_hangman
     
    lea     dx, next_line
    mov     ah, 9
    int     21h
    
 
    lea     dx, win_lose_message
    call    print
    lea     dx, new_line6
    call    print
    call    print  
    
    
    jmp     fim  
    
game_over_win:
    lea     dx, win_lose_message
    call    print
    
    jmp     fim
                 
    
    
print_hangman: ;printing hangman
    mov ah, 09h
    mov dx, offset hangman_0
    int 21h
    lea dx,next_line

    mov ah,9

    int 21h  
    mov ah, 09h
    mov dx, offset hangman_1
    int 21h   
    lea dx,next_line 

    mov ah,9

    int 21h  
        
        
    mov ah, 09h
    mov dx, offset hangman_2
    int 21h      
        
    lea dx,next_line 

    mov ah,9

    int 21h 
        
    mov ah, 09h
    mov dx, offset hangman_3
    int 21h      
        
    lea dx,next_line 

    mov ah,9

    int 21h  
        
    mov ah, 09h
    mov dx, offset hangman_4
    int 21h       
        
        
    lea dx,next_line 

    mov ah,9

    int 21h  
        
    mov ah, 09h
    mov dx, offset hangman_5
    int 21h    
        
    lea dx,next_line 

    mov ah,9

    int 21h  
        
    mov ah, 09h
    mov dx, offset hangman_6
    int 21h
    
    
    
    ret  
  
clear_screen:   ; get and set video mode
    mov     ah, 0fh
    int     10h   
    
    mov     ah, 0
    int     10h
  
    
    ret
        

  
read_keyboard:  ; read keyboard and return in al
    mov     ah, 1
    int     21h
    
    ret
    

print:
    mov     ah, 9
    int     21h
    
    ret

    
FIM:
    jmp     fim         
      
code ends

end start 