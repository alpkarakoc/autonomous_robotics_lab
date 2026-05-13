# Project Status

## Current Phase

Phase 2D: Project status and CI evidence baseline.

## Repository State

The repository has a clean educational ROS 2 / Autoware lab baseline.

Current completed milestones:

1. Initial GitHub repository was created.
2. Project maintenance baseline was added.
3. SQA traceability baseline was added.
4. Minimal ROS 2 Python package skeleton was added.
5. Local repository verification script was added.
6. GitHub Actions baseline verification workflow was added.
7. CI workflow was updated to use actions/checkout@v5.

## Latest Confirmed Commit Chain

- 39478f6 Update baseline workflow to checkout v5
- 39add36 Add baseline verification workflow
- fe2baaf Add repository verification script
- cf323e3 Add minimal ROS 2 package skeleton
- d5680c1 Add SQA traceability baseline
- 0d01b48 Add project maintenance baseline
- e72f4c3 Initial commit

## Quality Assurance Evidence

The project currently provides the following SQA evidence:

1. Requirements are documented in docs/requirements.md.
2. Quality attributes are documented in docs/quality_attributes.md.
3. Requirement-to-verification traceability is documented in docs/traceability_matrix.md.
4. Verification rules are documented in docs/verification_plan.md.
5. A local verification script exists at scripts/verify_repo_baseline.sh.
6. GitHub Actions runs the verification script on push and pull request events.
7. Generated ROS 2 folders are ignored by Git.

## Latest CI Evidence

The GitHub Actions workflow named Verify Repository Baseline passed successfully for commit 39478f6.

Observed CI result:

- Workflow: Verify Repository Baseline
- Run: Update baseline workflow to checkout v5 #2
- Branch: main
- Commit: 39478f6
- Status: Success
- Duration: 10 seconds

## Current Scope

The repository currently supports:

- Educational software product maintenance
- ROS 2 workspace repository structure
- Minimal ROS 2 Python package skeleton
- Documentation-driven development
- Local verification
- GitHub Actions baseline verification

## Current Non-Goals

The repository does not currently approve:

- Autoware runtime execution
- Real vehicle deployment
- Safety-certified autonomous driving
- Sensor integration
- Perception, planning, or control modules
- Generated ROS 2 build artifact commits
- Production-grade autonomous driving behavior

## Next Rational Step

The next rational step is Phase 3A: define a controlled ROS 2 build and run verification plan.

Phase 3A should not immediately add complex Autoware behavior. It should first define how the minimal ROS 2 package will be built and checked in a proper ROS 2 environment.

## Phase 3A Planning Update

A controlled ROS 2 build and run verification plan is documented in docs/ros2_build_run_plan.md.

This plan defines the expected environment, build command, run command, acceptance criteria, and non-goals before any complex Autoware behavior is introduced.

## Phase 3B Environment Audit Update

The ROS 2 environment audit is documented in docs/ros2_environment_audit.md.

The audit found that ros2 and colcon are not available on the macOS host. Docker is available, so future ROS 2 build/run verification should use a controlled Docker-based Ubuntu/ROS 2 environment.

## Phase 3C Docker ROS 2 Environment Planning Update

The Docker-based ROS 2 environment plan is documented in docs/docker_ros2_environment_plan.md.

The current decision is to treat macOS as the source-control environment and Docker as the ROS 2 build/run verification environment. The planned initial image is ros:jazzy-ros-base for the minimal package verification path.

## Phase 3D Docker ROS 2 Build Verification Update

The minimal Docker-based ROS 2 build/run verification path is documented in docs/docker_ros2_build_verification.md.

The verification script is scripts/verify_ros2_docker_build.sh and the Dockerfile is docker/ros2/Dockerfile. This phase is limited to building and running the minimal autonomous_robotics_lab package inside a ROS 2 Docker container.

## Phase 3D Verification Evidence Update

The minimal Docker-based ROS 2 build/run verification completed successfully.

Confirmed evidence:

- Docker daemon was available.
- Docker image build succeeded.
- colcon build succeeded inside the ROS 2 Jazzy container.
- ros2 run autonomous_robotics_lab maintenance_status_node executed successfully.
- The node logged that the package is available.
- No generated build/, install/, or log/ artifacts were tracked by Git.

Phase 3D is now verified for the minimal ROS 2 package path.

## Phase 3E Docker CI Decision Update

The Docker verification CI decision is documented in docs/docker_ci_decision_record.md.

The current decision is not to add Docker ROS 2 build/run verification to GitHub Actions yet. The lightweight baseline verification remains in CI, while Docker ROS 2 build/run verification remains a manual/local evidence step until the ROS 2 package becomes more complex.

## Phase 4A Launch File Hardening Update

Phase 4A adds a minimal ROS 2 launch file for maintenance_status_node and keeps the package scope limited to ROS 2 package structure hardening.

This phase does not introduce Autoware runtime behavior, sensors, perception, planning, control, or real vehicle behavior.

## Phase 4A Launch Verification Update

Phase 4A extends the Docker verification path to include ros2 launch execution for maintenance_status.launch.py.

This confirms that the minimal package can be executed both through ros2 run and through a ROS 2 launch file.

## Phase 4A Verification Evidence Update

The minimal ROS 2 launch-file hardening path was verified successfully.

Confirmed evidence:

- Docker build succeeded.
- colcon build succeeded inside the ROS 2 Jazzy container.
- ros2 run executed maintenance_status_node successfully.
- ros2 launch executed maintenance_status.launch.py successfully.
- The node logged that the package is available.
- The launch process finished cleanly.
- No generated build/, install/, or log/ artifacts were tracked by Git.

Phase 4A is now verified for the minimal ROS 2 launch-file path.

