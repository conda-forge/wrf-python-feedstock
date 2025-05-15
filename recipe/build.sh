#!/bin/bash

$PYTHON -m pip install build
$PYTHON -m build .
$PYTHON -m pip install dist/wrf*.whl


