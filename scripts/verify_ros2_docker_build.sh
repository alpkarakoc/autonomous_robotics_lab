#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="autonomous-robotics-lab:ros2-jazzy"

echo "=== ROS 2 Docker build verification ==="

echo
echo "=== Pre-check: repository status ==="
git status --short

echo
echo "=== Pre-check: baseline verification ==="
./scripts/verify_repo_baseline.sh

echo
echo "=== Docker build ==="
docker build \
  -f docker/ros2/Dockerfile \
  -t "${IMAGE_NAME}" \
  .

echo
echo "=== Docker run ==="
docker run --rm "${IMAGE_NAME}"

echo
echo "=== Generated artifact tracking check ==="
if git ls-files | grep -E '^(build|install|log)/'; then
  echo "ERROR: generated ROS 2 artifacts are tracked by Git."
  exit 1
fi

echo
echo "=== Final repository status ==="
git status --short

echo
echo "ROS 2 Docker build verification completed successfully."
