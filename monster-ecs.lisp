(in-package :ecs-cl)

(defstruct (component)
  fields)

(defun defcomponent (name fields)
  ;; Define a new component.
  (setf (gethash name (ecs-components *ecs*)) (make-component :fields fields))
  (gethash name (ecs-components *ecs*)))

(defun add-component (entity-name)
  ;; Add a component to an entity.
  )

(defun get-component (name)
  (gethash name (ecs-components *ecs*)))

(defun all-components ()
  ;; Get a list of all defined components.
  (loop for key being the hash-keys of (ecs-components *ecs*)
	collect key))
