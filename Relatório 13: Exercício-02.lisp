(defstruct criatura nome ambiente perigo vida-media)

(defun cria-catalogo ()
  (list
    (make-criatura :nome "Safe Shallows" :ambiente "Shallows" :perigo 'baixa :vida-media 5)
    (make-criatura :nome "Reaper Leviathan" :ambiente "Deep" :perigo 'alta :vida-media 100)
    (make-criatura :nome "Abyssal Crawler" :ambiente "Deep" :perigo 'media :vida-media 20)
    (make-criatura :nome "Gloomfish" :ambiente "Caves" :perigo 'baixa :vida-media 3)))

(defun filtra-por-perigo (catalogo)
  (remove-if (lambda (c) (eq (criatura-perigo c) 'baixa)) catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar (lambda (c)
            (format nil "[~a]: Vive em ~a" (criatura-nome c) (criatura-ambiente c)))
          (remove-if-not (lambda (c) (string= (criatura-ambiente c) "Deep")) catalogo)))

(let ((cat (cria-catalogo)))
  (format t "Catalogo inicial:~%")
  (dolist (c cat) (format t "~a (~a) - perigo: ~a, vida: ~a~%" (criatura-nome c) (criatura-ambiente c) (criatura-perigo c) (criatura-vida-media c)))
  (format t "~%Filtradas por perigo (removendo baixa):~%")
  (dolist (c (filtra-por-perigo cat)) (format t "~a - perigo: ~a~%" (criatura-nome c) (criatura-perigo c)))
  (format t "~%Relatorio de profundidade (Deep):~%")
  (dolist (s (relatorio-profundidade cat)) (format t "~a~%" s)))
