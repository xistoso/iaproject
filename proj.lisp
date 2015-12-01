;;;; IA Tetris
;;; 58534 Gil Gomes
;;; 58540 Pedro Dias
;;; 58551 Goncalo Ribeiro


;;;; Constantes, variaveis e estruturas de dados
(defvar *tamanho-tabuleiro* '(18 10))
(defvar *coluna-0* 0)
(defvar *coluna-max* 9)
(defvar *altura-max* 17)

(defstruct pontos-pecas i j l s z t o)
(defstruct estado pontos pecas-por-colocar pecas-colocadas Tabuleiro)

(defconstant pontos-pecas-max (make-pontos-pecas :i 800 :j 500 :l 500 :s 300 :z 300 :t 300 :o 300)) 

;;;; Tipo tabuleiro

;;; tabuleiro-anula-linha
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro de indice de linha
;;; Esta funcao elimina, no tabuleiro, a linha referenciada
(defun tabuleiro-anula-linha (tabuleiro linha)
  (dotimes (coluna-i 10)
    (setf (aref tabuleiro linha coluna-i) nil)))

;;; preenchido-aux
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro de indice de coluna
;;  opcionalmente, um inteiro de indice de linha.
;; Esta funcao devolve:
;; ...
(defun preenchido-aux (tabuleiro coluna-i &optional (linha-i *altura-max*))
  (if (< coluna-i 0)
      nil
      (or (tabuleiro-preenchido-p tabuleiro linha-i coluna-i) (preenchido-aux tabuleiro (- coluna-i 1) linha-i))))

;;; todo-preenchido-aux
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro de indice de coluna
;; - um inteiro de indice de linha
;;; Esta funcao devolve:
;;
(defun todo-preenchido-aux (tabuleiro coluna-i linha-i)
  (if (tabuleiro-preenchido-p tabuleiro linha-i coluna-i)
      (cond ((= coluna-i 0) T)
	    (T (todo-preenchido-aux tabuleiro (- coluna-i 1) linha-i)))
      nil))


;;;; Seccao 2.1 - Tipos abstractos de informacao 

;;; Seccao 2.1.1 - Tipo Accao

;;; cria-accao
;;; Esta funcao recebe:
;; - um inteiro de indice de coluna correspondente 'a coluna mais
;; 'a esquerda a partir da qual a peca vai ser colocada
;; - um array com uma configuracao da peca a colocar
;;; Esta funcao devolve:
;; - uma nova accao
(defun cria-accao (pos arr)
  (cons pos arr))

;;; accao-coluna
;;; Esta funcao recebe:
;; - uma accao
;;; Esta funcao devolve:
;; - um inteiro de indice de coluna correspondente 'a coluna mais
;; 'a esquerda a partir da qual a peca vai ser colocada
(defun accao-coluna (acc)
  (car acc))

;;; accao-peca
;;; Esta funcao recebe:
;; - uma accao
;;; Esta funcao devolve:
;; - um array com a configuracao geometrica da peca a colocar
(defun accao-peca (acc)
  (cdr acc))

;;; Seccao 2.1.2 - Tipo Tabuleiro

;;; cria-tabuleiro
;;; Esta funcao nao recebe nenhum argumento
;;; Esta funcao devolve:
;; - um tabuleiro vazio
(defun cria-tabuleiro ()
  (make-array *tamanho-tabuleiro* :initial-element nil))

;;; copia-tabuleiro
;;; Esta funcao recebe:
;; - um tabuleiro
;;; Esta funcao devolve:
;; - um novo tabuleiro com o mesmo conteudo do tabuleiro recebido
;; como argumento
(defun copia-tabuleiro (tabuleiro)
  (let* ((dimensions (array-dimensions tabuleiro))
         (novo-tabuleiro (make-array dimensions)))
  (dotimes (i (array-total-size tabuleiro))
  	(setf (row-major-aref novo-tabuleiro i)
          (row-major-aref tabuleiro i)))
novo-tabuleiro))

;;; tabuleiro-preenchido-p
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro de indice de linha
;;; Esta funcao devolve:
;; - um array com a configuracao geometrica da peca a colocar
(defun tabuleiro-preenchido-p (tabuleiro linha coluna)
	(aref tabuleiro linha coluna))

;;; tabuleiro-altura-coluna
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro de indice de coluna
;;; Esta funcao devolve:
;; - um inteiro correspondente 'a altura da coluna referenciada
(defun tabuleiro-altura-coluna (tabuleiro coluna)
    (let ((altura 0))
      (dotimes (i (array-dimension tabuleiro 0) altura)
	       (cond ((tabuleiro-preenchido-p tabuleiro i coluna) (setf altura (+ i 1)))))))

;;; tabuleiro-topo-preenchido-p
;;; Esta funcao recebe:
;; - um tabuleiro
;;; Esta funcao devolve:
;; - o valor logico verdade se existir alguma posicao preenchida no topo
;; do tabuleiro
;; - o valor logico falso caso contrario
(defun tabuleiro-topo-preenchido-p (tabuleiro)
  (preenchido-aux tabuleiro *coluna-max*))

;;; tabuleiro-topo-preenchido-p
;;; Esta funcao recebe:
;; - um tabuleiro
;;; Esta funcao devolve:
;; - o valor logico verdade se existir alguma posicao preenchida no topo
;; do tabuleiro
;; - o valor logico falso caso contrario
(defun tabuleiro-linha-completa-p (tabuleiro linha)
  (todo-preenchido-aux tabuleiro *coluna-max* linha))

;;; tabuleiro-topo-preenchido-p
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro indice de linha
;;; Esta funcao altera:
;; - o tabuleiro recebido, removendo a linha referenciada e fazendo com que
;; as linhas acima da linha referenciada descam uma linha.
(defun tabuleiro-remove-linha! (tabuleiro linha)
  (tabuleiro-anula-linha tabuleiro linha)
  (dotimes (count (- *altura-max* linha))
    (let* ((linha-i (+ linha count))
	         (linha-prox (+ linha-i 1)))
      (dotimes (coluna-i 10)
	       (cond ((tabuleiro-preenchido-p tabuleiro linha-prox coluna-i) (tabuleiro-preenche! tabuleiro linha-i coluna-i))))
          (tabuleiro-anula-linha tabuleiro linha-prox))))

;;; tabuleiro-preenche!
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro indice de linha
;; - um inteiro indice de coluna
;;; Esta funcao altera:
;; - o tabuleiro recebido, na posicao referenciada pelos indices linha e coluna
;; fazendo com que a mesma passe a estar preenchida
(defun tabuleiro-preenche! (tabuleiro linha coluna)
  (cond ((and (>= linha 0) (>= coluna 0)
	     (<= linha *altura-max*) (<= coluna *coluna-max*))
	 (setf (aref tabuleiro linha coluna) T))))

;;; tabuleiro-preenche!
;;; Esta funcao recebe:
;; - um tabuleiro
;; - um inteiro indice de linha
;; - um inteiro indice de coluna
;;; Esta funcao altera:
;; - o tabuleiro recebido, na posicao referenciada pelos indices linha e coluna
;; fazendo com que a mesma passe a estar preenchida
(defun tabuleiros-iguais-p (tabuleiro-a tabuleiro-b)
  ;; equalp compara elemento a elemento
  (equalp tabuleiro-a tabuleiro-b))

;;; tabuleiro->array
;;; Esta funcao recebe:
;; - um tabuleiro
;;; Esta funcao devolve:
;; - um novo tabuleiro com o mesmo conteudo do tabuleiro recebido
;; como argumento
(defun tabuleiro->array (tabuleiro)
  ;; optamos por fazer apenas uma copia do tabuleiro e devolve-la
  (copia-tabuleiro tabuleiro))

;;; tabuleiro->array
;;; Esta funcao recebe:
;; - um array
;;; Esta funcao devolve:
;; - um novo tabuleiro construido a partir do conteudo do array recebido
;; como argumento
(defun array->tabuleiro(array)
  (copia-tabuleiro array))

;;; Seccao 2.1.3 - Tipo Estado

;;; copia-estado
;;; Esta funcao recebe:
;; - um estado
;;; Esta funcao devolve:
;; - um novo estado construido a partir do estado recebido
;; como argumento
(defun copia-estado (e)
  (make-estado :pontos (estado-pontos e)
	       :pecas-por-colocar (copy-list (estado-pecas-por-colocar e))
	       :pecas-colocadas (copy-list (estado-pecas-colocadas e))
	       :Tabuleiro (copia-tabuleiro (estado-Tabuleiro e))))

;;; estados-iguais
;;; Esta funcao recebe:
;; - um estado e1
;; - um estado e2
;;; Esta funcao devolve:
;; - o valor logico verdade se os estados e1 e e2 forem iguais
;; - o valor logico falso caso contrario
(defun estados-iguais-p (e1 e2)
  (equalp e1 e2))

;;; estado-final-p
;;; Esta funcao recebe:
;; - um estado
;;; Esta funcao devolve:
;; - o valor logico verdade se o estado passado como argumento corresponder
;; a um estado final onde o jogador ja' nao possa fazer mais jogadas
;; - o valor logico falso caso contrario
(defun estado-final-p (e)
  (or (not (estado-pecas-por-colocar e)) (tabuleiro-topo-preenchido-p (estado-Tabuleiro e))))

;;; Seccao 2.1.4 - Tipo Problema
(defstruct problema estado-inicial solucao accoes resultado custo-caminho)

;;; Seccao 2.2.1 - Funcoes do problema de procura

;;; solucao
;;; Esta funcao recebe:
;; - um estado
;;; Esta funcao devolve:
;; - o valor logico verdade se o estado passado como argumento corresponder
;; a uma solucao, i.e., se ja' nao existirem pecas por colocar e se o topo do
;; tabuleiro nao estiver preenchido
;; - o valor logico falso caso contrario
(defun solucao (e)
  (and (not (tabuleiro-topo-preenchido-p (estado-Tabuleiro e))) 
       (not (estado-pecas-por-colocar e))))

;;; accoes
;;; Esta funcao recebe:
;; - um estado
;;; Esta funcao devolve:
;; - uma lista de accoes correspondendo a todas as accoes validas que podem
;; ser feitas com a proxima peca a ser colocada
(defun accoes (e)
  (let* ((peca (first (estado-pecas-por-colocar e)))
	 (combinacoes (apropos-list (format nil "peca-~a" peca) 
				    'common-lisp-user))
	 (accoeslst '()))
    (if (tabuleiro-topo-preenchido-p (estado-Tabuleiro e)) nil
     (dolist (orientacao combinacoes accoeslst)
       (dotimes (i (+ (- *coluna-max* (array-dimension (symbol-value orientacao) 1)) 2))
	 (setq accoeslst (append accoeslst (list (cria-accao i (symbol-value orientacao)))))))
)))

;;; resultado
;;; Esta funcao recebe:
;; - um estado
;; - uma accao
;;; Esta funcao devolve:
;; - um novo estado que resulta da aplicacao da accao recebida como argumento
;; no estado recebido como argumento
;; - o opcional usa um boleano para ativar o retorno da altura da peca usada pela 
;;   heuristica que decidimos implementar

(defun resultado (e ac &optional (ret-altura-colocada nil))
  (let ((estadoresultante (copia-estado e))
	(found-p nil)
	(alturafinal nil)
	(peca (accao-peca ac))
	(posicao (accao-coluna ac))
	(cnt 0))
    (setf (estado-pecas-colocadas estadoresultante) 
	  (concatenate 'list (list (first (estado-pecas-por-colocar e))) (estado-pecas-colocadas e)))
    (setf (estado-pecas-por-colocar estadoresultante)
	  (rest (estado-pecas-por-colocar e)))
    (dotimes (altura (+ *altura-max* 1))
      (dotimes (y (array-dimension peca 0))
	(cond ((>= *altura-max* (+ (- *altura-max* altura) y))
	       (dotimes (x (array-dimension peca 1))
		 (cond ((aref peca y x) (cond ((tabuleiro-preenchido-p (estado-Tabuleiro e) (+ (- *altura-max* altura) y) (+ posicao x)) (setf found-p T)))))
		 ))))
      (if found-p (return))
      (setf alturafinal altura))
    (cond (alturafinal
    (dotimes (y (array-dimension peca 0))
	(dotimes (x (array-dimension peca 1))
	  (cond ((aref peca y x) (tabuleiro-preenche! (estado-Tabuleiro estadoresultante) (+ (- *altura-max* alturafinal) y) (+ posicao x))))))))
;ve se o topo esta preenchido caso contrario pontua
    (cond ((tabuleiro-topo-preenchido-p (estado-Tabuleiro estadoresultante)) 
	  (if ret-altura-colocada (cons estadoresultante (- *altura-max* alturafinal)) estadoresultante))
	  (T
    (dotimes (y (array-dimension peca 0))
      (cond ((tabuleiro-linha-completa-p (estado-Tabuleiro estadoresultante) (+(- *altura-max* alturafinal) (- (array-dimension peca 0) y 1))) (tabuleiro-remove-linha! (estado-Tabuleiro estadoresultante) (+(- *altura-max* alturafinal) (- (array-dimension peca 0) y 1))) (incf cnt))))
    (cond ((= cnt 1) (incf (estado-pontos estadoresultante) 100))
	  ((= cnt 2) (incf (estado-pontos estadoresultante) 300))
	  ((= cnt 3) (incf (estado-pontos estadoresultante) 500))
	  ((= cnt 4) (incf (estado-pontos estadoresultante) 800)))
    (if ret-altura-colocada (cons estadoresultante (- *altura-max* alturafinal)) estadoresultante)
))))
      
;;; qualidade
;;; Esta funcao recebe:
;; - um estado
;;; Esta funcao devolve:
;; - um inteiro correspondente ao valor negativo dos pontos ganhos ate' ao momento
(defun qualidade (e)
  (- 0 (estado-pontos e)))

;;; custo-oportunidade
;;; Esta funcao recebe:
;; - um estado
;;; Esta funcao devolve:
;; - o custo de oportunidade de todas as accoes realizadas ate' ao momento
(defun custo-oportunidade (e)
  (let ((result 0))
  (dolist (peca (estado-pecas-colocadas e) (- result (estado-pontos e)))
    (incf result (funcall (intern(format nil "PONTOS-PECAS-~a" peca)) pontos-pecas-max))
    )
))
    
;;; procura-pp
;;; Esta funcao recebe:
;; - um problema
;;; Esta funcao apenas efectua uma chamada 'a funcao recursive-depth-search
(defun procura-pp (problema)
  (let ((lista-accoes '() ))
  (recursive-depth-search (problema-estado-inicial problema) lista-accoes problema)))

;;; recursive-depth-search
;;; Esta funcao recebe:
;; - um estado
;; - uma lista de accoes
;; - um problema
;;; Esta funcao devolve:
;; - uma lista de accoes que se executada pela ordem especificada ira' levar
;; do estado inicial a um estado objectivo
(defun recursive-depth-search (estado lista-accoes problema)
  (let ((result nil)
	(estado-resultante nil))
  (cond ( (funcall (problema-solucao problema) estado) lista-accoes)
        ( (not (funcall (problema-accoes problema) estado)) nil)
        (T (dolist (x (reverse (funcall (problema-accoes problema) estado)) result)
	     (setf estado-resultante (funcall (problema-resultado problema) estado x))
	     (setf result (recursive-depth-search estado-resultante (append lista-accoes (list x)) problema))
             (if result (return result)))))))


(defun insert-at (item list index)
  (concatenate 'list
    (subseq list 0 (1- index))
    (list item)
    (nthcdr (1- index) list)))

(defun insert-sort-heuristic (node list cost heuristic)
  (let ((displacement 1))
    (dolist (x list)
      (if ( <= (+ (funcall cost (car node)) (funcall heuristic (car node)))
	      (+ (funcall cost (car x)) (funcall heuristic (car x)))
	      ) (return))
      (incf displacement))
	(insert-at node list displacement)))

(defun procura-A* (problema heuristica)
  (let* ((node (cons (problema-estado-inicial problema) '()))
	(fronteira (list node)))
    (loop
      (if (not fronteira) (return nil))
      (setf node (first fronteira))
      (setf fronteira (rest fronteira))
      (if (funcall (problema-solucao problema) (car node)) (return (cdr node)))
      (dolist (x (funcall (problema-accoes problema) (car node)))
		 (setf fronteira (insert-sort-heuristic (cons (funcall (problema-resultado problema) (car node) x) (append (cdr node) (list x))) fronteira (problema-custo-caminho problema) heuristica)))
		 )))

;;;funcoes auxiliares para a procura best
;; necessario para funcionar com o retorna da altura da peca no solucao
(defun resultado-aux (e ac)
  (resultado (car e) ac T))

(defun solucao-aux (e)
  (solucao (car e)))

(defun accoes-aux (e)
   (accoes (car e)))

(defun qualidade-aux (e)
  (qualidade (car e)))

;;custo-oportunidade mas que tambem tenta colocar a peca o mais baixo possivel
(defun co-mais-baixas (e)
  (+ (custo-oportunidade (car e)) (* 1000 (cdr e))))

(defun procura-best (array lista-pecas)
  (procura-A* (make-problema
	       :estado-inicial (cons (make-estado :pontos 0 :pecas-por-colocar lista-pecas :pecas-colocadas '() :tabuleiro (array->tabuleiro array)) 0)
	       :solucao #'solucao-aux
	       :accoes #'accoes-aux
	       :resultado #'resultado-aux
	       :custo-caminho #'co-mais-baixas ) #'qualidade-aux ))

;(load "utils.fas")
