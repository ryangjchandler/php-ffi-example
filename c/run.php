<?php

$ffi = FFI::cdef('int fib(int n);', __DIR__ . '/fib.so');

echo $ffi->fib(30);