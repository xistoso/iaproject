
(print "Entrega 2 - Teste 01")
;;; Teste 01 E2 - correspondente ao Teste 2 da Entrega 1
;;; Testes tipo tabuleiro 1
;;deve retornar IGNORE
(ignore-value (setf tab1 (cria-tabuleiro)))
;;deve retornar NIL
(tabuleiro-preenchido-p tab1 0 0)
;;deve retornar NIL
(tabuleiro-preenchido-p tab1 5 5)
;;deve retornar NIL
(tabuleiro-preenchido-p tab1 17 0)
;;deve retornar 0
(tabuleiro-altura-coluna tab1 9)
;;deve retornar NIL
(tabuleiro-linha-completa-p tab1 0)
;;deve retornar NIL
(tabuleiro-topo-preenchido-p tab1)
;;deve retornar IGNORE
(ignore-value (tabuleiro-preenche! tab1 17 0))
;;deve retornar T
(tabuleiro-topo-preenchido-p tab1)
(terpri)
(terpri)
(terpri)


(print "Entrega 2 - Teste 02")
;;; Teste 02 E2- correspondente ao Teste 5 da Entrega 1
;;; Testes tipo tabuleiro 2
;;deve retornar IGNORE
(ignore-value (setf tab1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (coluna 10)(tabuleiro-preenche! tab1 2 coluna)))
;;deve retornar IGNORE
(ignore-value (tabuleiro-preenche! tab1 0 0))
;;deve retornar IGNORE
(ignore-value (tabuleiro-preenche! tab1 3 3))
;;deve retornar 3
(tabuleiro-altura-coluna tab1 0)
;;deve retornar 4
(tabuleiro-altura-coluna tab1 3)
;;deve retornar T
(tabuleiro-preenchido-p tab1 0 0)
;;deve retornar T
(tabuleiro-preenchido-p tab1 3 3)
;;deve retornar IGNORE
(ignore-value (tabuleiro-remove-linha! tab1 2))
;;deve retornar T
(tabuleiro-preenchido-p tab1 0 0)
;;deve retornar NIL
(tabuleiro-preenchido-p tab1 0 1)
;;deve retornar NIL
(tabuleiro-preenchido-p tab1 3 3)
;;deve retornar T
(tabuleiro-preenchido-p tab1 2 3)
;;deve retornar NIL
(tabuleiro-preenchido-p tab1 2 2)
;;deve retornar NIL
(tabuleiro-preenchido-p tab1 1 2)
;;deve retornar 3
(tabuleiro-altura-coluna tab1 3)
(terpri)
(terpri)
(terpri)


(print "Entrega 2 - Teste 03")
;;; Teste 03 E2 - correspondente ao Teste 8 da Entrega 1
;;; Testes tipo estado 2
;;deve retornar IGNORE
(ignore-value (setf estado1 (make-estado :pontos 50 :pecas-por-colocar '(i j) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (copia-estado estado1)))
;;deve retornar NIL
(eq estado1 estado2)
;;retorna 50
(estado-pontos estado2)
;;retorna '(I J)
(estado-pecas-por-colocar estado2)
;;deve retornar NIL
(eq (estado-pecas-por-colocar estado1) (estado-pecas-por-colocar estado2))
;;retorna '(Z Z Z)
(estado-pecas-colocadas estado2)
;;deve retornar NIL
(eq (estado-pecas-colocadas estado1) (estado-pecas-colocadas estado2))
;;deve retornar T
(tabuleiros-iguais-p (cria-tabuleiro) (estado-tabuleiro estado2))
;;deve retornar T
(tabuleiros-iguais-p (estado-tabuleiro estado1) (estado-tabuleiro estado2))
;;deve retornar NIL
(eq (estado-tabuleiro estado1) (estado-tabuleiro estado2))
(terpri)
(terpri)
(terpri)




(print "Entrega 2 - Teste 04")
;;; Teste 04 E2 - correspondente ao teste 9 da Entrega 1
;;; Testes tipo estado 3
;;deve retornar IGNORE
(ignore-value (setf estado1 (make-estado :pontos 50 :pecas-por-colocar '(i j) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (copia-estado estado1)))
;;deve retornar T
(estados-iguais-p estado1 estado2)
;;deve retornar NIL
(estados-iguais-p estado1 (make-estado :pontos 0 :pecas-por-colocar NIL :pecas-colocadas NIL :tabuleiro (cria-tabuleiro)))
;;deve retornar T
(estados-iguais-p (make-estado :pontos 0 :pecas-por-colocar NIL :pecas-colocadas NIL :tabuleiro (cria-tabuleiro)) (make-estado :pontos 0 :pecas-por-colocar NIL :pecas-colocadas NIL :tabuleiro (cria-tabuleiro)))
(terpri)
(terpri)
(terpri)


(print "Entrega 2 - Teste 05")
;;; teste 05 E2 - correspondente ao Teste 10 da Entrega 1
;;; Testes tipo estado 4
;;deve retornar T
(estado-final-p (make-estado :pontos 0 :pecas-por-colocar NIL :pecas-colocadas NIL :tabuleiro (cria-tabuleiro)))
;;deve retornar NIL
(estado-final-p (make-estado :pontos 0 :pecas-por-colocar '(i) :pecas-colocadas NIL :tabuleiro (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (coluna 10)(tabuleiro-preenche! t1 17 coluna)))
;;deve retornar IGNORE
(ignore-value (setf estado1 (make-estado :pontos 0 :pecas-por-colocar '(i j z) :pecas-colocadas NIL :tabuleiro t1)))
;;deve retornar T
(estado-final-p estado1)
;;deve retornar IGNORE
(ignore-value (setf t2 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (coluna 10)(tabuleiro-preenche! t2 16 coluna)))
;;deve retornar IGNORE
(ignore-value (setf estado2 (make-estado :pontos 0 :pecas-por-colocar '(i j z) :pecas-colocadas NIL :tabuleiro t2)))
;;deve retornar NIL
(estado-final-p estado2)
(terpri)
(terpri)
(terpri)



(print "Entrega 2 - Teste 06")
;;; Teste 06 E2 - correspondente ao Teste 12 da Entrega 1
;;; Testes fn solucao
;;deve retornar NIL
(solucao (make-estado :pontos 50 :pecas-por-colocar '(i j) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro)))
;;deve retornar T
(solucao (make-estado :pontos 50 :pecas-por-colocar '() :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (coluna 10)(tabuleiro-preenche! t1 17 coluna)))
;;deve retornar IGNORE
(ignore-value (setf estado1 (make-estado :pontos 50 :pecas-por-colocar '(i j) :pecas-colocadas '(z z z) :tabuleiro t1)))
;;deve retornar NIL
(solucao estado1)
;;deve retornar IGNORE
(ignore-value (setf t2 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (coluna 10)(tabuleiro-preenche! t2 16 coluna)))
;;deve retornar IGNORE
(ignore-value (setf estado2 (make-estado :pontos 50 :pecas-por-colocar '(i j) :pecas-colocadas '(z z z) :tabuleiro t2)))
;;deve retornar NIL
(solucao estado2)
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 07")
;;; Teste 07 E2 - correspondente ao Teste 13 da Entrega 1
;;; Testes fn accoes
;;deve retornar T
(equalp '((0 . #2A((T) (T) (T) (T))) (1 . #2A((T) (T) (T) (T))) (2 . #2A((T) (T) (T) (T))) (3 . #2A((T) (T) (T) (T))) (4 . #2A((T) (T) (T) (T))) (5 . #2A((T) (T) (T) (T))) (6 . #2A((T) (T) (T) (T))) (7 . #2A((T) (T) (T) (T))) (8 . #2A((T) (T) (T) (T))) (9 . #2A((T) (T) (T) (T))) (0 . #2A((T T T T))) (1 . #2A((T T T T))) (2 . #2A((T T T T))) (3 . #2A((T T T T))) (4 . #2A((T T T T))) (5 . #2A((T T T T))) (6 . #2A((T T T T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(i) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))
;;deve retornar T
(equalp '((0 . #2A((T T) (T NIL) (T NIL))) (1 . #2A((T T) (T NIL) (T NIL))) (2 . #2A((T T) (T NIL) (T NIL))) (3 . #2A((T T) (T NIL) (T NIL))) (4 . #2A((T T) (T NIL) (T NIL)))(5 . #2A((T T) (T NIL) (T NIL))) (6 . #2A((T T) (T NIL) (T NIL))) (7 . #2A((T T) (T NIL) (T NIL))) (8 . #2A((T T) (T NIL) (T NIL))) (0 . #2A((T NIL NIL) (T T T)))(1 . #2A((T NIL NIL) (T T T))) (2 . #2A((T NIL NIL) (T T T))) (3 . #2A((T NIL NIL) (T T T))) (4 . #2A((T NIL NIL) (T T T))) (5 . #2A((T NIL NIL) (T T T)))(6 . #2A((T NIL NIL) (T T T))) (7 . #2A((T NIL NIL) (T T T))) (0 . #2A((NIL T) (NIL T) (T T))) (1 . #2A((NIL T) (NIL T) (T T))) (2 . #2A((NIL T) (NIL T) (T T)))(3 . #2A((NIL T) (NIL T) (T T))) (4 . #2A((NIL T) (NIL T) (T T))) (5 . #2A((NIL T) (NIL T) (T T))) (6 . #2A((NIL T) (NIL T) (T T))) (7 . #2A((NIL T) (NIL T) (T T))) (8 . #2A((NIL T) (NIL T) (T T))) (0 . #2A((T T T) (NIL NIL T))) (1 . #2A((T T T) (NIL NIL T))) (2 . #2A((T T T) (NIL NIL T))) (3 . #2A((T T T) (NIL NIL T)))(4 . #2A((T T T) (NIL NIL T))) (5 . #2A((T T T) (NIL NIL T))) (6 . #2A((T T T) (NIL NIL T))) (7 . #2A((T T T) (NIL NIL T)))) (accoes (make-estado :pontos 50 :pecas-por-colocar '(l) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))
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
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 08")
;;; Teste 08 E2 - correspondente ao Teste 14 da Entrega 1
;;; Testes fn resultado
;;deve retornar IGNORE
(ignore-value (setf estado1 (make-estado :pontos 50 :pecas-por-colocar '(i j) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado1 '(3 . #2A((T T nil)(nil T T))))))
;;deve retornar NIL
(eq estado1 estado2)
;;deve retornar '(I Z Z Z)
(estado-pecas-colocadas estado2)
;;deve retornar '(J)
(estado-pecas-por-colocar estado2)
;;deve retornar 50
(estado-pontos estado2)
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 09")
;;; Teste 09 E2 - correspondente ao Teste 15 da Entrega 1
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
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 10")
;;; Teste 10 E2 - correspondente ao Teste 17 da entrega 1
;;; Testes fn custo-oportunidade
;;deve retornar 700
(custo-oportunidade (make-estado :pontos 100 :pecas-por-colocar '(i) :pecas-colocadas '(i) :tabuleiro (cria-tabuleiro)))
;;deve retornar 400
(custo-oportunidade (make-estado :pontos 100 :pecas-por-colocar '(i) :pecas-colocadas '(j) :tabuleiro (cria-tabuleiro)))
;;deve retornar 400
(custo-oportunidade (make-estado :pontos 100 :pecas-por-colocar '(i) :pecas-colocadas '(l) :tabuleiro (cria-tabuleiro)))
;;deve retornar 200
(custo-oportunidade (make-estado :pontos 100 :pecas-por-colocar '(i) :pecas-colocadas '(s) :tabuleiro (cria-tabuleiro)))
;;deve retornar 200
(custo-oportunidade (make-estado :pontos 100 :pecas-por-colocar '(i) :pecas-colocadas '(z) :tabuleiro (cria-tabuleiro)))
;;deve retornar 200
(custo-oportunidade (make-estado :pontos 100 :pecas-por-colocar '(i) :pecas-colocadas '(t) :tabuleiro (cria-tabuleiro)))
;;deve retornar 200
(custo-oportunidade (make-estado :pontos 100 :pecas-por-colocar '(i) :pecas-colocadas '(o) :tabuleiro (cria-tabuleiro)))
;;deve retornar 850
(custo-oportunidade (make-estado :pontos 50 :pecas-por-colocar '(i) :pecas-colocadas '(z z z) :tabuleiro (cria-tabuleiro)))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 11")
;;; Teste 11 E2 - correspondente ao Teste 18 publicado na fase 1 mas que nao chegou a ser testado na fase 1
;;; Testes fn resultado com pecas mais dificeis
;;deve retornar IGNORE
(ignore-value (setf estado1 (make-estado :pontos 0 :pecas-por-colocar '(t i j t z j) :pecas-colocadas '() :tabuleiro (cria-tabuleiro))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado1 '(0 . #2A((T T T)(NIL T NIL))))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(1 . #2A((T)(T)(T)(T))))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(1 . #2A((NIL NIL T)(T T T))))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(3 . #2A((NIL T NIL)(T T T))))))
;;deve retornar IGNORE
(ignore-value (setf estado2 (resultado estado2 '(6 . #2A((NIL T T)(T T NIL))))))
;;deve retornar um array com as pecas colocadas nas posicoes certas, vejam o output
(tabuleiro->array (estado-tabuleiro estado2))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 12")
;;; Teste 12 E2 
;;; Testes funcao accoes em que o estado nao tem mais pecas por colocar ou esta cheio
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar NIL
(accoes (make-estado :pontos 0 :pecas-por-colocar '() :pecas-colocadas '() :tabuleiro t1))
;;deve retornar uma lista de accoes para a peca l (ver ficheiro output)
(accoes (make-estado :pontos 0 :pecas-por-colocar '(l i j) :pecas-colocadas '() :tabuleiro t1))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 18)(tabuleiro-preenche! t1 linha 0)))
;;deve retornar NIL
(accoes (make-estado :pontos 0 :pecas-por-colocar '(o t j) :pecas-colocadas '(i i i i) :tabuleiro t1))
;;deve retornar NIL
(accoes (make-estado :pontos 0 :pecas-por-colocar '(t l t) :pecas-colocadas '(i i i i) :tabuleiro t1))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 13")
;;; Teste 13 E2
;;; procura profundidade primeiro num tabuleiro vazio, e num tabuleiro onde nao existe solucao
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-pp (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(j l t o z s i)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'(lambda (x) 0)))
;;deve retornar IGNORE
(tabuleiro-preenche! t1 17 0)
;;deve retornar NIL (nao existe solucao)
(procura-pp (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(j l t o z s i)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'(lambda (x) 0)))


;;; Output:

;((7 . #2A((NIL NIL T) (T T T))) (7 . #2A((T T T) (NIL NIL T)))
;(8 . #2A((NIL T) (T T) (NIL T))) (8 . #2A((T T) (T T)))
;(8 . #2A((T NIL) (T T) (NIL T))) (8 . #2A((NIL T) (T T) (T NIL))) (6 . #2A((T T T T))))

(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 14")
;;; Teste 14 E2 
;;; procura profundidade primeiro num tabuleiro com algumas pecas
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
(ignore-value (dotimes (coluna 9) (tabuleiro-preenche! t1 0 (+ coluna 1))(tabuleiro-preenche! t1 1 (+ coluna 1))(tabuleiro-preenche! t1 2 (+ coluna 1))))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-pp (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(o o o o o l l t t j j i i)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'(lambda (x) 0)))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 15")
;;; Teste 15 E2
;;; procura profundidade primeiro num tabuleiro muito preenchido, eventualmente vao ser feitas algumas linhas, e tb num tabuleiro que nao tem solucao
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 17) (dotimes (coluna 8) (tabuleiro-preenche! t1 linha (+ coluna 2)))))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-pp (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(o l t s z)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'(lambda (x) 0)))
;;deve retornar IGNORE
(ignore-value (setf t2 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 17) (dotimes (coluna 10) (tabuleiro-preenche! t2 linha coluna))))
;;deve retornar NIL (nao existe solucao)
(procura-pp (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t2 :pecas-colocadas () :pecas-por-colocar '(o)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'(lambda (x) 0)))

;;; Output:

;((0 . #2A((T T) (T T))) (7 . #2A((T T T) (NIL NIL T))) (0 . #2A((NIL T) (T T) (NIL T)))
 ;(5 . #2A((NIL T) (T T) (T NIL))) (3 . #2A((T NIL) (T T) (NIL T))))

(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 16")
;;; Teste 16 E2
;;; procura profundidade primeiro num problema alternativo ao jogo do tetris, a implementacao da procura-pp deve ser independente do problema de procura
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-pp (make-problema :estado-inicial 1 :accoes #'(lambda (e) (if (<= e 15) (list 'left 'right) ())) :resultado #'(lambda (e a) (if (eq a 'left) (* 2 e) (1+ (* 2 e)))) :solucao #'(lambda (e) (= e 13)) :custo-caminho #'(lambda (x) 0)))

;;; Output:

;(RIGHT LEFT RIGHT)
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 17")
;;; Teste 17 E2
;;; procura A* num tabuleiro onde nao existe solucao
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 17) (dotimes (coluna 9) (tabuleiro-preenche! t1 linha coluna))))
;;deve retornar NIL (nao existe solucao)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(t s)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'qualidade) #'(lambda (e) 0))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 18")
;;; Teste 18 E2
;;; procura A* num tabuleiro vazio. Nao e possivel fazer nenhuma linha, por isso aqui testamos apenas se trabalham com a lista de abertos/fronteira de acordo com a ordem especificada
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(t s)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'qualidade) #'(lambda (x) 0))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(l i)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'custo-oportunidade) #'(lambda (x) 0))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 19")
;;; Teste 19 E2 
;;; procura A* num tabuleiro onde e possivel fazer 4 linhas com qualidade.
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 10) (dotimes (coluna 8) (tabuleiro-preenche! t1 linha coluna))))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(l j)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'qualidade) #'(lambda (x) 0))

(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 20")
;;; Teste 20 E2
;;; procura A* num tabuleiro onde e possivel fazer 4 linhas com custo-oportunidade.
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 10) (dotimes (coluna 8) (tabuleiro-preenche! t1 linha coluna))))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(j l)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'custo-oportunidade) #'(lambda (x) 0))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 21")
;;; Teste 21 E2 
;;; procura A* num tabuleiro quase cheio usando qualidade
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 16) (dotimes (coluna 8) (tabuleiro-preenche! t1 linha coluna))))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(o l j)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'qualidade) #'(lambda (x) 0))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 22")
;;; Teste 22 E2
;;; procura A* num tabuleiro quase cheio usando custo oportunidade
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 16) (dotimes (coluna 7) (tabuleiro-preenche! t1 linha coluna))))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(l j)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'custo-oportunidade) #'(lambda (x) 0))
(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 23")
;;; Teste 23 E2
;;; procura A* num problema alternativo ao jogo do tetris, a implementacao da procura-A* deve ser independente do problema de procura
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (list 0 0 0) :accoes #'(lambda (e) (list 'up 'down 'left 'right)) :resultado #'(lambda (e a) (cond ((eq a 'up) (list (first e) (1+ (second e)) (1+ (third e))))((eq a 'down) (list (first e) (1- (second e)) (1+ (third e))))((eq a 'left) (list (1- (first e)) (second e) (1+ (third e))))(T (list (1+ (first e)) (second e) (1+ (third e)))))) :custo-caminho #'(lambda (e) (third e)) :solucao #'(lambda (e) (and (= (first e) 2)(= (second e) 3)))) #'(lambda (e) (+ (abs (- 2 (first e))) (abs (- 3 (second e))))))

(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 24")
;;; Teste 24 E2
;;; procura-best num jogo com apenas uma peca, e obrigatorio num tabuleiro tao simples retornar a jogada optima
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-best '#2A((T T T T NIL T T T T T)(T T T NIL NIL NIL T T T T)(T T T NIL NIL NIL T T T T)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)) '(t))

(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 25")
;;; Teste 25 E2
;;; procura-best num tabuleiro com 4 jogadadas por fazer. Os grupos tem um tempo limitado para conseguir obter pelo menos 500 pontos. 
;;; deve retornar IGNORE
(ignore-value (setf a1 '#2A((T T T T NIL NIL T T T T)(T T T NIL NIL NIL T T T T)(T T T NIL NIL NIL T T T T)(T T T NIL NIL NIL T T T T)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL))))
;;;deve retornar IGNORE
(ignore-value (setf r1 (procura-best a1 '(t i l l))))
;;;deve retornar T
(>= (executa-jogadas (make-estado :tabuleiro (array->tabuleiro a1) :pecas-por-colocar '(t i l l) :pontos 0 :pecas-colocadas '()) r1 NIL) 500)

(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 26")
;;; teste 26 E2, testa abstracao de dados do tipo tabuleiro, na funcoes procura-pp
(make-package 'teste)
(in-package teste)
;; o projecto nao pode ser compilado, pois iria ter problemas em redefinir estruturas compiladas em lisp
;; retorna T
(load "projecto-alunos.lisp") 
;; carrega um tipo tabuleiro mt particular, fazendo override as definicoes dos alunos
;; retorna T
(load "TAI-tabuleiro.lisp")
;; carrega o ficheiro de utils nao compilado
;; retorna T
(load "utils.lisp")
;;deve retornar IGNORE
(progn (setf t1 (cria-tabuleiro)) 'IGNORE)
;;deve retornar IGNORE
(progn (dotimes (linha 17) (dotimes (coluna 8) (tabuleiro-preenche! t1 linha (+ coluna 2)))) 'IGNORE)
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-pp (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1  :pecas-por-colocar '(o l t s z)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'(lambda (x) 0)))

(terpri)
(terpri)
(terpri)

(print "Entrega 2 - Teste 27")
;;; teste 27 E2, testa abstracao de dados do tipo tabuleiro, na funcoes procura-A*
(make-package 'teste)
(in-package teste)
;; o projecto nao pode ser compilado, pois iria ter problemas em redefinir estruturas compiladas em lisp
;; retorna T
(load "projecto-alunos.lisp") 
;; carrega um tipo tabuleiro mt particular, fazendo override as definicoes dos alunos
;; retorna T
(load "TAI-tabuleiro.lisp")
;; carrega o ficheiro de utils nao compilado
;; retorna T
(load "utils.lisp")
;;deve retornar IGNORE
(ignore-value (setf t1 (cria-tabuleiro)))
;;deve retornar IGNORE
(ignore-value (dotimes (linha 10) (dotimes (coluna 8) (tabuleiro-preenche! t1 linha coluna))))
;;deve retornar uma lista de accoes (ver ficheiro output)
(procura-A* (make-problema :estado-inicial (make-estado :pontos 0 :tabuleiro t1 :pecas-colocadas () :pecas-por-colocar '(l j)) :solucao #'solucao :accoes #'accoes :resultado #'resultado :custo-caminho #'qualidade) #'(lambda (x) 0))

(terpri)
(terpri)
(terpri)

(print "End")
(terpri)
(terpri)
(terpri)
