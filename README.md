# PHP FFI Example

This repository contains a single FFI example in three different languages: C, Rust and Go. There is also a reference implementation written in PHP.

## Build

The build process requires [Just](https://github.com/casey/just), as well as the development tools for Rust, Go and a C compiler (GCC).

To build the shared object files, run `just build` in the root of the repository.

## Benchmarking

Before running the benchmarks, make sure you have [Hyperfine](https://github.com/sharkdp/hyperfine) installed.

Then run `just bench` and it will run each benchmark script 20 times with 5 warmup runs. The results will be printed in the terminal.

```
hyperfine --warmup 5 --runs 20 'php ./php/fib.php' 'php ./c/run.php' 'php ./rust/run.php' 'php ./go/run.php'
Benchmark 1: php ./php/fib.php
  Time (mean ± σ):     550.3 ms ±   5.4 ms    [User: 532.7 ms, System: 15.7 ms]
  Range (min … max):   543.4 ms … 563.1 ms    20 runs
 
Benchmark 2: php ./c/run.php
  Time (mean ± σ):      97.9 ms ±   1.6 ms    [User: 81.6 ms, System: 14.4 ms]
  Range (min … max):    96.4 ms … 102.0 ms    20 runs
 
Benchmark 3: php ./rust/run.php
  Time (mean ± σ):      95.7 ms ±   1.1 ms    [User: 79.4 ms, System: 14.5 ms]
  Range (min … max):    93.8 ms …  98.2 ms    20 runs
 
Benchmark 4: php ./go/run.php
  Time (mean ± σ):      96.2 ms ±   0.7 ms    [User: 80.1 ms, System: 16.9 ms]
  Range (min … max):    95.0 ms …  98.7 ms    20 runs
 
Summary
  'php ./rust/run.php' ran
    1.01 ± 0.01 times faster than 'php ./go/run.php'
    1.02 ± 0.02 times faster than 'php ./c/run.php'
    5.75 ± 0.09 times faster than 'php ./php/fib.php'
```