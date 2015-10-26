;; 58534 Gil Gomes
;; 58540 Pedro Dias
;; 58551 Goncalo Ribeiro

(defvar *tamanho-tabuleiro* '(18 10))
(defvar *coluna-0* 0)
(defvar *coluna-9* 9)

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
	(cond ((tabuleiro-preenchido-p tabuleiro i coluna) (setf altura i))))))

(defun tabuleiro-topo-preenchido-p (tabuleiro)
  (let ((res nil))
    (dotimes (coluna-i 10)
      (if  (not (null (aref tabuleiro *coluna-0* coluna-i)))
        (setf res (or (aref tabuleiro *coluna-0* coluna-i) res))))
    res))

;equalp compara elemento a elemento
(defun tabuleiros-iguais-p (tabuleiro-a tabuleiro-b)
  (equalp tabuleiro-a tabuleiro-b))

;a nossa implementacao se se mantiver e apenas copy
(defun tabuleiro->array(tabuleiro)
  (copia-tabuleiro tabuleiro))

(defun array->tabuleiro(array)
  (copia-tabuleiro array))

