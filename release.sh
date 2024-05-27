#!/bin/bash
export VERSION=$(cat VERSION)
export IMG=ghcr.io/kubero-dev/kubero-operator/kuberoapp:v$VERSION
export BUNDLE_IMG=ghcr.io/kubero-dev/kubero-operator/kuberoapp-bundle:v$VERSION
make bundle
./bin/kustomize build config/default > deploy/operator.yaml
./bin/kustomize build config/default > deploy/operator.$VERSION.yaml


sed -i "" "s/VERSION ?= .*/VERSION ?= ${VERSION}/" Makefile
sed -i "" "s/    containerImage: ghcr.io\/kubero-dev\/kubero-operator\/kuberoapp:v.*/    containerImage: ghcr.io\/kubero-dev\/kubero-operator\/kuberoapp:v${VERSION}/" config/manifests/bases/kubero-operator.clusterserviceversion.yaml
sed -i "" "s/    containerImage: ghcr.io\/kubero-dev\/kubero-operator\/kuberoapp:v.*/    containerImage: ghcr.io\/kubero-dev\/kubero-operator\/kuberoapp:v${VERSION}/" bundle/manifests/kubero-operator.clusterserviceversion.yaml

#git tag v$(cat VERSION) --force && git push --tags --force