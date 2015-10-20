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