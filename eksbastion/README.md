---

Imagen de Docker Bastion AWS

# Construir la imagen de Docker

El siguiente manual asume que se tiene instalado y en correcta ejecución Docker. Si el SO es una distribución basada en RHEL, los comandos
de Docker deben ejejcutarse con usuario root

1. Ejecutar el siguiente comando desde la ruta iaac-test/EKS/Docker_File/

   root  ~  docker build -t bastioneks -f Bastion_EKS .

2. Correr el contenedor con el comando:

   root  ~ docker run --rm --name bastion_eks -ti bastioneks

   ó
 
   root  ~ docker run --name bastion_eks -ti bastioneks

3. Una vez iniciado el contenedor clonar el repositorio

   [root@c8e01c341dc0 terraform]# git clone git@gitlab.summan.com:cloud_solutions/iaac-test.git

# Requisitos para clonar el repositorio

Para clonar el repositorio de git es necesario llevar la llave ssh privada al contenedor, por temas de seguridad recomiendo copiar la llave
manualmente, clonar el repositorio finalmente eleminarla.

Alternativamente se pueden usar varios metodos para copiar la llave automaticamente.

1. agregar al docker file las siguientes instrucciones antes de construir la imagen

   ADD ~/.ssh/mykey /tmp/ ----- Ruta y nombre de la llave privada
   RUN ssh-agent /tmp
   RUN rm /tmp/mykey

2. Usando el comando docker cp que permite que se inyecte archivos mientras se está ejecutando un contenedor.

   docker cp ~/.ssh/id_rsa bastion_eks:/root/.ssh/id_rsa

3. Compartir el volumen de la ruta de llaves ssh

   docker run --name bastion_eks -v ~/.ssh:/root/.ssh -ti bastioneks

---
