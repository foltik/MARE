# Let's 
# Adds two 64 bits ints together
#  ecx:ebx to edx:eax
# Works for both signed and unsigned bits

.intel_syntax noprefix
mov edx, (eip-24)	# a_l -- grab upper nib 
mov eax, (eip-26)	# a_h -- grab lower nib
mov ecx, (eip-23)	# b_l -- grab upper nib
mov ebx, (eip-25)	# b_h -- grab lower nib
add eax, ebx 		# a_l + b_l -- add lower nibs
adc edx, ecx		# a_h + b_h -- add upper nib (takes carry from lower
mov edx, (eip+19)	# move...
mov eax, (eip+17)

