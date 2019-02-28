#!/bin/bash

unset LDFLAGS

cd fortran/build_help
if [ `uname` == Darwin ]; then
    $FC -o sizes -fopenmp omp_sizes.f90 -Wl,-rpath,${CONDA_PREFIX}/lib
else
    $FC -o sizes -fopenmp omp_sizes.f90
fi
python sub_sizes.py

cd ..
$FC -E ompgen.F90 -fopenmp -cpp -o omp.f90
cd ..

$PYTHON setup.py config_fc --f90flags="-mtune=generic -fopenmp" build_ext --libraries="gomp" build

$PYTHON setup.py install --single-version-externally-managed --record=record.txt


