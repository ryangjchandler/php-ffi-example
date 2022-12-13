package main

import "testing"

func TestFib(t *testing.T) {
	if fib(30) != 832040 {
		t.Fail()
	}
}
