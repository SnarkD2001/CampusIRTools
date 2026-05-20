from setuptools import setup, find_packages

setup(
    name="campusirtools",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "click==8.1.7",
        "PyYAML==6.0.1",
    ],
    entry_points={
        "console_scripts": [
            "campusir=campusir.cli:main",
        ],
    },
)
