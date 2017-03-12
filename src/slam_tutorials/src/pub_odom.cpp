#include<ros/ros.h>
#include<tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <slam_tutorials/coor.h>

class Odom_Trans
{
public:
	Odom_Trans();
private:
	ros::NodeHandle n;
	tf::TransformBroadcaster broadcaster;
	ros::Subscriber sub_coor;
	ros::Publisher pub_odom;
	ros::Time current_time;
	float coor_x,coor_y,coor_angle,vel_x,vel_w;
	void CallBack(const slam_tutorials::coor::ConstPtr& recMsg);
};

Odom_Trans::Odom_Trans()
{
	coor_x=0.0;
	coor_y=0.0;
	coor_angle=0.0;
	sub_coor = n.subscribe("rec_data",50,&Odom_Trans::CallBack,this);
	
	pub_odom = n.advertise<nav_msgs::Odometry>("odom",50);
}

void Odom_Trans::CallBack(const slam_tutorials::coor::ConstPtr& recMsg)
{
	coor_x=recMsg->x;
	coor_y=recMsg->y;
	coor_angle=recMsg->angle;
	vel_x=recMsg->x_vel;
	vel_w=recMsg->w_vel;
	
	
	geometry_msgs::TransformStamped trans_msg;
	current_time=ros::Time::now();
	nav_msgs::Odometry odom;
	
	//broadcast transform
	trans_msg.header.frame_id = "odom";
	trans_msg.child_frame_id = "base_link";
	
	trans_msg.header.stamp = current_time;
	trans_msg.transform.translation.x = coor_x;
	trans_msg.transform.translation.y = coor_y;
	trans_msg.transform.translation.z = 0.0;
	trans_msg.transform.rotation = tf::createQuaternionMsgFromYaw(coor_angle);
	broadcaster.sendTransform(trans_msg);
	
	//publish odom message
	odom.header.stamp = current_time;
	odom.header.frame_id = "odom";
	odom.child_frame_id = "base_link";

	odom.pose.pose.position.x = coor_x;
	odom.pose.pose.position.y = coor_y;
	odom.pose.pose.position.z = 0.0;
	odom.pose.pose.orientation = tf::createQuaternionMsgFromYaw(coor_angle);

	odom.twist.twist.linear.x = vel_x;
	odom.twist.twist.linear.y = 0.0;
	odom.twist.twist.linear.z = 0.0;

	odom.twist.twist.angular.x = 0.0;
	odom.twist.twist.angular.y = 0.0;
	odom.twist.twist.angular.z = vel_w;
	pub_odom.publish(odom);
}

int main(int argc,char **argv)
{
    ros::init(argc,argv,"pub_odom");
    Odom_Trans obj;
    ros::spin();
    return 0;
}
