#lang racket
(require racket/list)
(define (two-sum nums target)

  (let ([ht (make-hash)] [result (list)])
    (for ([num nums] [i (range (length nums))])
      #:break (not (empty? result))
      (let ([x (hash-ref ht num -1)])
        (cond
          [(negative? x) (hash-set! ht (- target num) i)]
          [else (set! result (list x i))])))
    result))

(two-sum (list 1 2 3) 4)
