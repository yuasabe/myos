default:
	make img

ipl.bin : ipl.nas Makefile
	nasm ipl.nas -o ipl.bin -l ipl.lst

helloos.img : ipl.bin Makefile
	mformat -f 1440 -C -B ipl.bin -i helloos.img ::
	# -f : specifies the size of the DOS file system
	# -C : creates the disk image file to install the MS-DOS file system on it.
	# -B : Use the boot sector stored in the given file or device, instead of using its own. Only the geometry fields are updated to match the target disks parameters.
	# -i : 
asm :
	make -r ipl.bin

img :
	make -r helloos.img

clean:
	rm ipl.bin
	rm ipl.lst

run :
	make img
	qemu-system-i386 -drive file=helloos.img,format=raw,if=floppy -boot a