#!/bin/bash

set -e

if echo "$1" | grep -q "nothing to commit"; then
        exit 0
else
        exit 1
fi
