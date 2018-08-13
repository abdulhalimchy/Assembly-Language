;PRINT START PATTERN
;  *
;  **
;  ***
;  ****
 

DATA SEGMENT
    NEWLINE DB 10,13,"$"
    COUNT DB 0 

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
        
        MOV CX, 5
        REPEAT1:
            MOV BL, 6
            SUB BL, CL 
            MOV COUNT, 0
            
            REPEAT2:
            MOV DL, '*'
            MOV AH, 2
            INT 21H 
            INC COUNT
            CMP BL, COUNT
            JG REPEAT2
            
            
            PRINT NEWlINE
         LOOP REPEAT1
        
        MOV AH, 4CH       ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START