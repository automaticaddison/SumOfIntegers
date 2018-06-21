     .globl main
main: 				# sum of the squares of integers 1 to 100
  
     .text
     add $t0, $zero, $zero 	# I is zero
     add $s0, $zero, $zero 	# Sum is zero
     addi $t1, $zero, 100 	# set the limit value (100)

loop:
     addi $t0, $t0, 1 		# I = I + 1
	 
     mult $t0, $t0		# Compute I^2
     mflo $t3			# Store I^2 into $t3
	 
     add $s0, $s0, $t3 		# Sum = Sum + I^2
     blt $t0, $t1, loop		# I < 100 loop to do again
    
     addi $v0, $zero, 4 	# print string
     la $a0, str 		# the text for output
     syscall 			# call opsys
    
     addi $v0, $zero, 1 	# print integer
     add $a0, $zero, $s0 	# the integer is sum
     syscall 			# call opsys
    
     addi $v0, $zero, 4 	# print string
     la $a0, stopped 		# the text for output
     syscall 			# call opsys
    
     addi $v0, $zero, 10 	# finished .. stop .. return
     syscall 			# to the Operating System
    
     .data
str: .asciiz "sum of the squares of integers from 1 ... 100 is "
stopped:
     .asciiz "\nStopped."