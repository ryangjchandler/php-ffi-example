package main

import "C"

//export fib
func fib(n int) int {
	if n < 2 {
		return n
	}

	return fib(n-1) + fib(n-2)
}

func main() {}
