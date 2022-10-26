CFLAGS := -Os

.PHONY: all clean

all: hitchhiker hitchhiker-bare hitchhiker-dynamic

clean:
	${RM} hitchhiker hitchhiker-bare hitchhiker-dynamic *.o *.so

hitchhiker: main.o deepthought.o
	${CC} ${CFLAGS} -o $@ $^

hitchhiker-bare: main.o deepthought.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ /usr/lib64/crt1.o -L/usr/lib64 $^ -lc

hitchhiker-dynamic: main.o libdeepthought.so
	${CC} ${CFLAGS} -o $@ $^

deepthought.o: deepthought.c deepthought.h
main.o: main.c deepthought.h

libdeepthought.so: deepthought.c deepthought.h
	${CC} ${CFLAGS} -fPIC -o $@ -shared $<
