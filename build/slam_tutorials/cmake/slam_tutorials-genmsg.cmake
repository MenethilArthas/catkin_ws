# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "slam_tutorials: 1 messages, 0 services")

set(MSG_I_FLAGS "-Islam_tutorials:/home/action/catkin_ws/src/slam_tutorials/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(slam_tutorials_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg" NAME_WE)
add_custom_target(_slam_tutorials_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slam_tutorials" "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(slam_tutorials
  "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_tutorials
)

### Generating Services

### Generating Module File
_generate_module_cpp(slam_tutorials
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_tutorials
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(slam_tutorials_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(slam_tutorials_generate_messages slam_tutorials_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg" NAME_WE)
add_dependencies(slam_tutorials_generate_messages_cpp _slam_tutorials_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_tutorials_gencpp)
add_dependencies(slam_tutorials_gencpp slam_tutorials_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_tutorials_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(slam_tutorials
  "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_tutorials
)

### Generating Services

### Generating Module File
_generate_module_lisp(slam_tutorials
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_tutorials
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(slam_tutorials_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(slam_tutorials_generate_messages slam_tutorials_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg" NAME_WE)
add_dependencies(slam_tutorials_generate_messages_lisp _slam_tutorials_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_tutorials_genlisp)
add_dependencies(slam_tutorials_genlisp slam_tutorials_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_tutorials_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(slam_tutorials
  "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_tutorials
)

### Generating Services

### Generating Module File
_generate_module_py(slam_tutorials
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_tutorials
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(slam_tutorials_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(slam_tutorials_generate_messages slam_tutorials_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/action/catkin_ws/src/slam_tutorials/msg/recdata.msg" NAME_WE)
add_dependencies(slam_tutorials_generate_messages_py _slam_tutorials_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_tutorials_genpy)
add_dependencies(slam_tutorials_genpy slam_tutorials_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_tutorials_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_tutorials)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_tutorials
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(slam_tutorials_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_tutorials)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_tutorials
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(slam_tutorials_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_tutorials)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_tutorials\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_tutorials
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(slam_tutorials_generate_messages_py std_msgs_generate_messages_py)
