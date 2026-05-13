"""Launch file for the maintenance status node."""

from launch import LaunchDescription
from launch.substitutions import PathJoinSubstitution
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare


def generate_launch_description():
    """Create the launch description for the maintenance status node."""
    config_file = PathJoinSubstitution(
        [
            FindPackageShare("autonomous_robotics_lab"),
            "config",
            "maintenance_status.yaml",
        ]
    )

    return LaunchDescription(
        [
            Node(
                package="autonomous_robotics_lab",
                executable="maintenance_status_node",
                name="maintenance_status_node",
                output="screen",
                parameters=[config_file],
            )
        ]
    )
