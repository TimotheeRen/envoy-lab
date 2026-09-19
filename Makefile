dev:
	k3d cluster create --config k3d/dev-env.yaml \
        --port "8080:30080@loadbalancer"
	helm install flux-operator oci://ghcr.io/controlplaneio-fluxcd/charts/flux-operator \
	  --namespace flux-system \
	  --create-namespace
	kubectl apply -f flux-dev.yaml

delete:
	k3d cluster delete Lab

attach:
	mkdir ~/.kube 2> /dev/null || true
	sudo k3d kubeconfig get Lab > ~/.kube/config
