main:
	mov r1,#0b11000000000000000000000000010101
        mov r4,#0	@loop counter 
	mov r2,#0	@stores final answer
	mov r5,#0	@flag used in program 
	bl  func

func:
        cmp r4,#0               @ if func is visited the first time, it directly jumps to loop part
        beq loop
	check1:
		add r5,r5,#1	@increments the value of the temporary variable
                cmp r4,#31      @if further bits are left for comparision it branches to loop
                ble loop
                bne endfunc     @else end the program
	check0:
		cmp r5,#0	@compares the value of the temporary variable 
		bne consec1     @check for consecutive 1s
		beq consec0     @check for 0 in last iteration
	consec1:
		add r2,r2,#1	@increments the value of r2-the required answer
		mov r5,#0	@reset the value of r5
		cmp r4,#31      @if further bits are left for comparision it branches to loop
                ble loop
                bne endfunc     @else end the program
	consec0:
		cmp r4,#31      @if further bits are left for comparision it branches to loop
                ble loop
                bne endfunc	@else end the program
	loop:
                and r3,r1,#1	@extracts the LSB by ANDing withh 1
		mov r1,r1,lsr#1	@change for next iteration
		add r4,r4,#1	@increments the loop counter
                cmp r3,#1	@checks if the value in r3 is 1 or not
                beq check1      @branch if 1 is present
		bne check0      @branch if 0 is present
		cmp r4,#32	@loop condition	checking
		ble loop	@branch if it is less than or equal to 32
endfunc:
       cmp r3,#1               @function that helps in ending the program      
       addeq    r2,r2,#1


@The program starts with main function which initializes the registers with relevant inputs. Then it branches to the func procedure which does the required work. If this procedure is being read for the first time then we jump to the loop procedure, in loop we extract each bit using AND operator and then shift right the input to prepare for next iteration. If we find 1 then we raise the flag r5(Increase it's value). If we find a 0 then we check if r5 is more than 0(indicating previously 1 was present) then we increment our answer by 1 and reset r5 to 0 else we get ready for next iteration. This continues for 32 bits and then we end our program by branching to end function.s
	




