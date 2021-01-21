.PHONY: reference bench-cpp
# all: reference-cpp bench-cpp hs-vec

bench-cpp:
	-rm bench-cpp.out
	 # gcc -O3 -I ../../utilities -I ./ ../../utilities/polybench.c ./seidel-2d.c -DPOLYBENCH_TIME -o bench-cpp.out
	 clang -c -S -emit-llvm -O3 -mllvm -disable-llvm-optzns  -I ../../utilities -I ./ ../../utilities/polybench.c ./seidel-2d.c -DPOLYBENCH_TIME 
	 llvm-link  -S polybench.ll seidel-2d.ll -o seidel-2d-linked.ll
	 opt -correlated-propagation -mem2reg -instcombine -loop-simplify -indvars \
	-instnamer seidel-2d-linked.ll -S -o /tmp/tmp.ll
	 mv /tmp/tmp.ll seidel-2d-linked.ll
	sed -i".tmp" '/attributes .* =/d' seidel-2d-linked.ll
	sed -i".tmp" -e 's/) \#[0-9]*/)/' seidel-2d-linked.ll
	sed -i".tmp" '/; Function Attrs:/d' seidel-2d-linked.ll
	sed -i".tmp" '/; ModuleID =/d' seidel-2d-linked.ll
	sed -i".tmp" '/target triple/d' seidel-2d-linked.ll
	opt --polly-canonicalize \
		--polly-prepare \
		--debug \
		-polly-process-unprofitable \
		-polly-invariant-load-hoisting \
		-polly-detect-profitability-min-per-loop-insts=0\
		--polly-parallel -polly-vectorizer=stripmine -polly-codegen-verify \
		-polly-num-threads=8 \
		-polly-codegen \
		--polly-opt-isl --polly-ast \
		-polly-ignore-aliasing \
		--polly-ast-detect-parallel \
		--polly-pattern-matching-based-opts \
		-polly-codegen-emit-rtc-print \
		seidel-2d-linked.ll -S -o out.ll 
	llc out.ll -o out.o -filetype=obj -relocation-model=pic 
	gcc out.o  -L$(pwd) -L../build -lm -o bench-cpp.out -lgomp
	time ./bench-cpp.out

reference-cpp:
	-rm out-cpp.bin
	 clang -O0 -I ../../utilities -I ./ ../../utilities/polybench.c ./seidel-2d.c -DPOLYBENCH_DUMP_ARRAYS -o reference-cpp.out
	 time ./reference-cpp.out
	 sha256sum in-cpp.bin
	 sha256sum out-cpp.bin

hs-vec: reference-cpp
	-rm out-hs-vec.bin
	ghc -O2 -fllvm ./seidel-2d-vector.hs -o seidel-2d-vector.out
	time ./seidel-2d-vector.out
	sha256sum in-hs-vector.bin
	sha256sum out-hs-vector.bin
	diff out-cpp.bin out-hs-vector.bin
