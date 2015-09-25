	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}
	cmp r0, #0	@ Compare RO with 0
	beq .L3		@ if(R0 == 0), goto .L3
	cmp r0, #1	@ Compare R0 with 1
	beq .L4		@ if(R0 == 1), goto .L4

	mov r3, #1	@ R3 = 1
	mov r4, #1	@ R4 = 1

loop:			@ loop label for iterative
	cmp r0, #2	@ Compare R0 with 2
	ble break	@ if(R0 <=2), break loop
	add r5, r3, r4	@ R5 = R3 + R4
	mov r3, r4	@ R3 = R4
	mov r4, r5	@ R4 = R5
	sub r0, #1	@ R0 = R0 - 1
	b	loop	@ goto loop 
break:			@ label for break
	mov r0, r5	@ return R5
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
