#!/bin/bash

# Script de criação de estrutura de usuários, diretórios e permissões

# Criação dos diretórios
echo "Iniciando a criação de diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

# Criação dos grupos
echo "Iniciando a criação dos grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criação dos usuários  (-m cria usuário com o diretório /home padrão, -s os adiciona ao shell de login padrão /bin/bash, -p  adiciona uma senha criptografada padrão, -G os adiciona aos respectivos grupos)
echo "Iniciando a criação dos usuários e adicionando-os aos grupos..."

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

# Criação de propriedade dos grupos e permissões (chown - especifica dono dos diretórios de arquivos, chmod - altera permissões de um arquivo ou pasta)
echo "Especificando as permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizado!"
