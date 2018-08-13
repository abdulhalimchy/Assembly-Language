;Print average of numbers of an Array

DATA SEGMENT
    ARRAY DB 6, 7, 8, 17, 10, 24
    ARRAY_SIZE DB $-ARRAY 
    AVG DB ?
ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START:
        MOV AX, DATA
        MOV DS, AX
        
        LEA SI, ARRAY ; GET FIRST INDEX OF THE ARRAY
        
        
        MOV AX, 00    ; SET AH=AL=0
        MOV CX, OFFSET ARRAY_SIZE       ; OFFSET IS USE TO MOVE 8 BIT VALUE IN 16 BIT REGISTER
        LOP:
            ADD AL, [SI]
            INC SI
        
        LOOP LOP
        
        MOV DL, ARRAY_SIZE
        DIV DL
        
        
       
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