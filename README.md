<img width="50%" src="https://raw.githubusercontent.com/kubero-dev/kubero/main/docs/logo/kubero-logo-horizontal.png">

<br>
<br>
Kubero brings the convinience of Heroku/platform.sh to your kubernetes cluster. Your developers should not need to worry about the underlying infrastructure and deployment.
<br>
Pleas visit the main repository for docs and more information 
https://github.com/kubero-dev 
<br>


## Installation without operator hub via helm (not published yet)
Note: Add any extra configuration variables to the kubero-secrets secret.
```bash
git clone https://github.com/kubero-dev/kubero-operator.git
cd kubero-operator
helm install kubero ./helm-charts/kubero -n kubero --create-namespace
kubectl create secret generic kubero-secrets -n kubero --from-literal=KUBERO_WEBHOOK_SECRET=supersecret --from-literal=KUBERO_USERS=topsecret
```
