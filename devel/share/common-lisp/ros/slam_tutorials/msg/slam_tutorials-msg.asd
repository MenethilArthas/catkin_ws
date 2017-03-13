
(cl:in-package :asdf)

(defsystem "slam_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "recdata" :depends-on ("_package_recdata"))
    (:file "_package_recdata" :depends-on ("_package"))
  ))