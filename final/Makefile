

default:
	make img

ipl10.bin : ipl10.nas Makefile
	nasm ipl10.nas -o ipl10.bin -l ipl10.lst

haribote.sys : haribote.nas Makefile
	nasm haribote.nas -o haribote.sys -l haribote.lst

haribote.img : ipl10.bin haribote.sys Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy -i haribote.img haribote.sys ::
	# -f : specifies the size of the DOS file system
	# -C : creates the disk image file to install the MS-DOS file system on it.
	# -B : Use the boot sector stored in the given file or device, instead of using its own. Only the geometry fields are updated to match the target disks parameters.
	# -i : 

# asm :
# 	make -r ipl.bin

img :
	make -r haribote.img

run :
	make img
	qemu-system-i386 -drive file=haribote.img,format=raw,if=floppy -boot a

clean:
	rm ipl10.bin
	rm ipl10.lst
	# rm ipl.bin
	# rm ipl.lst
	rm haribote.sys
	rm haribote.lst