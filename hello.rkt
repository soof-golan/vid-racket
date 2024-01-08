#lang racket
(require racket/list)
;;; (define (two-sum-iter nums target)

;;;   (let ([ht (make-hash)] [result (list)])
;;;     (for ([num nums] [i (range (length nums))])
;;;       #:break (not (empty? result))
;;;       (let ([x (hash-ref ht num -1)])
;;;         (cond
;;;           [(negative? x) (hash-set! ht (- target num) i)]
;;;           [else (set! result (list x i))])))
;;;     result))

(define (two-sum nums target)
  (let ([ht (make-hash)] [result (list)])
    (define (impl subl)
        (let* (
            [num (car subl)]
            [key (- (length nums) (length subl))]
            [item (hash-ref ht num (void))])
        (cond 
            [(empty? subl) "error"]
            [(void? item)
                (hash-set! ht (- target num) key)
                (impl (cdr subl))
            ]
            [else (list item key)]
        )
    ))
    (impl nums)
  ))
    
;;; (two-sum (list 1 2 3) 4)
