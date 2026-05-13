# ROS 2 Build and Run Verification Plan

## Purpose

This document defines the controlled plan for building and running the minimal ROS 2 package skeleton.

The goal is not to implement complex Autoware behavior yet. The goal is to verify that the repository can be built and executed in a proper ROS 2 environment while preserving software quality, reproducibility, and maintainability.

## Current Package

Package name:

autonomous_robotics_lab

Current executable entry point:

maintenance_status_node

## Required Environment

The ROS 2 build and run verification must be performed in a proper ROS 2 environment.

The macOS host repository is used for source control and documentation. It should not be treated as the final authority for ROS 2 runtime behavior unless ROS 2 tooling is explicitly installed and verified.

A valid build environment should provide:

1. ROS 2 installed and sourced.
2. colcon available.
3. Python 3 available.
4. The repository checked out cleanly.
5. No generated build artifacts tracked by Git.

## Pre-Build Verification

Before running a ROS 2 build, execute:

git status --short

./scripts/verify_repo_baseline.sh

The repository must be clean before build verification begins.

## Build Command

From the repository root:

colcon build --packages-select autonomous_robotics_lab

## Environment Source Command

After a successful build:

source install/setup.bash

## Run Command

After sourcing the workspace:

ros2 run autonomous_robotics_lab maintenance_status_node

## Expected Runtime Behavior

The node should start and log that the autonomous_robotics_lab package is available.

The node is intentionally minimal. It exists only to confirm that the package entry point is installed and runnable.

## Post-Build Verification

After building, generated folders may exist locally:

- build/
- install/
- log/

These folders must remain untracked by Git.

Check with:

git status --short --ignored

git ls-files | grep -E '^(build|install|log)/' || true

## Acceptance Criteria

Phase 3A build/run verification is acceptable only if:

1. The repository is clean before build.
2. The local baseline verification script passes before build.
3. colcon build succeeds for autonomous_robotics_lab.
4. ros2 run autonomous_robotics_lab maintenance_status_node executes successfully.
5. build/, install/, and log/ are not tracked by Git.
6. No Autoware runtime behavior is added in this phase.
7. No real vehicle behavior is added in this phase.

## Non-Goals

This phase does not approve:

- Autoware runtime execution
- Sensor integration
- Perception modules
- Planning modules
- Control modules
- Real vehicle deployment
- Safety-certified autonomous driving behavior
- Committing generated ROS 2 build artifacts
