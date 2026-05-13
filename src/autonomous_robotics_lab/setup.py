from setuptools import setup

package_name = "autonomous_robotics_lab"

setup(
    name=package_name,
    version="0.1.0",
    packages=[package_name],
    data_files=[
        ("share/ament_index/resource_index/packages", ["resource/" + package_name]),
        ("share/" + package_name, ["package.xml"]),
    ],
    install_requires=["setuptools"],
    zip_safe=True,
    maintainer="Alp Karakoc",
    maintainer_email="alpkarakoc34@hotmail.com",
    description="ROS 2 package skeleton for an autonomous robotics lab project.",
    license="MIT",
    tests_require=["pytest"],
    entry_points={
        "console_scripts": [
            "maintenance_status_node = autonomous_robotics_lab.maintenance_status_node:main",
        ],
    },
)
