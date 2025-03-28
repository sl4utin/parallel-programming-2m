	.file	"seq.c"
	.text
	.globl	sequential_mul
	.def	sequential_mul;	.scl	2;	.type	32;	.endef
	.seh_proc	sequential_mul
sequential_mul:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$3, -4(%rbp)
	jle	.L3
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "No arguments detected.\0"
	.align 8
.LC12:
	.ascii "%d \320\277\320\276\321\201\320\273\320\265\320\264\320\276\320\262\320\260\321\202\320\265\320\273\321\214\320\275\321\213\321\205 \320\270\321\202\320\265\321\200\320\260\321\206\320\270\320\271 \320\267\320\260 %.3f \320\274\321\201.\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	addq	$-128, %rsp
	.seh_stackalloc	128
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	cmpl	$1, 16(%rbp)
	jg	.L5
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L9
.L5:
	movl	$65001, %ecx
	movq	__imp_SetConsoleOutputCP(%rip), %rax
	call	*%rax
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	clock_gettime
	movq	24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atoi
	movl	%eax, -8(%rbp)
	movss	.LC1(%rip), %xmm0
	movss	%xmm0, -64(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -56(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, -52(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -80(%rbp)
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, -76(%rbp)
	movss	.LC7(%rip), %xmm0
	movss	%xmm0, -72(%rbp)
	movss	.LC8(%rip), %xmm0
	movss	%xmm0, -68(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -96(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -92(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -88(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -84(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	leaq	-96(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	sequential_mul
	addl	$1, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L8
	leaq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	clock_gettime
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rax
	subq	%rax, %rdx
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
	movsd	.LC10(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movl	-40(%rbp), %edx
	movl	-24(%rbp), %eax
	subl	%eax, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movsd	.LC11(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	-16(%rbp), %rdx
	movl	-8(%rbp), %eax
	movapd	%xmm0, %xmm2
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
.L9:
	subq	$-128, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC1:
	.long	1092616192
	.align 4
.LC2:
	.long	1101004800
	.align 4
.LC3:
	.long	1106247680
	.align 4
.LC4:
	.long	1109393408
	.align 4
.LC5:
	.long	1069547520
	.align 4
.LC6:
	.long	1075838976
	.align 4
.LC7:
	.long	1080033280
	.align 4
.LC8:
	.long	1083179008
	.align 8
.LC10:
	.long	0
	.long	1083129856
	.align 8
.LC11:
	.long	0
	.long	1093567616
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	clock_gettime;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
