;; 58534 Gil Gomes
;; 58540 Pedro Dias
;; 58551 Goncalo Ribeiro

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
  (make-array '(18 10) :initial-element nil))

(defun copia-tabuleiro (tabuleiro)
  (let* ((dimensions (array-dimensions tabuleiro))
        (novo-tabuleiro (make-array dimensions)))
  (dotimes (i (array-total-size tabuleiro))
  	(setf (row-major-aref novo-tabuleiro i)
          (row-major-aref tabuleiro i)))
novo-tabuleiro))

(defun tabuleiro-preenchido-p (tabuleiro linha coluna)
	(aref tabuleiro linha coluna))