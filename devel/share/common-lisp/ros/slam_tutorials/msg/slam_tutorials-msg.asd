
(cl:in-package :asdf)

(defsystem "slam_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "coor" :depends-on ("_package_coor"))
    (:file "_package_coor" :depends-on ("_package"))
  ))