CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &

qemu: fibseq
	
	@res=`echo 0 | qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq | cut -d ' ' -f 7` ; \
	if [ $$res != 0 ];then \
		@echo "0 Incorrect"; \
	fi;
	
	@res=`echo 1 | qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq | cut -d ' ' -f 7` ; \
	if [ $$res != 1 ];then \
		@echo "1 Incorrect"; \
	fi;	
			
	@for (( i=2, a=0, b=1,c=1,check=0; i<=40 ; i++ )) ; do \
        res=`echo $$i | qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq | cut -d ' ' -f 7` ; \
        ((c=a+b));\
        a=$$b;\
        b=$$c;\
        if [ $$res != $$c ];then \
        	((check=1));\
        fi;\
    done;\
    if [ $$check == 1 ];then \
       	echo "Incorrect";\
	else\
		echo "Correct";\
	fi;\
	
	@gnuplot ./plotScript
	@rm ./clock
