<img src="https://raw.githubusercontent.com/kubero-dev/kubero/main/docs/logo/kubero-logo-horizontal.png">

<br>
<br>
Kubero brings the convinience of Heroku/platform.sh to your kubernetes cluster. Your developers should not need to worry about the underlying infrastructure and deployment.
<br>
Pleas visit the main repository for docs and more information 
https://github.com/kubero-dev 
<br>


## Installation without operator hub (not published yet)

```bash
git clone git@github.com:kubero-dev/kubero-operator.git 
cd kubero-operator

export VERSION=0.0.31
export BUNDLE_IMG=ghcr.io/kubero-dev/kubero-operator/kuberoapp-bundle:v$VERSION
kubectl ns operator
operator-sdk run bundle $BUNDLE_IMG
kubectl get csv

# if Operator is insalled allready 
# operator-sdk run bundle-upgrade $BUNDLE_IMG

# to remove the operator
# operator-sdk cleanup kubero-operator
```

