# install HELM chart
# helm repo add kedacore https://kedacore.github.io/charts
# helm repo update

## IMPORTANT, make sure that kedacore is at version 2.10, as github runner scaler is avaliable from that version onward

# SHOW CURRENT K8S CLUSTER
kubectl cluster-info
# PROMPT FOR CONFIRMATION
read -p "Is cluster correct? Y to continue " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Operation cancel"
    exit 1
fi 

# assume that we are already install helm chart
kubectl create namespace keda
helm install keda kedacore/keda --namespace keda

kubectl apply -f k8s/namespace.yaml 
kubectl apply -f k8s/secret.yaml
kubectl apply -f k8s/github-runner-trigger-auth.yaml
kubectl apply -f k8s/github-runner-scale-job.yaml
