;DIVISION AND MULTIPLICATION
   
   

DATA SEGMENT
    NEWLINE DB 10,13,"$" 
    MSG1 DB 10,13,"DIVIDEND: $"
    MSG2 DB 10,13,"DIVIDER: $" 
    MSG3 DB 10,13,"MULTIPLICANT: $" 
    MSG4 DB 10,13,"MULTIPLIER: $" 
    MSG5 DB 10,13,"RESULT: $"  
    
    DIVIDEND DB ?
    DIVIDER DB ?
    MULTIPLICANT DB ? 
    MULTIPLIER DB ?
   
    
        

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
        
         
        ;:::::::DIVISION::::::::::;
        PRINT MSG1 
        MOV AH, 1        ; TAKING INPUT
        INT 21H
        SUB AL, 30H
        MOV DIVIDEND, AL
        
        PRINT MSG2
        MOV AH, 1        ;TAKING INPUT
        INT 21H
        SUB AL, 30H
        MOV DIVIDER, AL
        
        MOV AX, 00       ;CLEAR GARBAGE VALUES
        MOV DL, DIVIDER
        MOV AL, DIVIDEND
        DIV DL           ;AL = AL/DL
        MOV BX, AX
       
        PRINT MSG5       ;PRINT DIVISION RESULT
        MOV DL, BL
        ADD DL, 30H
        MOV AH, 2
        INT 21H 
        
        
        PRINT NEWLINE
        
        
        ;::::::::::MULTIPLICATION:::::::::;
        PRINT MSG3 
        MOV AH, 1        ; TAKING INPUT
        INT 21H
        SUB AL, 30H
        MOV MULTIPLICANT, AL
        
        PRINT MSG4
        MOV AH, 1        ;TAKING INPUT
        INT 21H
        SUB AL, 30H
        MOV MULTIPLIER, AL
        
        MOV AX, 00       ;CLEAR GARBAGE VALUES
        MOV DL, MULTIPLIER
        MOV AL, MULTIPLICANT
        MUL DL           ;AL = AL*DL
        MOV BX, AX
       
        PRINT MSG5       ;PRINT MULTIPLICATION RESULT
        MOV DL, BL
        ADD DL, 30H
        MOV AH, 2
        INT 21H
        
        
        
        
        MOV AH, 4CH       ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START