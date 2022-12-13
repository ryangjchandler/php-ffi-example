#[no_mangle]
pub extern "C" fn fib(n: i64) -> i64 {
    if n < 2 {
        return n;
    }

    return fib(n - 1) + fib(n - 2);
}

#[cfg(test)]
mod tests {
    use crate::fib;

    #[test]
    fn it_works() {
        assert_eq!(fib(30), 832040);
    }
}