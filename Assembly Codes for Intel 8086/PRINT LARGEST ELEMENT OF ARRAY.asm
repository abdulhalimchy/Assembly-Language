;FIND THE LARGEST ELEMENT OF THE ARRAY
   
   

DATA SEGMENT
    NEWLINE DB 10,13,"$" 
    ARRAY DB 10, 14, 8, 7, 5, 11, 17, 54, 9
    LEN DW $-ARRAY  ; TO GET THE LENGTH OF THE ARRAY
    MAX DB 0
    MSG DB "LARGEST NUMBER : $"

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
         
        
        LEA SI, ARRAY     ;TO GET FIRST INDEX OF THE ARRAY
        
        MOV CX, LEN
        LOOP1:    
            MOV BL,[SI]
            CMP MAX, BL
            JG SKIP       ;IF MAX>BL THEN DO NOT UPDATE
            MOV MAX, BL   ;UPDATE MAX
            
            SKIP:
            INC SI      
        
        LOOP LOOP1
        
        PRINT MSG
        
        ;SPLITING FIRST DIGIT AND LAST DIGIT
        MOV AX, 00        
        MOV DL, 10
        MOV AL, MAX
        DIV DL
        MOV BX, AX
        
        MOV DL, BL        ; PRINT FIRST DIGIT
        ADD DL, 30H
        MOV AH, 2
        INT 21H
        
        MOV DL, BH        ; PRINT LAST DIGIT
        ADD DL, 30H
        MOV AH, 2
        INT 21H
       
        
        MOV AH, 4CH       ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START