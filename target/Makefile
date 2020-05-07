all: target

clean:
	rm target

target: target.c
	cc target.c -o target -fPIC -zexecstack -fno-stack-protector -O0 -g3
