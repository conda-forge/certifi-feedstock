# use bootstrapped pip to install certifi without depending on installed pip
ls -1 "${PREFIX}/lib"
echo ""
ls -1 "${BUILD_PREFIX}/lib"
echo ""
export PYTHONPATH=$PWD/pip_wheel:$PWD/setuptools_wheel
$PYTHON -m pip install ./certifi/ --ignore-installed --no-deps -vv
