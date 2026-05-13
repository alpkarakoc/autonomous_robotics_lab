# Docker ROS 2 Build Verification

## Purpose

This document records the minimal Docker-based ROS 2 build and run verification path.

The goal is to verify that the current autonomous_robotics_lab ROS 2 package can be built and executed in a controlled Linux ROS 2 environment.

## Docker Image

The project uses a minimal ROS 2 Jazzy base image for the current package verification path:

ros:jazzy-ros-base

## Verification Script

The verification script is:

scripts/verify_ros2_docker_build.sh

## What the Script Does

1. Shows the current Git status.
2. Runs the repository baseline verification script.
3. Builds a Docker image using docker/ros2/Dockerfile.
4. Runs the minimal ROS 2 node inside the container.
5. Confirms generated ROS 2 build artifacts are not tracked by Git.
6. Shows the final Git status.

## Expected Runtime Behavior

The container should run:

ros2 run autonomous_robotics_lab maintenance_status_node

The node should log that the autonomous_robotics_lab package is available.

## Acceptance Criteria

This verification is acceptable only if:

1. The Docker image builds successfully.
2. colcon build succeeds inside the Docker image.
3. The maintenance_status_node runs inside the Docker container.
4. The repository baseline verification script passes before the Docker build.
5. build/, install/, and log/ remain untracked by Git.
6. No Autoware runtime behavior is added.
7. No sensor integration is added.
8. No perception, planning, or control module is added.
9. No real vehicle behavior is added.

## Non-Goals

This phase does not approve:

- Autoware runtime execution
- simulator integration
- sensor integration
- perception modules
- planning modules
- control modules
- real vehicle deployment
- safety-certified autonomous driving behavior
