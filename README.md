# autonomous_robotics_lab

This repository contains a ROS 2 and Autoware-based autonomous robotics lab project.

The purpose of this project is to demonstrate software product maintenance, version control, documentation, reproducibility, and quality-focused development for an autonomous vehicle simulation lab.

## Project Scope

- ROS 2 workspace maintenance
- Git and GitHub version control
- Autoware simulation setup documentation
- Software quality attribute documentation
- Reproducible lab workflow

## Non-Goals

- Real vehicle deployment
- Safety-certified autonomous driving
- Production-grade autonomous driving stack

## Project Documentation

- docs/requirements.md
- docs/quality_attributes.md
- docs/traceability_matrix.md
- docs/verification_plan.md
- docs/maintenance_plan.md
- docs/setup_guide.md
- docs/ros2_package_plan.md
- docs/project_status.md

## Verification

Run the repository baseline verification script from the repository root:

./scripts/verify_repo_baseline.sh

## Current ROS 2 Package

The current ROS 2 package is:

autonomous_robotics_lab

It contains a minimal maintenance status node:

maintenance_status_node

The node reads a status_message parameter and logs the configured maintenance status message.

## Configuration

The package includes a minimal ROS 2 parameter configuration file:

src/autonomous_robotics_lab/config/maintenance_status.yaml

The launch file loads this config file through the installed package share path.

## Launch File

The package includes a minimal launch file:

src/autonomous_robotics_lab/launch/maintenance_status.launch.py

The launch file starts maintenance_status_node and loads the parameter config file.

## Local Repository Verification

Run the lightweight repository baseline verification from the repository root:

./scripts/verify_repo_baseline.sh

This verifies required documentation files, ROS 2 package files, Python syntax, and generated artifact tracking rules.

## Docker ROS 2 Verification

The macOS host is used for source control and documentation. ROS 2 build/run verification is performed through Docker.

Run:

./scripts/verify_ros2_docker_build.sh

This script verifies:

1. repository baseline checks
2. Docker image build
3. colcon build inside the ROS 2 Jazzy container
4. ros2 run autonomous_robotics_lab maintenance_status_node
5. ros2 launch autonomous_robotics_lab maintenance_status.launch.py
6. generated build artifact tracking

## Generated Artifacts

The following ROS 2 generated folders must not be committed:

- build/
- install/
- log/

## Current Non-Goals

This repository does not currently approve:

- Autoware runtime execution
- simulator integration
- sensor integration
- perception modules
- planning modules
- control modules
- real vehicle deployment
- safety-certified autonomous driving behavior

