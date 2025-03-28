	.file	"sse.c"
	.text
	.globl	sse
	.def	sse;	.scl	2;	.type	32;	.endef
	.seh_proc	sse
sse:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	32(%rbp), %rcx
/APP
 # 7 "sse.c" 1
	movups (%rax), %xmm0
movups (%rdx), %xmm1
mulps %xmm1, %xmm0
movups %xmm0, (%rcx)

 # 0 "" 2
/NO_APP
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "No arguments is detected\0"
	.align 8
.LC12:
	.ascii "%d \320\277\320\260\321\200\320\260\320\273\320\273\320\265\320\273\321\214\320\275\321\213\321\205 \320\270\321\202\320\265\321\200\320\260\321\206\320\270\320\271 \320\267\320\260 %.3f \320\274\321\201.\12\0"
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
	jg	.L3
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L7
.L3:
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
	jmp	.L5
.L6:
	leaq	-96(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	sse
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L6
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
.L7:
	subq	$-128, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC1:
	.long	1123024896
	.align 4
.LC2:
	.long	1082130432
	.align 4
.LC3:
	.long	1073741824
	.align 4
.LC4:
	.long	1096810496
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
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	clock_gettime;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef