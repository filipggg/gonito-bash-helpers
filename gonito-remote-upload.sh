#!/bin/bash -e

git annex copy --to gonito
git annex sync -a --no-content
