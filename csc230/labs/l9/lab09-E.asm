
	.data 0x10010000 	# Normally the default, but forcing it anyway as
				# MARS might be misconfigured for some reason.
	
	.eqv	PIXEL_ON  0x00ffffff
	.eqv	PIXEL_OFF 0x00000000
	.eqv	ROWS      16
	.eqv	COLUMNS   16
	
BITMAP_DISPLAY:
	.space 1024		# Ensuring all further .data values are outside of Bitmap Tool words

ROW0_PATTERN:
	.word	0x0000
		0x07f8
		0x0ff8
		0x0f38
		0x1e38
		0x1c38
		0x1e38
		0x0ff8
		0x0ff8
		0x03f8
		0x0738
		0x0738
		0x0e38
		0x0e38
		0x1e38
		0x0000
	
	.text
	

		
	la $s0, BITMAP_DISPLAY  # By default, we start row 0, column 0
	la $s1, ROW0_PATTERN	# Address of row pattern
	lw $s2, 0($s1)		# Value of row pattern
		
	addi $s3, $zero, ROWS	# Want to look at 16 bits, one at a time.
	addi $s5, $zero, COLUMNS 
LOOP:
	addi $s4, $zero, PIXEL_OFF	# default value
	andi $t0, $s2, 0x0001		# Look at the right-most bit in current $s2 value
	beq $t0, $zero, WRITE_PIXEL	# If $t0 is zero, then bit 0 of $s2 is *not* set
	addi $s4, $zero, PIXEL_ON	# Must be the case here that bit 0 of $s2 *is* set

WRITE_PIXEL:
	sw $s4, 0($s0)
	
	addi $s0, $s0, 4	# Go to next word (i.e., go to next column)
	addi $s3, $s3, -1	# Decrement our counter
	srl $s2, $s2, 1		# shift row-pattern right by one bit
	
	bne $s3, $zero, LOOP
	bne $s5, $zero, COLUMN_LOOP

	addi $v0, $zero, 10
	syscall

COLUMN_LOOP	:
	addi $s3, $zero, 16
	addi $s5, $zero, -1
	addi $s1, $s1, 4
	lw $s2, 0($s1)
	jal LOOP
	



