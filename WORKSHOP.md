# Workshop

## Docker

[Reference](https://docs.docker.com/get-started/overview/)

### Dockerfile

[Reference](https://docs.docker.com/engine/reference/builder/)

```dockerfile
FROM ubuntu
CMD ["echo","hello world"]
```

### Build Docker

`docker build -t helloworld .`

### Run Docker

`docker run helloworld`

## Kubernetes

### Deployment and Pod

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

[Reference](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

### Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
  Type: NodePort
```

[Reference](https://kubernetes.io/docs/concepts/services-networking/service/)

## Helm

### Create Helm Chart

`helm create helloworld`

### Deloy Helm Chart

`helm install helloworld`

[Reference](https://helm.sh/docs/intro/quickstart/)