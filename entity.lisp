(defstruct (entity)
  components
  attributes
  tags)

(defun copy-proto (from to)
  (setf (entity-components to) (copy-seq (entity-components from))
	(entity-attributes to) (copy-seq (entity-attributes from))))

(defun %add-entity (components &optional proto)
  (let ((id (new-id)))
    (setf (gethash id (ecs-entities *ecs*)) (make-entity)) ; Instantiating an entity
    (if (null proto) ; Can copy parameters from a proto to the new entity
	(values id)  ; If no prototype is specified, just return the id of the new entity
	(progn (loop :for (name . attributes) :in components ; Otherwise, copy the components of the prototype
		     :do (add-component)); #TODO: implement adding components to an entity
	       id)))) ; Return the id of newly created entity

(defun get-entity (entity-name)
  (gethash entity-name (ecs-entities *ecs*)))
