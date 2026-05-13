"""Launch file for the maintenance status node."""

from launch import LaunchDescription
from launch_ros.actions import Node


def generate_launch_description():
    """Create the launch description for the maintenance status node."""
    return LaunchDescription(
        [
            Node(
                package="autonomous_robotics_lab",
                executable="maintenance_status_node",
                name="maintenance_status_node",
                output="screen",
            )
        ]
    )
