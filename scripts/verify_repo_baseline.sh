#!/usr/bin/env bash
set -euo pipefail

echo "=== Repository verification baseline ==="

echo
echo "=== Required documentation files ==="
test -f README.md
test -f docs/requirements.md
test -f docs/quality_attributes.md
test -f docs/maintenance_plan.md
test -f docs/setup_guide.md
test -f docs/traceability_matrix.md
test -f docs/verification_plan.md
test -f docs/ros2_package_plan.md
test -f docs/project_status.md
test -f docs/ros2_build_run_plan.md

echo "Documentation files: OK"

echo
echo "=== Required ROS 2 package files ==="
test -f src/autonomous_robotics_lab/package.xml
test -f src/autonomous_robotics_lab/setup.py
test -f src/autonomous_robotics_lab/setup.cfg
test -f src/autonomous_robotics_lab/resource/autonomous_robotics_lab
test -f src/autonomous_robotics_lab/autonomous_robotics_lab/__init__.py
test -f src/autonomous_robotics_lab/autonomous_robotics_lab/maintenance_status_node.py

echo "ROS 2 package skeleton files: OK"

echo
echo "=== Python syntax check ==="
python3 -m py_compile \
  src/autonomous_robotics_lab/setup.py \
  src/autonomous_robotics_lab/autonomous_robotics_lab/__init__.py \
  src/autonomous_robotics_lab/autonomous_robotics_lab/maintenance_status_node.py

echo "Python syntax: OK"

echo
echo "=== Generated ROS 2 artifact tracking check ==="
if git ls-files | grep -E '^(build|install|log)/'; then
  echo "ERROR: generated ROS 2 artifacts are tracked by Git."
  exit 1
fi

echo "Generated artifact tracking: OK"

echo
echo "=== Git status snapshot ==="
git status --short

echo
echo "Verification completed successfully."
