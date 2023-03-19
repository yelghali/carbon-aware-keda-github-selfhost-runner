# keda-github-selfhost-runner

## before run

create github personal token, then create kubernete secret as below.

``` bash
cat > k8s/secret.yaml << EOF
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: github-auth
data:
  personalAccessToken: "==REDUCTED==" # this value should be base64 encoded
---
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: github-auth
  namespace: github-runner
data:
  personalAccessToken: "==REDUCTED=="
  ACCESS_TOKEN: "==REDUCTED=="
EOF
```
also make sure that your kedacore helm chart is currently at version 2.10 or above

## install
run install script
``` bash
./install.sh
```