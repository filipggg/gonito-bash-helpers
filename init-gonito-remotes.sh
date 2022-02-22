#!/bin/bash -e

git annex initremote gonito type=rsync rsyncurl=gonito.net:/srv/http/annex encryption=none
git annex initremote --sameas=gonito gonito-https type=httpalso url=https://gonito.net/annex
git annex describe gonito "Gonito Upload"
git annex describe gonito-https "Gonito Download"
