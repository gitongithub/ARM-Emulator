mov r1, #13                  @storing a number , in this case 13 in r1
mov r2, #1                   @storing 1 in r2
mov r4, #0                   @storing 0 in r4 
.loop:	                     
	and r3, r1, #1           @extracting LSB
	cmp r3, #1               @checking if r3 contains 1
	addeq r4, r4, #1         @if r3=1 then counter is incremented
	mov r1, r1, lsr #1       @right shifting the number to get next LSB
	add r2, r2, #1           @incrementing loop pointer
	cmp r2, #32              @checking for completion of 32 bits
	ble .loop                @branch to loop if codition is true
mov r1,r4
swi 0x6b	
