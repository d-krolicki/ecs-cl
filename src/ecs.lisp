(in-package :ecs-cl)

(defvar *ecs* nil)

(defstruct ecs
  (entities (make-hash-table))
  (components (make-hash-table))
  (systems (make-hash-table)))

(defun init-ecs ()
  (let ((id 0))
    (setf *ecs* (make-ecs))
    (defun new-id ()
      (incf id))
    (values)))
