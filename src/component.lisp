(in-package :ecs-cl)

(defstruct (component)
  (fields '()))

(defun defcomponent (name fields)
  ;; Define a new component.
  (setf (gethash name (ecs-components *ecs*)) (make-component :fields fields))
  (gethash name (ecs-components *ecs*)))

(defun add-component (component entity)
  ;; Add a component to an entity.
  (if (not (member component (entity-components entity)))
      (pushnew component (entity-components entity))
      (format t "~A already contains a ~A component." entity component)))

(defun get-components (entity)
  (loop for component in (entity-components entity)
	collect component))

(defun get-component (name)
  ;; Get a component with a specific name.
  (gethash name (ecs-components *ecs*)))

(defun all-components ()
  ;; Get a list of all defined components.
  (loop for key being the hash-keys of (ecs-components *ecs*)
	collect key))
