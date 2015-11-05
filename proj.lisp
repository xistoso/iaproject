;; 58534 Gil Gomes
;; 58540 Pedro Dias
;; 58551 Goncalo Ribeiro

(defvar *tamanho-tabuleiro* '(18 10))
(defvar *coluna-0* 0)
(defvar *coluna-max* 9)
(defvar *altura-max* 17)

;; Auxiliar Funcions
;; Tabuleiro

(defun tabuleiro-anula-linha (tabuleiro linha)
  (dotimes (coluna-i 10)
    (setf (aref tabuleiro linha coluna-i) nil)))

(defun preenchido-aux (tabuleiro coluna-i &optional (linha-i *altura-max*))
  (if (< coluna-i 0)
      nil
      (or (tabuleiro-preenchido-p tabuleiro linha-i coluna-i) (preenchido-aux tabuleiro (- coluna-i 1) linha-i))))

;;2.1.1
(defstruct accao (pos NIL)
	   (arr NIL :type array))

(defun cria-accao (pos arr)
  (make-accao :pos pos :arr arr))

(defun accao-coluna (acc)
  (accao-pos acc))

(defun accao-peca (acc)
  (accao-arr acc))

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
  (preenchido-aux tabuleiro *coluna-max* linha))

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
	       :pecas-por-colocar (estado-pecas-por-colocar e)
	       :pecas-colocadas (estado-pecas-colocadas e)
	       :Tabuleiro (estado-Tabuleiro e)))