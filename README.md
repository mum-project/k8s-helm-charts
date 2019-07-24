# MUM Kubernetes Helm Chart

This chart will deploy a complete email server setup consisting of these
components:

- Postfix
- Dovecot
- MariaDB
- MUM

## ️️⚠️ ATTENTION 🧨

This Helm chart is **not production-ready** and still under development.
Please be aware that you may loose data if you use it productively.

## Installation

You can install this chart with minimal configuration effort.
Just follow these easy steps:

#### 1. Download Dependencies

MariaDB is pulled in as a chart dependency. We need to install it with:

```bash
helm dep build .
```

#### 2. Adjust Secrets

Copy the file [config/secrets.yaml.example](config/secrets.yaml.example) and 
name it `secrets.yaml`. 

```bash
cp config/secrets.yaml.example config/secrets.yaml
```

Next, fill all neccessary fields with values that make sense
for your environment. Make sure to encode all values in base64 before filling 
them in. This can be done with the following command:

```bash
echo -n "secret value" | base64
```

You'll want to generate the value for `app-key` with [Laravel's artisan]
(https://laravel.com/docs/5.8/artisan) command. Make shure you will do this in 
an Laravel environment. **Attention:** Don't forget to encode the value you get 
in base64, even though part of the result already is a base64-encoded string.

```bash
php artisan key:generate
```

#### 3. Adjust Environment Variables

This one is easy. Just go in [config/mum-config.yaml](config/mum-config.yaml) 
and change any parameters you want to. For all configuration options you can 
take a look at the 
[MUM-Documentation](https://mum-project.github.io/docs/configuration-options/)

#### 4. Change Chart Values

If you want to change any values of the Helm chart, you may do that in the file
[values.yaml](values.yaml).

#### 5. Apply Secrets and ConfigMap

Next, you need to tell your Kubernetes about the secrets and environment 
variables you just configured. To do that, execute:

```bash
kubectl apply -f secrets.yaml
kubectl apply -f mum-config.yaml
```

## Deployment
#### 1. Install the Helm-Charts in your Cluster

In this final step, you will install the actual components of the chart:

```bash
helm install .
```
For more information view [Helm](https://helm.sh/) and 
[Kubernetes](https://kubernetes.io/).

#### 2. Upgrade your Cluster

If you want to upgrade the chart to a newer version and assuming your 
release is named `donating-snail`, execute:

```bash
helm upgrade donating-snail .
```