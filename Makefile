dev:
	k3d cluster create --config k3d/dev-env.yaml \
        --port "8080:30080@loadbalancer"
	mkdir -p ~/.kube
	k3d kubeconfig get Lab > ~/.kube/config
	helm install flux-operator oci://ghcr.io/controlplaneio-fluxcd/charts/flux-operator \
	  --namespace flux-system \
	  --create-namespace
	kubectl apply -f flux-dev.yaml

delete:
	k3d cluster delete Lab

forward:
	kubectl port-forward svc/backstage-postgres-cluster-rw 5432:5432 &

attach:
	mkdir ~/.kube 2> /dev/null || true
	sudo k3d kubeconfig get Lab > ~/.kube/config
