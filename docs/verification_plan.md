# Verification Plan

This document defines lightweight verification checks for the repository.

## Verification Goals

1. Confirm the repository is clean before and after changes.
2. Confirm generated ROS 2 folders are not committed.
3. Confirm documentation exists for requirements, quality attributes, setup, and maintenance.
4. Confirm commits are meaningful and traceable.

## Manual Verification Commands

Run these commands from the repository root:

git status --short

git log --oneline --decorate -5

find . -maxdepth 3 -type f | sort

git ls-files | grep -E '^(build|install|log)/' || true

## Acceptance Criteria

The repository is acceptable when:

1. git status is clean after commit.
2. build/, install/, and log/ are not tracked by Git.
3. README.md exists.
4. docs/requirements.md exists.
5. docs/quality_attributes.md exists.
6. docs/maintenance_plan.md exists.
7. docs/setup_guide.md exists.
8. docs/traceability_matrix.md exists.

## Automated Repository Baseline Verification

The repository includes a lightweight verification script:

scripts/verify_repo_baseline.sh

This script checks:

1. Required documentation files exist.
2. Required ROS 2 package skeleton files exist.
3. Python source files compile successfully.
4. Generated ROS 2 artifact folders are not tracked by Git.
5. Current Git status is shown for review.

## Continuous Integration Verification

The repository includes a GitHub Actions workflow:

.github/workflows/verify-baseline.yml

The workflow runs on push to main and on pull requests. It executes the repository baseline verification script to confirm that the documented project structure, ROS 2 package skeleton, Python syntax, and generated artifact rules remain valid.

