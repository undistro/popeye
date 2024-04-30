#!/bin/sh

cd "$1"

PATCH_GO_VERSION=$(egrep '^go ' go.mod | awk '{print $2}')
PATCH_GO_PATH="$(ls -d ${RUNNER_TOOL_CACHE}/go/${PATCH_GO_VERSION}.*/*/bin)"
export PATH="${PATH}:${PATCH_GO_PATH}"

echo "Patching go dependencies to address vulnerabilities"
go get k8s.io/apimachinery@v0.30.0
