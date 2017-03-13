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
	
	ser=serial.Serial()
	ser.port='/dev/serial0'
        ser.baudrate='115200'
        ser.timeout=1
        ser.open()
	dx = data.linear.x;
	dy = data.linear.y;
	dr = data.angular.z;
	print("%f,%f" %(dx,dr))
	try:		
		trans_str= struct.pack('ff',data.linear.x,data.linear.z)
		ser.write('O')
		ser.write('L')
		for i in range(len(trans_str)):
			ser.write(trans_str[i])
		#rospy.loginfo("dx=%f,dy=%f,dr=%f" %(dx,dy,dr))
	except BaseException as e:
		print(e)




if __name__=="__main__":
    global ser
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

    except BaseException as e:
        print (e)
		

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

