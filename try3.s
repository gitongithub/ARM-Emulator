p :                   ;function for the required action
add r1,r2,r3          ;addition
mul r1,r1,r4          ;multiplication
bx lr                 ;stires the address of branch where the function was called

main :                ;main function
mov r2,#11            ;loading of values in the next 3 lines
mov r3,#22
mov r4,#33
bl p                  ;branch to function
swi 0x6b              ;for printing
