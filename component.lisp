(in-package :ecs-cl)

(defstruct (component)
  fields)

(defun defcomponent (name fields)
  ;; Define a new component.
  (setf (gethash name (ecs-components *ecs*)) (make-component :fields fields))
  (gethash name (ecs-components *ecs*)))

(defun add-component (component entity-name)
  ;; Add a component to an entity.
  (if (not (member component (get-entity entity-name))) ;; #TODO: implement get-entity
      (pushnew component (get-entity entity-components))
      (format t "~A already contains a ~A component." (get-entity entity-name) component)))

(defun get-component (name)
  (gethash name (ecs-components *ecs*)))

(defun all-components ()
  ;; Get a list of all defined components.
  (loop for key being the hash-keys of (ecs-components *ecs*)
	collect key))
