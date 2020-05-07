	.file	"patch.cpp"
	.intel_syntax noprefix
	.text
	.globl	_Z4testv
	.type	_Z4testv, @function
_Z4testv:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, 1
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4testv, .-_Z4testv
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r13
	push	r12
	push	rbx
	sub	rsp, 8
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	call	getpagesize@PLT
	movsx	rbx, eax
	lea	r13, _Z4testv[rip]
	lea	r12, _Z4testv[rip]
	call	getpagesize@PLT
	movsx	rcx, eax
	mov	rax, r12
	mov	edx, 0
	div	rcx
	mov	rax, rdx
	sub	r13, rax
	mov	rax, r13
	mov	edx, 7
	mov	rsi, rbx
	mov	rdi, rax
	call	mprotect@PLT
	lea	rax, _Z4testv[rip+5]
	mov	BYTE PTR [rax], 0
	call	_Z4testv
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
