# Amazon EKS
Siga los siguientes pasos para desplegar un clúster de Amazon EKS con Terraform.

## 1. Configuración servidor Bastion.

Para desplegar Amazon EKS se requieren los  siguientes binarios instalados en la maquina que lanzará la ejecución del Clúster:

- [awscli](https://docs.aws.amazon.com/es_es/cli/latest/userguide/install-linux-al2017.html).
- [kubectl](https://kubernetes.io/es/docs/tasks/tools/install-kubectl/).
- [aws-iam-authenticator](https://docs.aws.amazon.com/es_es/eks/latest/userguide/install-aws-iam-authenticator.html).
- [Terraform](https://www.terraform.io/downloads.html).
- [helm](https://helm.sh/docs/using_helm/) (Opcional).
- [Tiller](https://helm.sh/docs/using_helm/) (Opcional).

> **Nota:** Para el aws-aim-authenticator es posible que se requiera un enlace simbólico del binario con el nombre heptio-authenticator-aws.

Si no desea configurar los binarios en una maquina local o virtual se puede usar la imagen de docker [bastioneks](https://hub.docker.com/r/jpatino24/eksbastion) la cual viene configurada con todo lo necesario para correr el clúster de Amazon EKS. dentro de la carpeta Terraform_Amazon_EKS_/eksbastion se encuentra la configuración del Dockerfile. Los siguientes pasos asumen que se escoge la opción de desplegar la imagen de docker para el servidor bastión.

## 2. Agregar las credenciales de conexión a la consola de AWS.

```bash
 [root@c8e01c341dc0 ~]# aws configure
```

Adicional se puede validar los datos de conexión de la cli de aws ejecutando el comando:

```bash
[root@c8e01c341dc0 ~]# aws sts get-caller-identity
```

## 3. Clonar el repositorio de git.

```bash
[root@c8e01c341dc0 terraform]# git clone https://github.com/jpatino24/Terraform_Amazon_EKS_.git
```

## 4. Ejecutar el despliegue con Terraform.

Ingresar a la ruta  Terraform_Amazon_EKS_/eks-getting-started y ejecutar la instalación.

```bash
[root@c8e01c341dc0 eks-getting-started]# terraform init
```

```bash
[root@c8e01c341dc0 eks-getting-started]# terraform apply
```

## 5. Configurar kubectl para acceso al cluster.

Ejecutar el Script de post-instalación que se encuentra en la ruta  Terraform_Amazon_EKS_/Scripts.

```bash
[root@c8e01c341dc0 Terraform_Amazon_EKS_]# sh Scripts/postinstall.sh
```

## 6. Instalar los repositorios de helm para el despliegue de la Imagenes de Kubernetes. (Opcional)

Ejecutar el Script de instalación de helm que se encuentra en la ruta  Terraform_Amazon_EKS_/Scripts.

```bash
[root@c8e01c341dc0 Terraform_Amazon_EKS_]# sh Scripts/helminstall.sh
```

## 7. Des-instalar el Clúster de Amazon EKS.

Ingresar a la ruta  Terraform_Amazon_EKS_/eks-getting-started y ejecutar la destrucción del clúster.

```bash
[root@c8e01c341dc0 eks-getting-started]# terraform destroy
```