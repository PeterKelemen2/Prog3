; String felülírás
;#lang racket
(define x "Hello")
(set! x "szia")
(display x)

;############################

(define (mymax1 a b)
  (if (> a b)
    a
    b))
    
(writeln (mymax1 5 3))

;############################

(define (mymax2 a b)
  (if (> a b)
    a
    b))
    
;(writeln (mymax2 5 3))


; COND
(define (tipus x)
  (cond 
    ([integer? x] "szám")
    ([string? x] "sztring")
    ([flonum? x] "float")
    ([real? x]  "real")
    ;([boolean? x] "boolean")
    [else "AAAAAAAAAAAAAAAAAAAA"] 
  )
)

(writeln (tipus 5.4))
(writeln (tipus #t))


;; Lista kezelés
; Összetett adatszerkezet
; Új adatszerkezeteknél kérdések:
  ; - Egyszerű / Összetett
  ; - Homogén / Inhomogén
  ; - Folytonos / Szétszórt
  ; - Soros / Direkt
  ; - Rekurzív vagy sem
  ; Rekurzív adatszerk-et egyszerűbb rekurzívan feldolgozni

;; A lista:
  ; - Racketben inhomogén (kms)
  ; - Szétszórt
  ; - Mögötte mindig egy láncolt lista van. Soros hozzáférés.
  ; - Rekurzív - mert a fejéből és a farkából áll
    ; - Fej (head) - első eleme
    ; - Farok (tail) - az összes többi elem listája
    
(define lista1 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20))
(writeln lista1)
(writeln (car lista1)) ; head
(writeln (cdr lista1)) ; tail

(define lista2 (list))
(writeln (empty? lista2))

;; Lista feldolgozás
; Mivel a lista rekurzív adatszerkezet, ezért rekurzívan érdemes feldolgozni
; A lista farka mindig lista
; Önmagamat hívom a farokra rekurzívan
; Mivel a lista farka lista, ezért úgy dolgozom fel, hogy rekurzív hívás farokra

;; Binfa feldolgozás
; Mivel a bin fa baloldala bin fa és a jobb oldala is bin fa, ezértúgy dolgozom fel, 
; hogy rekurzívan meghívom a bal és a jobb oldalára 

(define (mylength lst)
  (cond
    ([empty? lst] 0)
    [else
      (define fej (first lst))
      (define farok (rest lst))
      (define farok-ertek (mylength farok))
      (+ farok-ertek 1)
    ]
  )
)
(writeln (mylength (list 1 2 3)))