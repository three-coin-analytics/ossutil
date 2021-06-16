#!/bin/bash

set -e

PROJECT_DIR=$(cd "$(dirname $0)";pwd)
cd ${PROJECT_DIR}


function build_executable() {
    local _os=$1
    local _suffix=$2

    local _os_target_d=${PROJECT_DIR}/target/${_os}
    mkdir -p ${_os_target_d}

    local _project_name=$(basename "${PROJECT_DIR}")

    local _output=${_os_target_d}/ossutil${_suffix}
    echo "building for ${_os} -> ${_output}"
    GOOS=${_os} GOARCH=amd64 go build -trimpath -o ${_output}
}

build_executable linux ""
build_executable darwin ""
build_executable windows ".exe"
