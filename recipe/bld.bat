cd fortran\build_help
CALL gfortran -o sizes -fopenmp omp_sizes.f90
CALL python sub_sizes.py

cd ..
CALL gfortran -E ompgen.F90 -cpp -fopenmp -o omp.f90
cd ..

IF %ARCH% == 64 (
    CALL %PYTHON% setup.py config_fc --f90flags="-O2 -mtune=generic -fopenmp" build_ext --libraries="gomp" build --compiler=msvc --fcompiler=gnu95       
) ELSE (
    CALL %PYTHON% setup.py config_fc --f90flags="-O2 -mtune=generic -fopenmp -mincoming-stack-boundary=2" build_ext --libraries="gomp" build --compiler=msvc --fcompiler=gnu95
)

CALL %PYTHON% -m pip install . -vv


