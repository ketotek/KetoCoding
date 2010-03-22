(define vmin
  (lambda (l)
    (if (null? (cdr l))
        (car l)
        (if (< (car l) (vmin (cdr l))) 
            (car l)
            (vmin (cdr l))
            )
        )
    )
  )
; (vmin '(8 2 67 1 9))

(define sum
  (lambda (l)
    (if (null? l)
        0
        (+ (car l) (sum (cdr l)))
        )
    )
  )

; (sum '(1 2 3))

(define sumepart
  (lambda (l t s)
    (if (null? (cdr l))
        (append s (list  (+ t (car l))))
        (if (= t 0)
            (sumepart (cdr l) (car l) s)
            (sumepart (cdr l) 0 (append s (list (+ t (car l))) ))
            )
        )
    )
  )

(define sume
  (lambda (l s)
    (if (null? l)
        '()
        (if (null? (cdr l))
            s
            (sume (sumepart l 0 '()) (append s (sumepart l 0 '())))
            )
        )
    )
  )
            
;(sumepart '(1 2 3 4 5) 0 '())
;(sumepart '(1 2) 0 '())
(sume '(1 2 3 4 5) '())
