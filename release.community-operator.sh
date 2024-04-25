#!/bin/bash
export VERSION=$(cat VERSION)

echo "Version: $VERSION"

cd ../community-operators

ls -altr ./operators/kubero-operator
echo "Enter the old version of the operator (e.g. 0.0.1):"
read OLD_VERSION
git co main
git pull
git branch add-upgrade-kubero-$VERSION
git co add-upgrade-kubero-$VERSION

cp -r ../kubero-operator/bundle ./operators/kubero-operator/$VERSION
echo "  replaces: kubero-operator.v$OLD_VERSION" >> ./operators/kubero-operator/$VERSION/manifests/kubero-operator.clusterserviceversion.yaml

#git add .
#git commit -s -m "operator kubero-operator ($VERSION)"
#git push --set-upstream origin add-upgrade-kubero-$VERSION