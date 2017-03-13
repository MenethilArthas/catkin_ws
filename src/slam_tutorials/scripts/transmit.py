#!/usr/bin/env python
#moniter keyboard input and transmit it to PC
import rospy
import struct
import serial
from geometry_msgs.msg import Twist

from std_msgs.msg import String

import sys, select, termios, tty

def getKey():
    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = 'c'

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

def twistCallback(data):
	
	dx = data.linear.x;
	dy = data.linear.y;
	dr = data.angular.z;
	rospy.loginfo("dx=%f,dy=%f,dr=%f" %(dx,dy,dr))


if __name__=="__main__":

    settings = termios.tcgetattr(sys.stdin)
    ser = serial.Serial('/dev/serial0',115200,timeout=1)
    rospy.init_node('transmit')
    rate=rospy.Rate(10)
    rospy.Subscriber("cmd_vel",Twist, twistCallback)
    # twist = Twist()

    try:
	while not rospy.is_shutdown():
		key = getKey()
		if(key=='\x03'):
			break
		ser.write('A')
		ser.write('C')
		ser.write(struct.pack('c',key))
		rate.sleep()

    except:
        print (e)
		

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

