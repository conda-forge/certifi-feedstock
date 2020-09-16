if [[ "$build_platform" != "$target_platform" ]]; then
  export _PYTHON_PROJECT_BASE=$PREFIX/bin
  export PYTHONHOME=$PREFIX
  export PYTHONPATH=$BUILD_PREFIX/lib/python$PY_VER
  if [[ "$target_platform" == "osx-arm64" ]]; then
    export _PYTHON_HOST_PLATFORM="darwin-arm64"
    export _PYTHON_SYSCONFIGDATA_NAME=$PREFIX/lib/python$PY_VER/_sysconfigdata__darwin_darwin.py
  fi
  pushd $PREFIX/bin
    rm python
    echo '#!/usr/bin/env python' > python
    echo 'import os, sys' >> python
    echo "os.execv('$BUILD_PREFIX/bin/python', sys.argv)" >> python
    chmod +x python
  popd
fi

# use bootstrapped pip to install certifi without depending on installed pip
export PYTHONPATH=$PWD/pip_wheel:$PWD/setuptools_wheel
$PYTHON -m pip install ./certifi/ --ignore-installed --no-deps -vv
