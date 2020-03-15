MAIN:                                   @Main function puts the input values in registers

    MOV     R2      ,#7                 @MSB of A 
    MOV     R3      ,#4294967295
    MOV     R4      ,#4294967295        @LSB of A
    MOV     R5      ,#6                 @MSB of B
    MOV     R6      ,#0
    MOV     R7      ,#1                 @LSB of B
    BL      P10                         @Main calls P10 function
P09:
    STMFD   SP!     ,{R4 - R7   ,LR}    @pushing registers into stack
    ADDS    R10      ,R4         ,R7    @adding and generating carry from LSB
    ADCS    R9      ,R3         ,R6     @adding with carry and generating carry
    LDMFD   SP!     ,{R4 - R7   ,PC}    @pop from stack

P10:
    STMFD   SP!     ,{R2 - R7   ,LR}    @Loads registers into stack becuase of nested calling
    BL      P09                         @Branching to P10
    ADC     R8      ,R2         ,R5     @Final loading to MSB of answer
    LDMFD   SP!     ,{R2 - R7   ,PC}    @pops from the stack
@A+B's MSB is in R8 and LSB in R