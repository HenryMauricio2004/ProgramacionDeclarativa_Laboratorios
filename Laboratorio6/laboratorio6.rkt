#lang racket
(define (interes_banco deposito)
  ( cond
     [(<= deposito 40000 )(imprimir_interes deposito 0.035)]
     [(<= deposito 260000) (imprimir_interes deposito 0.04)]
     [ else (imprimir_interes deposito 0.045)]
   )
)

(define (imprimir_interes deposito porcentaje)
  (begin (display "Depósito: $")
         (displayln deposito)
         (display "Interés asignado: ")
         (display (* porcentaje 100))
         (displayln "%")
         (display "subtotal: $")
         (displayln (* deposito porcentaje)))
)