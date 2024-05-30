# Deployment for the IONOS Cloud Cloud Controller Manager

This chart deploys the IONOS Cloud
[Cloud Controller Manager (CCM)](https://kubernetes.io/docs/concepts/architecture/cloud-controller/) to a Kubernetes
cluster.

## Installation

By default, the chart installs Deployment, ServiceAccount, ClusterRole & binding and a Secret containing credentials.
The CCM uses the in-cluster configuration to authenticate with the API server.
The namespace can be chosen, we recommend using `kube-system`.

## Metrics

The Helm chart also supports you with installing a Prometheus PodMonitor for scraping metrics from the CCM.

## Example

Install the IONOS Cloud CCM:
```shell
helm install ionoscloud-cloud-controller-manager oci://ghcr.io/ionos-cloud/helm-charts/ionoscloud-cloud-controller-manager \
    --namespace kube-system \
    --values your_overrides.yml
```

A minimal values file containing only required values could be:

```
image:
  tag: v1.2.3
cloudConfig:
  token: myJWT
  datacenters:
    - 3186f3bd-ef0c-46d2-80d0-98f036a88653
```

Check [values.yaml](values.yaml) for all available configuration options.

For more information, please refer to [helm install](https://helm.sh/docs/helm/helm_install/).
