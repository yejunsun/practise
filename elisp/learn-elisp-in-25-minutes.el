(+ 1 2)
(+ 1 (+ 2 3))
(setq my-name "yejun")
(insert "Hello!")
(insert "hello " "World")
(insert "Hello I am " my-name)
(defun hello() (insert "Hello I am " my-name))
(hello)
(defun hello(name) (insert "Hello " name))
(hello "sun")
(switch-to-buffer-other-window "*test*")
(progn
  (switch-to-buffer-other-window "test")
  (hello "sun"))
(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "there"))
(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "you")
  (other-window 1))
(let ((local-name) "you")
  (switch-to-buffer-other-window "test")
  (erase-buffer)
  (hello local-name)
  (other-window 1))
(format "Hello %s!\n" "visitor")
(hello "sun")
(defun greeting (name)
  (let((your-name "Bastien"))
    (insert (format "Hello %s!\n\n I am %s."
                    name
                    your-name))))
(greeting "sun")
(read-from-minibuffer "Enter your name: ")
(defun greeting (name)
  (let((your-name (read-from-minibuffer "Enter your name: ")))
    (insert (format "Hello %s!\n\n I am %s."
                    name
                    your-name))))
(greeting "Bastien")

(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (insert (format "I am %s/n. %s!" your-name from-name))
    (other-window 1)))

(greeting "Bastien")

(setq list-of-names '("Sarah", "Chloe", "Mathilde"))

(car list-of-names)
(cdr list-of-names)
(push "Stephanie" list-of-names)
(mapcar 'hello list-of-names)
(defun greeting ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (mapcar 'hello list-of-names)
  (other-window 1))

(greeting)

(defun replace-hello-by-bonjour ()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (search-forward "Hello")
    (replace-match "Bonjour"))
  (other-window 1))

(replace-hello-by-bonjour)

(defun hello-to-bonjour ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  ;; Say hello to names in `list-of-names'
  (mapcar 'hello list-of-names)
  (goto-char (point-min))
  ;; Replace "Hello" by "Bonjour"
  (while (search-forward "Hello" nil 't)
    (replace-match "Bonjour"))
  (other-window 1))

(hello-to-bonjour)

;; Let's colorize the names:

(defun boldify-names ()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (re-search-forward "Bonjour \\(.+\\)!" nil 't)
    (add-text-properties (match-beginning 1)
                         (match-end 1)
                         (list 'face 'bold)))
  (other-window 1))

(boldify-names)


