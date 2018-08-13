DATA SEGMENT
    N1 DB 7
    N2 DB 9
ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START:
        MOV AX, DATA
        MOV DS, AX
        
        MOV AX, 00   ; SET, AL=0 and AH=0
        ADD AL, N1   ; AL = AL+N1
        ADD AL, N2   ; AL = AL+N2
        
       
        ;ALTERNATIVE OF AAA
        MOV DL, 10
        DIV DL        ; Now AL=FIRST_DIGIT=Result, and AH=SECOND_DIGIT=Reminder
        
        MOV BX, AX    ; Now BL=FIRST_DIGIT=Result, and BH=SECOND_DIGIT=Reminder
        
        
        MOV DL, BL    ;PRINT FIRST DIGIT
        ADD DL, 30H
        MOV AH, 2
        INT 21H  
        
        
        MOV DL, BH    ;PRINT SECOND DIGIT
        ADD DL, 30H
        MOV AH, 2
        INT 21H
        
        
        MOV AH, 4CH
        INT 21H
ENDS
END START