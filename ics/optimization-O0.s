	.file	"optimization-examples.c"
	.text
	.globl	copy_row
	.type	copy_row, @function
copy_row:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	imulq	-48(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jb	.L3
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	copy_row, .-copy_row
	.globl	times16
	.type	times16, @function
times16:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$4, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	times16, .-times16
	.globl	common
	.type	common, @function
common:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	addq	$1, %rax
	imulq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	common, .-common
	.globl	sum_serial
	.type	sum_serial, @function
sum_serial:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L9
.L10:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	%rax, -16(%rbp)
	addq	$1, -8(%rbp)
.L9:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L10
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	sum_serial, .-sum_serial
	.globl	sum_two
	.type	sum_two, @function
sum_two:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L13
.L14:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	%rax, -16(%rbp)
	addq	$2, -8(%rbp)
.L13:
	movq	-48(%rbp), %rax
	subq	-8(%rbp), %rax
	cmpq	$1, %rax
	ja	.L14
	movq	-8(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jnb	.L15
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	%rax, -24(%rbp)
.L15:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sum_two, .-sum_two
	.globl	dot_two
	.type	dot_two, @function
dot_two:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L18
.L19:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rax, -16(%rbp)
	addq	$2, -8(%rbp)
.L18:
	movq	-56(%rbp), %rax
	subq	-8(%rbp), %rax
	cmpq	$1, %rax
	ja	.L19
	movq	-8(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jnb	.L20
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rax, -24(%rbp)
.L20:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	dot_two, .-dot_two
	.globl	matmul_blocked
	.type	matmul_blocked, @function
matmul_blocked:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	%rcx, -112(%rbp)
	movq	%r8, -120(%rbp)
	cmpq	$0, -120(%rbp)
	je	.L43
	movq	$0, -72(%rbp)
	jmp	.L25
.L42:
	movq	-112(%rbp), %rax
	subq	-72(%rbp), %rax
	cmpq	-120(%rbp), %rax
	jb	.L26
	movq	-72(%rbp), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	jmp	.L27
.L26:
	movq	-112(%rbp), %rax
.L27:
	movq	%rax, -24(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L28
.L41:
	movq	-112(%rbp), %rax
	subq	-64(%rbp), %rax
	cmpq	-120(%rbp), %rax
	jb	.L29
	movq	-64(%rbp), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	jmp	.L30
.L29:
	movq	-112(%rbp), %rax
.L30:
	movq	%rax, -16(%rbp)
	movq	$0, -56(%rbp)
	jmp	.L31
.L40:
	movq	-112(%rbp), %rax
	subq	-56(%rbp), %rax
	cmpq	-120(%rbp), %rax
	jb	.L32
	movq	-56(%rbp), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	jmp	.L33
.L32:
	movq	-112(%rbp), %rax
.L33:
	movq	%rax, -8(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.L34
.L39:
	movq	-64(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L35
.L38:
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L36
.L37:
	movq	-48(%rbp), %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-48(%rbp), %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm2
	movq	-32(%rbp), %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movq	-48(%rbp), %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -32(%rbp)
.L36:
	movq	-32(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L37
	addq	$1, -40(%rbp)
.L35:
	movq	-40(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jb	.L38
	addq	$1, -48(%rbp)
.L34:
	movq	-48(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.L39
	movq	-8(%rbp), %rax
	movq	%rax, -56(%rbp)
.L31:
	movq	-56(%rbp), %rax
	cmpq	-112(%rbp), %rax
	jb	.L40
	movq	-16(%rbp), %rax
	movq	%rax, -64(%rbp)
.L28:
	movq	-64(%rbp), %rax
	cmpq	-112(%rbp), %rax
	jb	.L41
	movq	-24(%rbp), %rax
	movq	%rax, -72(%rbp)
.L25:
	movq	-72(%rbp), %rax
	cmpq	-112(%rbp), %rax
	jb	.L42
	jmp	.L22
.L43:
	nop
.L22:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
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
