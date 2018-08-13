;SCAN A STRING AND CHECK PALINDROME OR NOT

DATA SEGMENT
    NEWLINE DB 10,13,"$"  
    MSG1 DB 10,13,"LENGTH: $" 
    MSG2 DB 10,13,"INPUT STRING IS: $"
    MSG3 DB 10,13,"PALINDROME$"
    MSG4 DB 10,13,"NOT PALINDROME$"
    
    
    SCAN LABEL BYTE
    MAX_LEN DB 0FFH
    LEN DB ?
    STR DB 0FFH DUP('$')

ENDS

PRINT MACRO MSG   ; A FUNCTION TO PRINT STRING
    LEA DX, MSG
    MOV AH, 9     
    INT 21H
ENDM              


CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START:
        
        MOV AX, DATA
        MOV DS, AX
        
        LEA DX, SCAN	 	
        MOV AH, 0AH	      ;SCANNING THE STRING
        INT 21H
         
        PRINT NEWLINE
        PRINT MSG1 
        
        MOV DL, LEN
        ADD DL, 30H
        MOV AH, 2         ;PRINT THE LENGTH
        INT 21H
        
        PRINT MSG2
        PRINT STR         ;PRINT THE STRING 
        PRINT NEWLINE
        
        
        CMP LEN, 1     ; IF STRING LENGTH IS 1, THEN IT IS PALINDROME
        JE P
        
        
        LEA SI, STR    ; DI=FIRST CHARACTER OF STR
        LEA DI, STR    ; SI=FIRST CHARACTER OF STR
        MOV BH, 0
        MOV BL, LEN    ; Moving LEN to BL, casue we cannot move 8bits value into 16bits DI
        ADD DI, BX                                 ;That's why we move to BL, means BX=LEN
        SUB DI, 1
        
        MOV AX, 00
        MOV DL, 2
        MOV AL, LEN
        DIV DL
        
        MOV BX, 00
        MOV BL, AL
         
        
        
        MOV CX, BX
        CHECK:
            MOV DL, [SI]
            CMP DL, [DI]
            JNE NOT_P
            
            INC SI
            DEC DI 
             
             
        LOOP CHECK
        
        P:
        PRINT MSG3
        JMP DONE
        
        NOT_P:
        PRINT MSG4
        
        
        DONE:
        
        MOV AH, 4CH       ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START