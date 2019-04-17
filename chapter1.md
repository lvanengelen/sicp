# Exercise 1.1

```scheme
> 10
10
> (+ 5 3 4)
12
> (- 9 1)
8
> (/ 6 2)
3
> (+ (* 2 4) (- 4 6))
6
> (define a 3)
> (define b (+ a 1))
> (+ a b (* a b))
19
> (= a b)
#f
> (if (and (> b a) (< b (* a b)))
    b
    a)
4
> (cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
16
> (+ 2 (if (> b a) b a))
6
> (* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
16
> 
```

# Exercise 1.4

Given

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

The combination

```scheme
(a-plus-abs-b 2 -3)
```

which evaluates to

```scheme
((if (> -3 0) + -) 2 -3)
```

which evaluates to

```scheme
((if #f + -) 2 -3)
```

which evaluates to

```scheme
(- 2 -3)
```

which evaluates to

```scheme
5
```

# Exercise 1.5

Given

```scheme
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

```

Using applicative-order the combination `(test 0 (p))` evaluates to `(test 0
(p))` indefinately, resulting in an infinite loop.

Using normal-order evaluation, the combination `(test 0 (p))` evaluates to


```scheme
(if (= x 0) 0 (p))
```

which evaluates to

```scheme
(if #t 0 (p))
```

which evaluates to

```
0
```

# Exercise 1.6

The third operand of the `new-if` procedure will be evaluated before calling the
procedure itself.  This triggers another evalution of `sqrt-iter`, which in turn
evaluates the third operand of `new-if`, etc.  This causes unlimited recursion,
Scheme's version of an endless loop.  So the program will hang indefinately.

# Exercise 1.7

The procedure `good-enough?` will accept the guess whenever the guess lies
between `(sqrt (- x 0.001))` and `(sqrt (+ x 0.001))`.  When `x` is very small,
the tolerance will dominate the equation of this accepted range and `x` is not
part of the acceptance decision anymore.  The guess will be accepted when it is
close enough to `(sqrt 0.001)`.

E.g. `(sqrt 0)` evaluates to `0.03125`.  Interestingly, evaluating
`(square (sqrt 0))` evaluates to `0.0009765625` which is indeed very close to
the tolerance `0.001`.

The procedure `good-enough?` will not accept the guess while its square is not
closer than `0.001` from `x`.  High numbers might not be representable with a
preciesion of `0.001`, so the guess will never be accepted.

E.g. evaluating `(sqrt 1e13)` hangs, while `(sqrt 1e12)` evaluates to `1e6`.

Note that in the improved version `(sqrt 0)` will hang.  This is because for `0`
the next guess will always be half the previous guess and therefore the change
will always be equal to the guess.  This means that this fraction will always be
`1`, which is greater than the chosen tolerance of `0.001`.  Note that
`(sqrt 1e-323)` can still be evaluated but `(sqrt 1e-324)` also hangs.
