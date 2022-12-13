build: build-c build-rust build-go

build-c:
    cd ./c && rm -f *.o *.so && gcc -c fib.c && gcc -shared -o fib.so fib.o && cd ..

build-rust:
    cd ./rust && cargo build --release && cd ..

build-go:
    cd ./go && go build -o fib.so -buildmode=c-shared fib.go && cd ..

bench: build
    hyperfine --warmup 5 --runs 20 'php ./php/fib.php' 'php ./c/run.php' 'php ./rust/run.php' 'php ./go/run.php'