# devsu-infra

Este repositorio es el encargado de crear la infraestructura del proyecto usando terraform

Se crea lo siguiente
- vpc
- subredes públicas y privadas
- internet gateway
- nat gateway para acceso a internet a recursos privados
- tablas de enrutamiento
- grupos de seguridad
- cluster de kubernetes
- addons de kubernetes como kube-proxy, vpc cni, core dns
- nodos ec2 spot

para crear la infra se debe navegar a la ruta `aws/dev` en la carpeta ejecutar `terraform init`para inicializar los módulos y descargar los providers. Ejecutar un `terraform plan` para ver lo que se va a crear. Finalmente un `terraform apply` para crear los recursos


En la carpeta `k8s` encontramos los recursos usados para la configuración del cluster
- `alb-controller` crea los recursos para instalar el plugin del alb ingress controller de amazon. Esto nos permite exponer servicios que están en el cluster de kubernetes
- `argocd` instala los componentes de argocd

# Recomiendaciones

- Tener un cluster por ambiente. En este caso use un solo cluster y usando namespaces separé los ambientes
- Para tener un ambiente independeniente solo bastar con replicar la carpeta `aws/dev` y crear el ambiente que se requiera
