P10:                                   @Main function puts the input values in registers

    MOV     R2      ,#6                 @MSB of A 
    MOV     R3      ,#4294967295
    MOV     R4      ,#4294967295        @LSB of A
    MOV     R5      ,#4                 @MSB of B
    MOV     R6      ,#0
    MOV     R7      ,#1                 @LSB of B
    STMFD   SP!     ,{R2 - R7   ,LR}    @Loads registers into stack becuase of nested calling
    BL      P09                         @Branching to P9
    MOV     R0,R10                      @Moving register values for next call
    MOV     R1,R9
    MOV     R7, R6
    MOV     R4  ,R3
    MOV     R6, R5
    MOV     R3, R2
    BL     P09
    MOV    R8, R9
    MOV    R9,R1
    MOV    R10,R0
    LDMFD   SP!     ,{R2 - R7   ,PC}    @pops from the stack
@A+B's MSB is in R8 and LSB in R10 

P09:
    STMFD   SP!     ,{R4 - R7   ,LR}    @pushing registers into stack
    ADCS    R10      ,R4         ,R7    @adding and generating carry from LSB
    ADCS    R9      ,R3         ,R6     @adding with carry and generating carry
    LDMFD   SP!     ,{R4 - R7   ,PC}    @pop from stack
    BX LR