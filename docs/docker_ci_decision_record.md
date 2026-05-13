# Docker Verification CI Decision Record

## Purpose

This document records the decision about whether the Docker-based ROS 2 build/run verification should be added to GitHub Actions immediately.

## Current State

The repository already has:

- local repository baseline verification
- GitHub Actions baseline verification
- minimal ROS 2 package skeleton
- Docker-based ROS 2 build/run verification script
- successful local Docker build/run evidence

The Docker verification script successfully built the ROS 2 package inside a Docker container and ran:

ros2 run autonomous_robotics_lab maintenance_status_node

## Decision

Do not add Docker ROS 2 build/run verification to GitHub Actions yet.

Keep Docker verification as a local/manual verification step for now.

## Rationale

This is the most realistic decision for the current phase because:

1. The repository already has lightweight GitHub Actions baseline verification.
2. Docker-based ROS 2 verification has been proven locally.
3. Running Docker builds in CI can increase workflow duration and complexity.
4. Pulling ROS Docker images in CI may introduce registry rate-limit or network variability.
5. The project is still at minimal ROS 2 package verification stage, not full Autoware runtime stage.
6. Manual Docker verification is acceptable until the repository contains more substantial ROS 2 behavior.

## When to Reconsider

Docker verification should be reconsidered for CI when one or more of these become true:

1. The ROS 2 package gains multiple nodes.
2. Launch files are added.
3. Parameters or configuration files are added.
4. Integration behavior becomes more complex.
5. Pull request validation requires full ROS 2 build confidence.
6. The project moves closer to simulation runtime verification.

## Current Required Verification

For now, use two layers:

1. GitHub Actions runs the lightweight repository baseline verification.
2. Local Docker verification is run manually before ROS 2 build/run evidence is updated.

## Non-Goals

This decision does not approve:

- Autoware runtime execution
- simulator integration
- sensor integration
- perception modules
- planning modules
- control modules
- real vehicle deployment
- committing generated build/, install/, or log/ folders
