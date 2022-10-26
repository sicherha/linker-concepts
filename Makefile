CFLAGS := -Os

LIBDIR := $(realpath $(dir $(shell gcc -print-file-name=libc.so)))

.PHONY: all clean

all: hitchhiker hitchhiker-bare hitchhiker-dynamic

clean:
	${RM} hitchhiker hitchhiker-bare hitchhiker-dynamic *.o *.so

hitchhiker: main.o deepthought.o
	${CC} ${CFLAGS} -o $@ $^

hitchhiker-bare: main.o deepthought.o
	ld -dynamic-linker "${LIBDIR}/ld-linux-x86-64.so.2" -o $@ "${LIBDIR}/crt1.o" "-L${LIBDIR}" $^ -lc

hitchhiker-dynamic: main.o libdeepthought.so
	${CC} ${CFLAGS} -o $@ $^

deepthought.o: deepthought.c deepthought.h
main.o: main.c deepthought.h

libdeepthought.so: deepthought.c deepthought.h
	${CC} ${CFLAGS} -fPIC -o $@ -shared $<
