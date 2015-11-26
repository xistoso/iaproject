;; 58534 Gil Gomes
;; 58540 Pedro Dias
;; 58551 Goncalo Ribeiro

(defvar *tamanho-tabuleiro* '(18 10))
(defvar *coluna-0* 0)
(defvar *coluna-max* 9)
(defvar *altura-max* 17)

(defstruct pontos-pecas i j l s z t o)

(defconstant pontos-pecas-max (make-pontos-pecas :i 800 :j 500 :l 500 :s 300 :z 300 :t 300 :o 300)) 

;; Auxiliari Functions
;; Tabuleiro

(defun tabuleiro-anula-linha (tabuleiro linha)
  (dotimes (coluna-i 10)
    (setf (aref tabuleiro linha coluna-i) nil)))

(defun preenchido-aux (tabuleiro coluna-i &optional (linha-i *altura-max*))
  (if (< coluna-i 0)
      nil
      (or (tabuleiro-preenchido-p tabuleiro linha-i coluna-i) (preenchido-aux tabuleiro (- coluna-i 1) linha-i))))

(defun todo-preenchido-aux (tabuleiro coluna-i linha-i)
  (if (tabuleiro-preenchido-p tabuleiro linha-i coluna-i)
      (cond ((= coluna-i 0) T)
	    (T (todo-preenchido-aux tabuleiro (- coluna-i 1) linha-i)))
      nil))


;;2.1.1

(defun cria-accao (pos arr)
  (cons pos arr))

(defun accao-coluna (acc)
  (car acc))

(defun accao-peca (acc)
  (cdr acc))

;2.1.2
(defun cria-tabuleiro ()
  (make-array *tamanho-tabuleiro* :initial-element nil))

(defun copia-tabuleiro (tabuleiro)
  (let* ((dimensions (array-dimensions tabuleiro))
         (novo-tabuleiro (make-array dimensions)))
  (dotimes (i (array-total-size tabuleiro))
  	(setf (row-major-aref novo-tabuleiro i)
          (row-major-aref tabuleiro i)))
novo-tabuleiro))

(defun tabuleiro-preenchido-p (tabuleiro linha coluna)
	(aref tabuleiro linha coluna))

(defun tabuleiro-altura-coluna (tabuleiro coluna)
    (let ((altura 0))
      (dotimes (i (array-dimension tabuleiro 0) altura)
	       (cond ((tabuleiro-preenchido-p tabuleiro i coluna) (setf altura (+ i 1)))))))
                                             
(defun tabuleiro-topo-preenchido-p (tabuleiro)
  (preenchido-aux tabuleiro *coluna-max*))

(defun tabuleiro-linha-completa-p (tabuleiro linha)
  (todo-preenchido-aux tabuleiro *coluna-max* linha))

(defun tabuleiro-remove-linha! (tabuleiro linha)
  (tabuleiro-anula-linha tabuleiro linha)
  (dotimes (count (- *altura-max* linha))
    (let* ((linha-i (+ linha count))
	         (linha-prox (+ linha-i 1)))
      (dotimes (coluna-i 10)
	       (cond ((tabuleiro-preenchido-p tabuleiro linha-prox coluna-i) (tabuleiro-preenche! tabuleiro linha-i coluna-i))))
          (tabuleiro-anula-linha tabuleiro linha-prox))))

(defun tabuleiro-preenche! (tabuleiro linha coluna)
  (cond ((and (>= linha 0) (>= coluna 0)
	     (<= linha *altura-max*) (<= coluna *coluna-max*))
	 (setf (aref tabuleiro linha coluna) T))))

;equalp compara elemento a elemento
(defun tabuleiros-iguais-p (tabuleiro-a tabuleiro-b)
  (equalp tabuleiro-a tabuleiro-b))

;a nossa implementacao se se mantiver e apenas copy
(defun tabuleiro->array(tabuleiro)
  (copia-tabuleiro tabuleiro))

(defun array->tabuleiro(array)
  (copia-tabuleiro array))

;2.1.3

(defstruct estado pontos pecas-por-colocar pecas-colocadas Tabuleiro)

(defun copia-estado (e)
  (make-estado :pontos (estado-pontos e)
	       :pecas-por-colocar (copy-list (estado-pecas-por-colocar e))
	       :pecas-colocadas (copy-list (estado-pecas-colocadas e))
	       :Tabuleiro (copia-tabuleiro (estado-Tabuleiro e))))

(defun estados-iguais-p (e1 e2)
  (equalp e1 e2))

(defun estado-final-p (e)
  (or (not (estado-pecas-por-colocar e)) (tabuleiro-topo-preenchido-p (estado-Tabuleiro e))))

;2.1.4
(defstruct problema estado-inicial solucao accoes resultado custo-caminho)

;2.2.1

(defun solucao (e)
  (and (not (tabuleiro-topo-preenchido-p (estado-Tabuleiro e))) 
       (not (estado-pecas-por-colocar e))))

(defun accoes (e)
  (let* ((peca (first (estado-pecas-por-colocar e)))
	 (combinacoes (apropos-list (format nil "peca-~a" peca) 
				    'common-lisp-user))
	 (accoeslst '()))
   ;(accoeslst nil))
    (dolist (orientacao combinacoes accoeslst)
      (dotimes (i (+ (- *coluna-max* (array-dimension (symbol-value orientacao) 1)) 2))
	(setq accoeslst (append accoeslst (list (cria-accao i (symbol-value orientacao)))))))
))

(defun resultado (e ac)
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
    (dotimes (y (array-dimension peca 0))
	(dotimes (x (array-dimension peca 1))
	  (cond ((aref peca y x) (tabuleiro-preenche! (estado-Tabuleiro estadoresultante) (+ (- *altura-max* alturafinal) y) (+ posicao x))))))
    (cond ((tabuleiro-topo-preenchido-p (estado-Tabuleiro estadoresultante)) estadoresultante)
	  (T
    (dotimes (y (array-dimension peca 0))
      (cond ((tabuleiro-linha-completa-p (estado-Tabuleiro estadoresultante) (+(- *altura-max* alturafinal) (- (array-dimension peca 0) y 1))) (tabuleiro-remove-linha! (estado-Tabuleiro estadoresultante) (+(- *altura-max* alturafinal) (- (array-dimension peca 0) y 1))) (incf cnt))))
    (cond ((= cnt 1) (incf (estado-pontos estadoresultante) 100))
	  ((= cnt 2) (incf (estado-pontos estadoresultante) 300))
	  ((= cnt 3) (incf (estado-pontos estadoresultante) 500))
	  ((= cnt 4) (incf (estado-pontos estadoresultante) 800)))
    estadoresultante
))))
      

(defun qualidade (e)
  (- 0 (estado-pontos e)))

(defun custo-oportunidade (e)
  (let ((result 0))
  (dolist (peca (estado-pecas-colocadas e) (- result (estado-pontos e)))
    (incf result (funcall (intern(format nil "PONTOS-PECAS-~a" peca)) pontos-pecas-max))
    )
))
    
    
(defun procura-pp (problema)
  (let ((lista-accoes '() ))
  (recursive-depth-search (problema-estado-inicial problema) lista-accoes problema)))

(defun recursive-depth-search (estado lista-accoes problema)
  (let ((resultado nil))
  (cond ( (funcall (problema-solucao problema) estado) lista-accoes)
        ( (not (funcall (problema-accoes problema) estado)) nil)
        (T (dolist (x (funcall (problema-accoes problema) estado) resultado)
             
              (setf resultado (recursive-depth-search (funcall (problema-resultado problema) estado x) (append lista-accoes (list x)) problema))
              (if (not resultado) (break)))))))


(defun procura-A* (problema heuristica)
  (cons problema heuristica))

(defun procura-best (array lista-pecas)
  (cons array lista-pecas))

 (load "utils.fas") 
