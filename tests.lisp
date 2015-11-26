(setf tabuleiro (cria-tabuleiro))

(setf (aref tabuleiro 4 0) T)
(setf (aref tabuleiro 4 1) T)
(setf (aref tabuleiro 4 2) T)
(setf (aref tabuleiro 4 3) T)
(setf (aref tabuleiro 4 4) T)
(setf (aref tabuleiro 4 5) T)
(setf (aref tabuleiro 4 6) T)
(setf (aref tabuleiro 4 7) T)
(setf (aref tabuleiro 4 8) T)
(setf (aref tabuleiro 4 9) T)

(setf (aref tabuleiro 3 2) T)
(setf (aref tabuleiro 3 5) T)
(setf (aref tabuleiro 3 0) T)
(setf (aref tabuleiro 3 7) T)
(setf (aref tabuleiro 3 4) T)
(setf (aref tabuleiro 3 9) T)

(setf (aref tabuleiro 8 0) T)
(setf (aref tabuleiro 6 1) T)
(setf (aref tabuleiro 2 2) T)
(setf (aref tabuleiro 1 3) T)
(setf (aref tabuleiro 5 4) T)
(setf (aref tabuleiro 4 5) T)
(setf (aref tabuleiro 9 6) T)
(setf (aref tabuleiro 10 7) T)
(setf (aref tabuleiro 12 8) T)
(setf (aref tabuleiro 6 9) T)

(setf (aref tabuleiro 15 9) T)
(setf (aref tabuleiro 16 8) T)
(setf (aref tabuleiro 12 2) T)
(setf (aref tabuleiro 13 3) T)
(setf (aref tabuleiro 15 4) T)
(setf (aref tabuleiro 14 5) T)
(setf (aref tabuleiro 6 6) T)
(setf (aref tabuleiro 15 7) T)
(setf (aref tabuleiro 17 8) T)
(setf (aref tabuleiro 6 9) T)


(setf (aref tabuleiro 17 4) T)

(setf res (tabuleiro-topo-preenchido-p tabuleiro))

(print tabuleiro)

(print res)

;(tabuleiro-remove-linha! tabuleiro 4)

;(tabuleiro-remove-linha! tabuleiro 0)

(tabuleiro-remove-linha! tabuleiro 17)

(print tabuleiro)

(print (concatenate 'string "topo-preenchido-aux-function-test:" (if (preenchido-aux tabuleiro 9 9) "T" "F")))

(print (concatenate 'string "linha preenchida:" (if (tabuleiro-linha-completa-p tabuleiro 3) "T" "F")))

(print (concatenate 'string "linha preenchida:" (if (tabuleiro-linha-completa-p tabuleiro 7) "T" "F")))


;;; Teste 13
;;; Testes fn accoes

;;deve retornar T
(equalp '((0 . #2A((T) (T) (T) (T))) (1 . #2A((T) (T) (T) (T))) (2 . #2A((T) (T) (T) (T))) (3 . #2A((T) (T) (T) (T))) (4 . #2A((T) (T) (T) (T))) (5 . #2A((T) (T) (T) (T))) (6 . #2A((T) (T) (T) (T))) (7 . #2A((T) (T) (T) (T))) (8 . #2A((T) (T) (T) (T))) (9 . #2A((T) (T) (T) (T))) (0 . #2A((T T T T))) (1 . #2A((T T T T))) (2 . #2A((T T T T))) (3 . #2A((T T T T))) (4 . #2A((T T T T))) (5 . #2A((T T T T))) (6 . #2A((T T T T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(i) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))

;;deve retornar T
(equalp '((0 . #2A((T T) (T NIL) (T NIL))) (1 . #2A((T T) (T NIL) (T NIL))) (2 . #2A((T T) (T NIL) (T NIL))) (3 . #2A((T T) (T NIL) (T NIL))) (4 . #2A((T T) (T NIL) (T NIL)))(5 . #2A((T T) (T NIL) (T NIL))) (6 . #2A((T T) (T NIL) (T NIL))) (7 . #2A((T T) (T NIL) (T NIL))) (8 . #2A((T T) (T NIL) (T NIL))) (0 . #2A((T NIL NIL) (T T T)))(1 . #2A((T NIL NIL) (T T T))) (2 . #2A((T NIL NIL) (T T T))) (3 . #2A((T NIL NIL) (T T T))) (4 . #2A((T NIL NIL) (T T T))) (5 . #2A((T NIL NIL) (T T T)))(6 . #2A((T NIL NIL) (T T T))) (7 . #2A((T NIL NIL) (T T T))) (0 . #2A((NIL T) (NIL T) (T T))) (1 . #2A((NIL T) (NIL T) (T T))) (2 . #2A((NIL T) (NIL T) (T T)))(3 . #2A((NIL T) (NIL T) (T T))) (4 . #2A((NIL T) (NIL T) (T T))) (5 . #2A((NIL T) (NIL T) (T T))) (6 . #2A((NIL T) (NIL T) (T T))) (7 . #2A((NIL T) (NIL T) (T T)))(8 . #2A((NIL T) (NIL T) (T T))) (0 . #2A((T T T) (NIL NIL T))) (1 . #2A((T T T) (NIL NIL T))) (2 . #2A((T T T) (NIL NIL T))) (3 . #2A((T T T) (NIL NIL T)))(4 . #2A((T T T) (NIL NIL T))) (5 . #2A((T T T) (NIL NIL T))) (6 . #2A((T T T) (NIL NIL T))) (7 . #2A((T T T) (NIL NIL T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(l) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))

;;deve retornar T
(equalp '((0 . #2A((T T) (NIL T) (NIL T))) (1 . #2A((T T) (NIL T) (NIL T))) (2 . #2A((T T) (NIL T) (NIL T))) (3 . #2A((T T) (NIL T) (NIL T))) (4 . #2A((T T) (NIL T) (NIL T)))(5 . #2A((T T) (NIL T) (NIL T))) (6 . #2A((T T) (NIL T) (NIL T))) (7 . #2A((T T) (NIL T) (NIL T))) (8 . #2A((T T) (NIL T) (NIL T))) (0 . #2A((T T T) (T NIL NIL)))(1 . #2A((T T T) (T NIL NIL))) (2 . #2A((T T T) (T NIL NIL))) (3 . #2A((T T T) (T NIL NIL))) (4 . #2A((T T T) (T NIL NIL))) (5 . #2A((T T T) (T NIL NIL)))(6 . #2A((T T T) (T NIL NIL))) (7 . #2A((T T T) (T NIL NIL))) (0 . #2A((T NIL) (T NIL) (T T))) (1 . #2A((T NIL) (T NIL) (T T))) (2 . #2A((T NIL) (T NIL) (T T)))(3 . #2A((T NIL) (T NIL) (T T))) (4 . #2A((T NIL) (T NIL) (T T))) (5 . #2A((T NIL) (T NIL) (T T))) (6 . #2A((T NIL) (T NIL) (T T))) (7 . #2A((T NIL) (T NIL) (T T)))(8 . #2A((T NIL) (T NIL) (T T))) (0 . #2A((NIL NIL T) (T T T))) (1 . #2A((NIL NIL T) (T T T))) (2 . #2A((NIL NIL T) (T T T))) (3 . #2A((NIL NIL T) (T T T)))(4 . #2A((NIL NIL T) (T T T))) (5 . #2A((NIL NIL T) (T T T))) (6 . #2A((NIL NIL T) (T T T))) (7 . #2A((NIL NIL T) (T T T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(j) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))

;;deve retornar T
(equalp '((0 . #2A((T T) (T T))) (1 . #2A((T T) (T T))) (2 . #2A((T T) (T T))) (3 . #2A((T T) (T T))) (4 . #2A((T T) (T T))) (5 . #2A((T T) (T T))) (6 . #2A((T T) (T T)))(7 . #2A((T T) (T T))) (8 . #2A((T T) (T T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(o) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))

;;deve retornar T
(equalp '((0 . #2A((T T NIL) (NIL T T))) (1 . #2A((T T NIL) (NIL T T))) (2 . #2A((T T NIL) (NIL T T))) (3 . #2A((T T NIL) (NIL T T))) (4 . #2A((T T NIL) (NIL T T)))(5 . #2A((T T NIL) (NIL T T))) (6 . #2A((T T NIL) (NIL T T))) (7 . #2A((T T NIL) (NIL T T))) (0 . #2A((NIL T) (T T) (T NIL))) (1 . #2A((NIL T) (T T) (T NIL)))(2 . #2A((NIL T) (T T) (T NIL))) (3 . #2A((NIL T) (T T) (T NIL))) (4 . #2A((NIL T) (T T) (T NIL))) (5 . #2A((NIL T) (T T) (T NIL))) (6 . #2A((NIL T) (T T) (T NIL)))(7 . #2A((NIL T) (T T) (T NIL))) (8 . #2A((NIL T) (T T) (T NIL)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(s) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))

;;deve retornar T
(equalp '((0 . #2A((NIL T T) (T T NIL))) (1 . #2A((NIL T T) (T T NIL))) (2 . #2A((NIL T T) (T T NIL))) (3 . #2A((NIL T T) (T T NIL))) (4 . #2A((NIL T T) (T T NIL)))(5 . #2A((NIL T T) (T T NIL))) (6 . #2A((NIL T T) (T T NIL))) (7 . #2A((NIL T T) (T T NIL))) (0 . #2A((T NIL) (T T) (NIL T))) (1 . #2A((T NIL) (T T) (NIL T)))(2 . #2A((T NIL) (T T) (NIL T))) (3 . #2A((T NIL) (T T) (NIL T))) (4 . #2A((T NIL) (T T) (NIL T))) (5 . #2A((T NIL) (T T) (NIL T))) (6 . #2A((T NIL) (T T) (NIL T)))(7 . #2A((T NIL) (T T) (NIL T))) (8 . #2A((T NIL) (T T) (NIL T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(z) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))

;;deve retornar T
(equalp '((0 . #2A((T T T) (NIL T NIL))) (1 . #2A((T T T) (NIL T NIL))) (2 . #2A((T T T) (NIL T NIL))) (3 . #2A((T T T) (NIL T NIL))) (4 . #2A((T T T) (NIL T NIL)))(5 . #2A((T T T) (NIL T NIL))) (6 . #2A((T T T) (NIL T NIL))) (7 . #2A((T T T) (NIL T NIL))) (0 . #2A((T NIL) (T T) (T NIL))) (1 . #2A((T NIL) (T T) (T NIL)))(2 . #2A((T NIL) (T T) (T NIL))) (3 . #2A((T NIL) (T T) (T NIL))) (4 . #2A((T NIL) (T T) (T NIL))) (5 . #2A((T NIL) (T T) (T NIL))) (6 . #2A((T NIL) (T T) (T NIL)))(7 . #2A((T NIL) (T T) (T NIL))) (8 . #2A((T NIL) (T T) (T NIL))) (0 . #2A((NIL T NIL) (T T T))) (1 . #2A((NIL T NIL) (T T T))) (2 . #2A((NIL T NIL) (T T T)))(3 . #2A((NIL T NIL) (T T T))) (4 . #2A((NIL T NIL) (T T T))) (5 . #2A((NIL T NIL) (T T T))) (6 . #2A((NIL T NIL) (T T T))) (7 . #2A((NIL T NIL) (T T T)))(0 . #2A((NIL T) (T T) (NIL T))) (1 . #2A((NIL T) (T T) (NIL T))) (2 . #2A((NIL T) (T T) (NIL T))) (3 . #2A((NIL T) (T T) (NIL T))) (4 . #2A((NIL T) (T T) (NIL T)))(5 . #2A((NIL T) (T T) (NIL T))) (6 . #2A((NIL T) (T T) (NIL T))) (7 . #2A((NIL T) (T T) (NIL T))) (8 . #2A((NIL T) (T T) (NIL T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(t) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))



;;; Teste 15
;;; Testes fn resultado

;;deve retornar IGNORE
(ignore-value (setf estado1 (make-estado :pontos 0 :pecas-por-colocar '(o o o o o j) :pecas-colocadas '() :tabuleiro (cria-tabuleiro))))

;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado1 '(0 . #2A((T T)(T T))))))

;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(2 . #2A((T T)(T T))))))

;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(4 . #2A((T T)(T T))))))

;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(6 . #2A((T T)(T T))))))

;;deve retornar T
(tabuleiro-preenchido-p (estado-tabuleiro estado2) 1 5)

;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(8 . #2A((T T)(T T))))))

;;deve retornar 300
(estado-pontos estado2)

;;deve retornar NIL
(tabuleiro-preenchido-p (estado-tabuleiro estado2) 1 5)

(print "entrega 2")

;; Entrega 2
;(defstruct problema estado-inicial solucao accoes resultado custo-caminho)
;teste 0.0.1
;nao se sabe o que deve retornar
(print (procura-pp (make-problema
              :estado-inicial (make-estado :pontos 0 :pecas-por-colocar '(o o o o o o o o o o j) :pecas-colocadas '() :tabuleiro (cria-tabuleiro))
              :solucao 'solucao
              :accoes 'accoes
              :resultado 'resultado
              :custo-caminho 'qualidade)))

