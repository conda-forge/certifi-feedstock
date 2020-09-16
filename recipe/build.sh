if [[ ${target_platform} == "osx-arm64" ]]; then
   sed -i.bak "s@release =@release = 10.16@g" $BUILD_PREFIX/venv/crossenv.cfg
fi

# use bootstrapped pip to install certifi without depending on installed pip
export PYTHONPATH=$PWD/pip_wheel:$PWD/setuptools_wheel:$PYTHONPATH
$PYTHON -m pip install ./certifi/ --ignore-installed --no-deps -vv
