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
	@ Tail-recursive
	push {r3, lr}		@ PROLOG
	
	@ R0:term, R1:val, R2:prev, R3:val+prev
	
	cmp r0, #0		@ Compare term with 0 
	ble .L3			@ if (term <= 0) goto .L3 (which returns prev)
	cmp r0, #1		@ Compare term with 1
	beq .L4			@ if (term == 1) goto .L4 (which returns val)

	sub r0, r0, #1	@ term = term - 1
	add r3, r1, r2	@ compute val+prev
	mov r2, r1		@ next prev = val
	mov r1, r3		@ next val = val+prev

	bl fibonacci	@ Recursive call to fibonacci with R4 - 2 as parameter
		
	pop {r3, pc}	@ EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, r2		@ return prev
	pop {r3, pc}	@ EPILOG

.L4:
	mov r0, r1		@ return val
	pop {r3, pc}	@ EPILOG

	.size fibonacci, .-fibonacci
	.end
