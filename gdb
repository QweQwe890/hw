打印所有线程：thread apply all bt
切换线程： t 2

info threads
b main thread ID(线程ID，不是tid，info threads打印出来的第一列)


打印内存
x/20gx 0xffffc90000163c60

h: 双字节
b: 单字节
w: 四字节
g: 八字节

x: 16进制
d: 10进制
u：10进制无符号
c：字符格式
f：浮点格式

查看寄存器 
i r

查看函数汇编
disas cmdline_proc_show

查看内存处汇编
x/12i 0xffffffffa0007000

对某个地址设置断点
要加 * 号
b *0xffffffff812ff8f0

删除断点
delete 1

 打印局部变量
i locals

打印结构体成员值
0xffff88810cd9c148为结构体地址
set print pretty on
p *(struct trace_event_call *)0xffff88810cd9c148

打印结构体大小
p sizeof(struct kprobe)


打印所有线程调用栈
thread apply all bt 
thread apply all i reg PMCNTENCLR_EL0
thread apply all i reg PMCCNTR_EL0


kgdb:
<root of kernel source>: make scripts_gdb
After making, a symlink of vmlinux-gdb.py is created at the root of kernel source. Then:
<root of kernel source>: gdb vmlinux
<gdb cmd>: add-auto-load-safe-path root-of-kernel-source <gdb cmd:> source vmlinux-gdb.py
source /root/rpmbuild/BUILD/kernel-5.10.0/linux-5.10.0-60.18.0.50.h464.aarch64/vmlinux-gdb.py


[root@localhost home]# ls /usr/src/debug/kernel-5.10.0-60.18.0.50.h579.eulerosv2r11.x86_64/linux-5.10.0-60.18.0.50.h579.x86_64
代码在  /usr/src/linux-5.10.0-60.18.0.50.h579.x86_64/ 目录下
set substitute-path /usr/src/debug/kernel-5.10.0-60.18.0.50.h579.x86_64/linux-5.10.0-60.18.0.50.h579.x86_64 /usr/src/linux-5.10.0-60.18.0.50.h579.x86_64/
disassemble/m text_poke_bp_batch


打印枚举值:
p (int)TRACE_ITER_STACKTRACE_BIT

per-cpu:
p $lx_per_cpu("watchdog_ev", 1).hw

打印结构体成员和偏移：
ptype /o struct address_space
