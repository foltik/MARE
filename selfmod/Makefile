all: patch shell xor target

patch: patch.cpp
	c++  -fno-stack-protector -z execstack patch.cpp -o patch -O0 -g3 

shell: shell.cpp
	c++ shell.cpp -o shell -g3

xor: xor.cpp
	c++ xor.cpp -o xor

target: target.cpp
	c++ target.cpp -o target -O0
