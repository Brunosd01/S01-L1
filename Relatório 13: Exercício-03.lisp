(defstruct item nome tipo preco forca-magica)

(defun cria-catalogo ()
  (list
   (make-item :nome "Katana" :tipo "Arma" :preco 150 :forca-magica 90)
   (make-item :nome "Arco Curvo" :tipo "Arma" :preco 120 :forca-magica 70)
   (make-item :nome "Pocao de Cura" :tipo "Pocao" :preco 30 :forca-magica 0)
   (make-item :nome "Amuleto Proibido" :tipo "Artefato" :preco 500 :forca-magica 85)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80) (* forca 1.5) forca))

(defun processa-venda (catalogo)
  (let* ((so-armas (remove-if-not (lambda (i) (string= (item-tipo i) "Arma")) catalogo))
         (armas-com-imposto
          (mapcar (lambda (i)
                    (make-item :nome (item-nome i)
                               :tipo (item-tipo i)
                               :preco (adiciona-imposto (item-preco i))
                               :forca-magica (item-forca-magica i)))
                  so-armas))
         (nomes-e-forca
          (mapcar (lambda (i) (cons (item-nome i) (bonus-maldicao (item-forca-magica i))))
                  armas-com-imposto)))
    nomes-e-forca))

(let ((cat (cria-catalogo)))
  (format t "Catalogo inicial:~%")
  (dolist (it cat)
    (format t "~a - ~a - preco: ~,2f - forca: ~a~%" (item-nome it) (item-tipo it) (item-preco it) (item-forca-magica it)))
  (format t "~%Resultado do processamento (nome . nova-forca):~%")
  (dolist (p (processa-venda cat)) (format t "~a~%" p)))
