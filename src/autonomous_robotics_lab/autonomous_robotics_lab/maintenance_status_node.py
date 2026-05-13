"""Minimal ROS 2 node for reporting project maintenance status.

This node is intentionally simple. Its purpose is to provide a minimal
source-controlled ROS 2 package entry point for the lab repository.
"""

import rclpy
from rclpy.node import Node


class MaintenanceStatusNode(Node):
    """Reports that the lab package is available."""

    def __init__(self) -> None:
        super().__init__("maintenance_status_node")
        self.get_logger().info("autonomous_robotics_lab package is available.")


def main(args=None) -> None:
    rclpy.init(args=args)
    node = MaintenanceStatusNode()

    try:
        rclpy.spin_once(node, timeout_sec=1.0)
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == "__main__":
    main()
