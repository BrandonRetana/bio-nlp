#!/bin/bash

# Actualizar la lista de paquetes
echo "Actualizando lista de paquetes..."
sudo apt update

# Actualizar los paquetes instalados
echo "Actualizando paquetes instalados..."
sudo apt upgrade -y

echo "¡Actualización completa!"

# Instalar neofetch si no está instalado
if ! command -v neofetch &> /dev/null
then
    echo "Instalando neofetch..."
    sudo apt install -y neofetch
fi

# Mostrar información del sistema usando neofetch
echo "Información del sistema:"
neofetch

# Crear las carpetas Test y Downloads si no existen
echo "Creando carpetas Test y Downloads..."
mkdir -p Test Downloads

# Instalar el gcc
echo "Instalando gcc:"
sudo apt install gcc


# Instalar make
echo "Instalando make:"
sudo apt install make

# Moverse a la carpeta Downloads
cd Downloads

# Descargar e instalar CUDA si el archivo no existe
if [ ! -f "cuda_12.4.0_550.54.14_linux.run" ]
then
    echo "Descargando CUDA..."
    wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda_12.4.0_550.54.14_linux.run
fi

# Ejecutar el instalador de CUDA
echo "Instalando CUDA..."
sudo sh cuda_12.4.0_550.54.14_linux.run

# Instalar pip
echo "Instalando pip"
sudo apt install python3-pip

# Instalar virtualvenv
echo "Descargando virtualvenv"
sudo pip3 install virtualenv

echo "Moviendo a la carpeta test"
cd .. && cd Test/

# Crear entorno virtual  
echo "Crear un entorno virtual"
virtualenv cloud-llama && source cloud-llama/bin/activate

# Instalar bibliotecas para correr los modelos
echo "Instalando bibliotecas necesarias"
pip install -q accelerate==0.21.0 peft==0.4.0 bitsandbytes==0.40.2 transformers==4.31.0 trl==0.4.7

echo "Instalando pytorch"
pip install torch==2.1.0+cu121 -f https://download.pytorch.org/whl/torch_stable.html

# Instalar bibliotecas para correr los modelos
echo "Instalando bibliotecas necesarias parte 2"
pip install datasets==2.17.1 transformers==4.31.0 pandas==1.5.3

echo "Instalando bibliotecas necesarias parte 3"
pip install scipy tensorboardX scikit-learn 

echo "Instalando GIT..."
sudo apt install git