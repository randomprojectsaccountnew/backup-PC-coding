(format t "Hello ~%")

(print "What's your name?")

(defvar *name* (read))

(defun hello-you (*name*)
  (format t "Hello ~a! ~%" *name*)
)

(setq *print-case* :downcase)

(hello-you *name*)

