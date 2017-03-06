#!/usr/bin/env python

import struct
import threading
import serial
import rospy
from std_msgs.msg import Int16,Int32,Int64,Float32,Float64,String,UInt64
from slam_tutorials.msg import coor

updateflag=False
coord_x=0
coord_y=0
coord_angle=0

def Reciver():
	#print('rec thread start')
	global updateflag
	global coord_x
	global coord_y
	global coord_angle
	ser=serial.Serial('/dev/serial0',115200,timeout=1)
	
	while not rospy.is_shutdown():

		data=ser.read(14)
		if(len(data)>=14):
			if(data[0]=='A'and data[1]=='C'):
				coord_x,=struct.unpack('f',data[2]+data[3]+data[4]+data[5])
				coord_y,=struct.unpack('f',data[6]+data[7]+data[8]+data[9])
				coord_angle,=struct.unpack('f',data[10]+data[11]+data[12]+data[13])
				#print(coord_angle)
				updateflag=True
		else:
			pass
		

if __name__ =='__main__':
	
	#print("main thread start")
	
	rospy.init_node("test",log_level=rospy.INFO)
	pub=rospy.Publisher('rec_coor',coor,queue_size=1000)
	rec=threading.Thread(target=Reciver)
	rec.setDaemon(True)
	rec.start()
	rate=rospy.Rate(10)
	
	while not rospy.is_shutdown():
		
		if(updateflag):
			
			rec_coor=coor()
			rec_coor.x=coord_x
			rec_coor.y=coord_y
			rec_coor.angle=coord_angle
			rospy.loginfo("x=%f y=%f angle=%f" %(rec_coor.x,rec_coor.y,rec_coor.angle))
			#print(rec_coor.angle)
			#print(coord_angle)
			pub.publish(rec_coor)
			updateflag=False
			
			rate.sleep()
				
