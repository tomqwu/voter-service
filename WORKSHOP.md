# Workshop

## Docker

![Container](docs/container_evolution.svg)

![Docker](docs/architecture.svg)

Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. 

With Docker, you can manage your infrastructure in the same ways you manage your applications.

By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

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

![k8s](docs/components-of-kubernetes.svg)

Kubernetes provides you with:

- Service discovery and load balancing
- Storage orchestration
- Automated rollouts and rollbacks
- Automatic bin packing
- Self-healing
- Secret and configuration management

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

## Getting Started with Voter Service app

Local Build

```bash
docker-compose -f docker-compose-build.yml up
docker-compose -f docker-compose-build.yml rm
```

Local Testing

```bash
docker-compose up --force-recreate --build -d
```

### Deploy to Kubernetes

All in one deployment

```bash
kubectl apply -f k8s/voter-service-api-all-in-one.yaml
```

Check pod status and logs

```bash
kubectl get po deploy/voter-service-api -c voter-service-api
kubectl logs po deploy/voter-service-api -c voter-service-api
```

Seperate Deployment from DB

```bash
kubectl apply -f k8s/mongodb.yaml
kubectl apply -f k8s/voter-service-api-microservice.yaml
```

### Helm Deployment

```bash
helm upgrade -i ./helm-chart/mongodb -f ./helm-value/mongodb-test.yaml
helm upgrade -i ./helm-chart/voter-service -f ./helm-value/voter-service-test.yaml
```
