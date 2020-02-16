A	:	.word		2, 5, 11, 6, 8      @initialising the array containing elements of our choice
		LDR		R0,=A                   @loads the array into register R0
		MOV		R4,#0
		MOV		R2,#0
.Loop:
		LDR		R3,[R0,R2,LSL #2]       @array element stored in R3
		ADD		R2,R2,#1                @increments array pointer
		ADD		R4,R4,R3                @adds array elements in R4
		CMP		R2,#5                   @loop works till array pointer is not more than size of array
		BNE		.Loop	
MOV     R1,R4                           @since we need to print value using R1
MOV     R0,#1                           @for printing the value
swi 0x6b			                    @integer print command

