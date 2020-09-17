# use bootstrapped pip to install certifi without depending on installed pip
export PYTHONPATH=$PWD/pip_wheel:$PWD/setuptools_wheel:$PYTHONPATH
$PYTHON -m pip install ./certifi/ --ignore-installed --no-deps -vv
