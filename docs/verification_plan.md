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
