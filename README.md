# Python Chart Test

## This is a helm chart that builds a simple python app in Kubernetes

### Requirements:
* Define the following Variables in the file `variables_global`:
  - APP_NAME
  - ACCOUNT_ID
  - AWS_REGION

* Add the ecr image on [values.yaml](https://github.com/nandonespolo/python-chart-test/blob/python-chart/python-chart/values.yaml) file:
```
image:
  repository: <ECRImage>
```

* Add a host name for the ingress object:
```
  hosts:
      # check your route53 hosted zone before adding your name below
    - host: <IngressAddress>
```

### Build it:
* make deploy

### Delete the chart
* helm delete --purge <ChartName>

### Versions used:
* helm client version: v2.16.12
* helm server version: v2.16.6
* kubernetes 1.16
