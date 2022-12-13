<?php

$ffi = FFI::cdef('int fib(int n);', __DIR__ . '/target/release/libfib.dylib');

echo $ffi->fib(30);