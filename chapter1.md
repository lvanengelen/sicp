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
