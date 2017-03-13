; Auto-generated. Do not edit!


(cl:in-package slam_tutorials-msg)


;//! \htmlinclude recdata.msg.html

(cl:defclass <recdata> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (x_vel
    :reader x_vel
    :initarg :x_vel
    :type cl:float
    :initform 0.0)
   (w_vel
    :reader w_vel
    :initarg :w_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass recdata (<recdata>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recdata>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recdata)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slam_tutorials-msg:<recdata> is deprecated: use slam_tutorials-msg:recdata instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <recdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_tutorials-msg:x-val is deprecated.  Use slam_tutorials-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <recdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_tutorials-msg:y-val is deprecated.  Use slam_tutorials-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <recdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_tutorials-msg:angle-val is deprecated.  Use slam_tutorials-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'x_vel-val :lambda-list '(m))
(cl:defmethod x_vel-val ((m <recdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_tutorials-msg:x_vel-val is deprecated.  Use slam_tutorials-msg:x_vel instead.")
  (x_vel m))

(cl:ensure-generic-function 'w_vel-val :lambda-list '(m))
(cl:defmethod w_vel-val ((m <recdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_tutorials-msg:w_vel-val is deprecated.  Use slam_tutorials-msg:w_vel instead.")
  (w_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recdata>) ostream)
  "Serializes a message object of type '<recdata>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'w_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recdata>) istream)
  "Deserializes a message object of type '<recdata>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'w_vel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recdata>)))
  "Returns string type for a message object of type '<recdata>"
  "slam_tutorials/recdata")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recdata)))
  "Returns string type for a message object of type 'recdata"
  "slam_tutorials/recdata")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recdata>)))
  "Returns md5sum for a message object of type '<recdata>"
  "67656ea677d26337892047bd47110dc6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recdata)))
  "Returns md5sum for a message object of type 'recdata"
  "67656ea677d26337892047bd47110dc6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recdata>)))
  "Returns full string definition for message of type '<recdata>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 angle~%float32 x_vel~%float32 w_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recdata)))
  "Returns full string definition for message of type 'recdata"
  (cl:format cl:nil "float32 x~%float32 y~%float32 angle~%float32 x_vel~%float32 w_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recdata>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recdata>))
  "Converts a ROS message object to a list"
  (cl:list 'recdata
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':x_vel (x_vel msg))
    (cl:cons ':w_vel (w_vel msg))
))
