pip3 install certifi
CERT_PATH=$(python3 -m certifi)
export SSL_CERT_FILE=${CERT_PATH}
export REQUESTS_CA_BUNDLE=${CERT_PATH}
rm -rf emsdk
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest-upstream
./emsdk activate latest-upstream
source ./emsdk_env.sh
cd ..
rm -rf opencv
git clone https://github.com/opencv/opencv.git
export EMSCRIPTEN="${PWD}"emsdk/upstream/emscripten
cd opencv
python3 ./platforms/js/build_js.py ../build_js --emscripten_dir=../emsdk/upstream/emscripten --simd --build_wasm
cd ..
rm index.js
cp build_js/bin/opencv.js index.js
rm -rf build_js
