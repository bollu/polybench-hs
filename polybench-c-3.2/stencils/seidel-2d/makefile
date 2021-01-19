.PHONY: reference bench-cpp
all: reference-cpp bench-cpp

bench-cpp:
	 gcc -O3 -I ../../utilities -I ./ ../../utilities/polybench.c ./seidel-2d.c -DPOLYBENCH_TIME -o bench-cpp.out
	 ./bench-cpp.out

reference-cpp:
	-rm out-cpp.bin
	 clang -O0 -fsanitize=address -fsanitize=undefined -I ../../utilities -I ./ ../../utilities/polybench.c ./seidel-2d.c -DPOLYBENCH_DUMP_ARRAYS -o reference-cpp.out
	 ./reference-cpp.out
	 sha256sum out-cpp.bin

hs-vec:
	-rm out-hs-vec.bin
	ghc -O2 ./seidel-2d-vector.hs -o seidel-2d-vector.out
	./seidel-2d-vector.out
	sha256sum out-hs-vector.bin
