(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (let ((n (string-upcase nome-da-erva)))
    (cond
      ((string= n "GINSENG") (* preco-base 3.0))
      ((string= n "LOTUS") (* preco-base 1.5))
      (t preco-base))))

(format t "Dosagem (60kg, 14 anos): ~A ml~%" (calcula-dosagem 60 14))
(format t "Preco final (Lotus, base 10): ~A moedas~%" (ajusta-preco 10 "Lotus"))
(format t "Dosagem (10kg, 7 anos): ~A ml~%" (calcula-dosagem 10 7))
(format t "Dosagem (25kg, 8 anos): ~A ml~%" (calcula-dosagem 25 8))
(format t "Preco (Ginseng, base 5): ~A moedas~%" (ajusta-preco 5 "Ginseng"))
(format t "Preco (ErvaX, base 7): ~A moedas~%" (ajusta-preco 7 "ErvaX"))
