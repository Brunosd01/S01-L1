(defstruct ocorrencia nome ritual nivel-medo agentes-enviados)

(defun soma-medo-recursiva (lista)
  (if (null lista)
      0
      (+ (ocorrencia-nivel-medo (car lista))
         (soma-medo-recursiva (cdr lista)))))

(defun analise-final (lista-ocorrencias)
  (let* ((total (soma-medo-recursiva lista-ocorrencias))
         (n (length lista-ocorrencias))
         (media (if (> n 0) (/ total (float n)) 0.0)))
    (mapcar #'ocorrencia-nome
            (remove-if-not (lambda (o)
                             (and (> (ocorrencia-agentes-enviados o) 3)
                                  (> (ocorrencia-nivel-medo o) media)))
                           lista-ocorrencias))))

(defun cria-ocorrencias-exemplo ()
  (list
   (make-ocorrencia :nome "Ritual da Lua" :ritual "Lua Cheia" :nivel-medo 8 :agentes-enviados 4)
   (make-ocorrencia :nome "Portao do Abismo" :ritual "Abismo" :nivel-medo 12 :agentes-enviados 5)
   (make-ocorrencia :nome "Sombras do Vale" :ritual "Vale" :nivel-medo 6 :agentes-enviados 2)
   (make-ocorrencia :nome "Cena Silenciosa" :ritual "Silencio" :nivel-medo 7 :agentes-enviados 4)
   (make-ocorrencia :nome "Festa Fantasma" :ritual "Festa" :nivel-medo 5 :agentes-enviados 6)))

(let ((lista (cria-ocorrencias-exemplo)))
  (format t "Total medo: ~a~%" (soma-medo-recursiva lista))
  (format t "Media medo: ~,2f~%" (/ (float (soma-medo-recursiva lista)) (length lista)))
  (format t "Ocorrencias criticas:~%")
  (dolist (nome (analise-final lista)) (format t "~a~%" nome)))
