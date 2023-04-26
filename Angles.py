#!/usr/bin/env python2

import rospy

from pymycobot.mycobot import MyCobot

mc = None
def callback(data):
    print(data.position)
    data_list = []
    for index, value in enumerate(data.position):
        data_list.append(value)

    mc.send_radians(data_list, 80)

def listener():
    global mc
    rospy.init_node("control_slider", anonymous=True)
    rospy.Subscriber("joint_states", JointState, callback)
    port = rospy.get_param("~port", "/dev/ttyUSB0")
    baud = rospy.get_param("~baud", 115200)
    print(port, baud)
    mc = MyCobot(port, baud)
    print("spin ...")
    rospy.spin()

if __name__ == "__main__":
    listener()
