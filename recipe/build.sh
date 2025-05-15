#!/bin/bash

$PYTHON -m build .
$PYTHON -m pip install dist/wrf*.whl


