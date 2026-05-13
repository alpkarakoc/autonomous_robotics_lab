# ROS 2 Package Plan

## Purpose

This document defines the first controlled ROS 2 package skeleton for the project.

## Package Name

autonomous_robotics_lab

## Phase 2A Scope

This phase adds only a minimal source-controlled ROS 2 Python package skeleton.

## Included Files

- package.xml
- setup.py
- setup.cfg
- Python package directory
- Minimal maintenance status node

## Non-Goals

This phase does not approve:

- Autoware runtime execution
- Vehicle control logic
- Sensor integration
- Perception, planning, or control modules
- Real vehicle deployment
- Generated ROS 2 build artifacts

## Verification

Before committing, verify:

1. The repository status is reviewed.
2. Python files compile successfully.
3. build/, install/, and log/ are not tracked.
4. The commit only contains source and documentation files.

## Phase 4A Launch File Hardening

This phase adds a minimal ROS 2 launch file for the existing maintenance_status_node.

The goal is to verify a slightly more realistic ROS 2 package structure while avoiding Autoware runtime behavior, sensors, perception, planning, control, or real vehicle behavior.
