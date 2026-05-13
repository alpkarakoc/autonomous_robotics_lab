# Docker ROS 2 Environment Plan

## Purpose

This document defines the planned Docker-based ROS 2 build environment for the autonomous_robotics_lab project.

The host audit showed that the macOS host does not currently provide ros2 or colcon. Therefore, the repository should use Docker for controlled ROS 2 build and run verification.

## Environment Decision

The macOS host is the source-control and documentation environment.

The Docker container is the ROS 2 build and runtime verification environment.

## Planned Base Image

Planned initial ROS 2 image:

ros:jazzy-ros-base

## Rationale

The planned image is suitable for the current minimal ROS 2 Python package because the repository currently requires only a basic ROS 2 environment with rclpy, ament_python, and colcon-based build verification.

The project should not jump directly to full Autoware runtime images. Full Autoware introduces additional complexity, dependencies, GPU/display assumptions, and simulator concerns that are outside the current phase.

## Phase 3C Scope

This phase approves only planning for a Docker-based ROS 2 build environment.

It does not yet approve:

- creating a Dockerfile
- running colcon build
- running ros2 run
- adding Autoware runtime behavior
- adding sensors
- adding perception, planning, or control modules

## Future Phase 3D Candidate

A later Phase 3D may add a minimal Dockerfile or docker compose service that:

1. starts from ros:jazzy-ros-base
2. installs only required build tools
3. copies or mounts the repository
4. runs colcon build --packages-select autonomous_robotics_lab
5. confirms build/, install/, and log/ remain untracked

## Verification Boundaries

Generated folders must remain local artifacts only:

- build/
- install/
- log/

These folders must never be committed.

## Acceptance Criteria for Future Docker Build Phase

A future Docker build phase is acceptable only if:

1. The repository is clean before Docker changes.
2. The Docker configuration is minimal and documented.
3. The baseline verification script passes before the Docker build.
4. colcon build succeeds inside the ROS 2 container.
5. ros2 run autonomous_robotics_lab maintenance_status_node succeeds inside the ROS 2 container.
6. Generated build artifacts remain untracked.
7. No Autoware runtime behavior is added.
8. No real vehicle behavior is added.

## Current Non-Goals

This plan does not approve:

- native macOS ROS 2 installation
- Autoware runtime execution
- simulator integration
- sensor integration
- perception modules
- planning modules
- control modules
- real vehicle deployment
- safety-certified autonomous driving behavior
