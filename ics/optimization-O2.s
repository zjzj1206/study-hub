	.file	"optimization-examples.c"
	.text
	.p2align 4
	.globl	copy_row
	.type	copy_row, @function
copy_row:
.LFB0:
	.cfi_startproc
	endbr64
	testq	%rcx, %rcx
	je	.L1
	imulq	%rcx, %rdx
	xorl	%eax, %eax
	leaq	(%rdi,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	(%rsi,%rax,8), %xmm0
	movsd	%xmm0, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	copy_row, .-copy_row
	.p2align 4
	.globl	times16
	.type	times16, @function
times16:
.LFB1:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	salq	$4, %rax
	ret
	.cfi_endproc
.LFE1:
	.size	times16, .-times16
	.p2align 4
	.globl	common
	.type	common, @function
common:
.LFB2:
	.cfi_startproc
	endbr64
	addq	%rsi, %rdi
	leaq	1(%rdi), %rax
	imulq	%rdi, %rax
	ret
	.cfi_endproc
.LFE2:
	.size	common, .-common
	.p2align 4
	.globl	sum_serial
	.type	sum_serial, @function
sum_serial:
.LFB3:
	.cfi_startproc
	endbr64
	testq	%rsi, %rsi
	je	.L14
	leaq	(%rdi,%rsi,8), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	addq	(%rdi), %rax
	addq	$8, %rdi
	cmpq	%rdx, %rdi
	jne	.L13
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	sum_serial, .-sum_serial
	.p2align 4
	.globl	sum_two
	.type	sum_two, @function
sum_two:
.LFB4:
	.cfi_startproc
	endbr64
	cmpq	$1, %rsi
	jbe	.L20
	leaq	-2(%rsi), %r9
	movq	%rdi, %rdx
	xorl	%ecx, %ecx
	movq	%r9, %rax
	shrq	%rax
	salq	$4, %rax
	leaq	16(%rdi,%rax), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L18:
	addq	(%rdx), %rax
	addq	8(%rdx), %rcx
	addq	$16, %rdx
	cmpq	%r8, %rdx
	jne	.L18
	andq	$-2, %r9
	addq	$2, %r9
.L17:
	cmpq	%rsi, %r9
	jnb	.L19
	addq	(%rdi,%r9,8), %rax
.L19:
	addq	%rcx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L17
	.cfi_endproc
.LFE4:
	.size	sum_two, .-sum_two
	.p2align 4
	.globl	dot_two
	.type	dot_two, @function
dot_two:
.LFB5:
	.cfi_startproc
	endbr64
	movq	%rdi, %r8
	movq	%rsi, %rdi
	cmpq	$1, %rdx
	jbe	.L26
	leaq	-2(%rdx), %r11
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movq	%r11, %rax
	shrq	%rax
	leaq	2(%rax,%rax), %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L24:
	movq	(%r8,%rcx,8), %rsi
	imulq	(%rdi,%rcx,8), %rsi
	addq	%rsi, %rax
	movq	8(%r8,%rcx,8), %rsi
	imulq	8(%rdi,%rcx,8), %rsi
	addq	$2, %rcx
	addq	%rsi, %r9
	cmpq	%r10, %rcx
	jne	.L24
	andq	$-2, %r11
	leaq	2(%r11), %rcx
.L23:
	cmpq	%rdx, %rcx
	jnb	.L25
	movq	(%r8,%rcx,8), %rdx
	imulq	(%rdi,%rcx,8), %rdx
	addq	%rdx, %rax
.L25:
	addq	%r9, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	jmp	.L23
	.cfi_endproc
.LFE5:
	.size	dot_two, .-dot_two
	.p2align 4
	.globl	matmul_blocked
	.type	matmul_blocked, @function
matmul_blocked:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, -40(%rsp)
	movq	%rsi, -32(%rsp)
	testq	%r8, %r8
	je	.L28
	testq	%rcx, %rcx
	je	.L28
	movq	$0, -64(%rsp)
	leaq	0(,%rcx,8), %r15
.L43:
	movq	-64(%rsp), %rbx
	movq	%rcx, %rsi
	subq	%rbx, %rsi
	leaq	(%r8,%rbx), %rax
	cmpq	%r8, %rsi
	cmovb	%rcx, %rax
	imulq	%rcx, %rbx
	xorl	%r13d, %r13d
	movq	%rax, %r14
	movq	%rbx, %rax
.L42:
	movq	%rcx, %rsi
	leaq	(%r8,%r13), %r9
	movq	%rdx, -56(%rsp)
	subq	%r13, %rsi
	cmpq	%r8, %rsi
	leaq	0(%r13,%rax), %rsi
	cmovb	%rcx, %r9
	leaq	(%rdx,%rsi,8), %rbx
	xorl	%r11d, %r11d
	movq	%rcx, %rdx
	subq	%r11, %rdx
	movq	%rbx, -48(%rsp)
	cmpq	%r8, %rdx
	jb	.L33
.L63:
	leaq	(%r8,%r11), %rbx
	cmpq	%r14, -64(%rsp)
	jnb	.L34
.L44:
	movq	-40(%rsp), %rsi
	leaq	(%r11,%rax), %rdx
	movq	-32(%rsp), %rdi
	movq	%r14, -72(%rsp)
	movq	%rax, -24(%rsp)
	movq	-48(%rsp), %rbp
	leaq	(%rsi,%rdx,8), %r10
	leaq	(%rbx,%rax), %rdx
	movq	%r8, -8(%rsp)
	leaq	(%rsi,%rdx,8), %rsi
	movq	%rcx, %rdx
	movq	%rcx, -16(%rsp)
	imulq	%r11, %rdx
	addq	%r13, %rdx
	leaq	(%rdi,%rdx,8), %r12
	movq	-64(%rsp), %rdx
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%rbp, %rdi
	movq	%rcx, %r12
	movq	%r13, %r8
	cmpq	%r9, %r13
	jnb	.L37
	.p2align 4,,10
	.p2align 3
.L40:
	cmpq	%rbx, %r11
	jnb	.L39
	movsd	(%rdi), %xmm1
	movq	%r12, %r14
	movq	%r10, %rax
	.p2align 4,,10
	.p2align 3
.L36:
	movsd	(%rax), %xmm0
	mulsd	(%r14), %xmm0
	addq	$8, %rax
	addq	%r15, %r14
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdi)
	cmpq	%rsi, %rax
	jne	.L36
.L39:
	addq	$1, %r8
	addq	$8, %r12
	addq	$8, %rdi
	cmpq	%r8, %r9
	jne	.L40
.L37:
	movq	-72(%rsp), %rax
	addq	$1, %rdx
	addq	%r15, %rbp
	addq	%r15, %r10
	addq	%r15, %rsi
	cmpq	%rax, %rdx
	jb	.L35
	movq	-72(%rsp), %r14
	movq	-24(%rsp), %rax
	movq	-16(%rsp), %rcx
	movq	-8(%rsp), %r8
.L34:
	cmpq	%rcx, %rbx
	jnb	.L62
	movq	%rbx, %r11
	movq	%rcx, %rdx
	subq	%r11, %rdx
	cmpq	%r8, %rdx
	jnb	.L63
.L33:
	cmpq	%r14, -64(%rsp)
	jnb	.L62
	movq	%rcx, %rbx
	jmp	.L44
.L62:
	movq	-56(%rsp), %rdx
	cmpq	%rcx, %r9
	jnb	.L64
	movq	%r9, %r13
	jmp	.L42
.L28:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L64:
	.cfi_restore_state
	cmpq	%rcx, %r14
	jnb	.L28
	movq	%r14, -64(%rsp)
	jmp	.L43
	.cfi_endproc
.LFE6:
	.size	matmul_blocked, .-matmul_blocked
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
