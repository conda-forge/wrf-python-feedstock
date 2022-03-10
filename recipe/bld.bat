cd fortran\build_help
CALL gfortran -o sizes -fopenmp omp_sizes.f90
CALL python sub_sizes.py

cd ..
CALL gfortran -E ompgen.F90 -cpp -fopenmp -o omp.f90
cd ..

CALL %PYTHON% setup.py config_fc --f90flags="-O2 -mtune=generic -fopenmp" build_ext --libraries="gomp" build --compiler=mingw32 --fcompiler=gnu95 install

