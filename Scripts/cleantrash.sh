#!/bin/bash
pushd ./trash
    rm -f $(ls | grep -v README.md)
popd
