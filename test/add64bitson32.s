#Adds two 64 bits ints together
# ecx:ebx to edx:eax
#Works for both signed and unsigned bits

.intel_syntax noprefix
add eax, ebx 	#lower nib
adc edx, ecx	#upper nib (takes carry from lower

