(asdf:defsystem #:ecs-cl
  :author "Dariusz Królicki <krolickidariusz7@gmail.com>"
  :description "A very simple Entity Component System written in Common Lisp."
  :license "MIT"
  :version "0.0.1"
  :serial t
  :pathname "/home/dkr/dev/ecs-cl/src"
  :components ((:file "package")
	       (:file "ecs")
	       (:file "component")
	       (:file "entity")))
