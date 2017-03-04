#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import serial
import time
from std_msgs.msg import String
import struct

key_input='s'


def Update_Speed(data):
	global key_input 
	key_input=data.data
	
	
	
def listener():
	ser = serial.Serial('/dev/ttyUSB0',115200,timeout=1)
	rospy.init_node('listener',anonymous=True)	
	motor_speed = rospy.Subscriber('teleop/cmd_vel',String,Update_Speed)
	rate=rospy.Rate(10)

	while not rospy.is_shutdown():
		try:
			ser.write('A')
			ser.write('C')
			ser.write(struct.pack('c',key_input))

		except Exception as e:
			print(e)
		finally:
			rate.sleep()
	
if __name__=='__main__':
	listener()

