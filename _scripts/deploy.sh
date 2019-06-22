#!/bin/bash
echo "Deploying to remote"
cd _site
git fetch deploy master
git fetch deploy staging
git checkout staging
git merge --strategy=ours master # keep staging content, record merge
git checkout master
git merge staging # fast-forward master
git push deploy --delete staging
