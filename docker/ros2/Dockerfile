FROM ros:jazzy-ros-base

SHELL ["/bin/bash", "-c"]

WORKDIR /workspace

COPY src ./src

RUN source /opt/ros/jazzy/setup.bash && \
    colcon build --packages-select autonomous_robotics_lab

CMD source /opt/ros/jazzy/setup.bash && \
    source /workspace/install/setup.bash && \
    ros2 run autonomous_robotics_lab maintenance_status_node
