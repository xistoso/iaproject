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