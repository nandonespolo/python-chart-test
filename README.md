# Python Chart Test

## This is a helm chart that builds a simple python app in Kubernetes

### Requirements:
* Add the ecr image on `values.yaml` file:
```
image:
  repository: <YourECRRepositoryImage>
```

* Add a host name for the ingress object:
```
  hosts:
      # check your route53 hosted zone before adding your name below
    - host: <AddHereYourAddress>
```

### Build it:
* helm upgrade -i python-chart . --namespace default

### Delete the chart
* helm delete --purge python-chart

### Versions used:
* helm client version: v2.16.12
* helm server version: v2.16.6
* kubernetes 1.16
