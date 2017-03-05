#include<ros/ros.h>
#include<tf/transform_broadcaster.h>
#include <slam_tutorials/coor.h>

class Odom_Trans
{
public:
	Odom_Trans();
private:
	ros::NodeHandle n;
	tf::TransformBroadcaster broadcaster;
	ros::Subscriber sub_coor;
	ros::Time current_time;
	float coor_x,coor_y,coor_angle;
	void CallBack(const slam_tutorials::coor::ConstPtr& coorMsg);
};

Odom_Trans::Odom_Trans()
{
	coor_x=0.0;
	coor_y=0.0;
	coor_angle=0.0;
	sub_coor=n.subscribe("rec_coor",50,&Odom_Trans::CallBack,this);
}

void Odom_Trans::CallBack(const slam_tutorials::coor::ConstPtr& coorMsg)
{
	coor_x=coorMsg->x;
	coor_y=coorMsg->y;
	coor_angle=coorMsg->angle;
	geometry_msgs::TransformStamped trans_msg;
	trans_msg.header.frame_id = "odom";
	trans_msg.child_frame_id = "base_link";
	current_time=ros::Time::now();
	trans_msg.header.stamp = current_time;
	trans_msg.transform.translation.x = coor_x;
	trans_msg.transform.translation.y = coor_y;
	trans_msg.transform.translation.z = 0.0;
	trans_msg.transform.rotation = tf::createQuaternionMsgFromYaw(coor_angle);
	broadcaster.sendTransform(trans_msg);
}

int main(int argc,char **argv)
{
    ros::init(argc,argv,"pub_odom");
    Odom_Trans obj;
    ros::spin();
    return 0;
}
