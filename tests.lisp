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

(setf (aref tabuleiro 0 4) T)

(setf res (tabuleiro-topo-preenchido-p tabuleiro))

(print tabuleiro)

(print res)

(tabuleiro-remove-linha! tabuleiro 3)

(print tabuleiro)