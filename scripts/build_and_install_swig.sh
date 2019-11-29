#!/usr/bin/env bash

# License Conditions
# Copyright (c) 2015-2018, Fabian Fröhlich, Jan Hasenauer, Daniel Weindl and Paul Stapor All rights reserved.
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#     Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#     Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#     Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Download and build SWIG
set -e

SCRIPT_PATH=$(dirname $BASH_SOURCE)
AMICI_PATH=$(cd $SCRIPT_PATH/.. && pwd)

SWIG_URL='http://prdownloads.sourceforge.net/swig/swig-4.0.1.tar.gz'
SWIG_ARCHIVE='swig-4.0.1.tar.gz'
SWIG_DIR='swig-4.0.1'
PREFIX=${AMICI_PATH}/ThirdParty/${SWIG_DIR}/install
SWIG_BIN_DIR=${PREFIX}/bin

cd ${AMICI_PATH}/ThirdParty/

if [[ ! -d ${SWIG_DIR} ]]; then
    if [[ ! -f ${SWIG_ARCHIVE} ]]
        then wget ${SWIG_URL}
    fi

    tar -xzf ${SWIG_ARCHIVE}
fi

cd ${SWIG_DIR}
./configure --prefix=${PREFIX}
make
make install

echo
echo "================"
echo "SWIG installation successful"
echo
echo "To use this version of SWIG, add directory ${SWIG_BIN_DIR} to your PATH,"
echo "e.g. adding the following line to your .bashrc:"
echo "    export PATH=\$PATH:${SWIG_BIN_DIR}"
echo "================"
