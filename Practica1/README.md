# Practica 1

## Limpiando los datos

Estando en la carpeta Raiz de el proyecto, y asegurandonos de que tengamos el comando Rscript en el path del proyecto. Ejecutamos el sigueinte comando.

```bash
# Windows
> Rscript.exe ScriptR.R
# Linux
$ Rscript ScriptR.R 
```

Esto generara la siguiente estructura de directorios:

```
*RaizProyecto
|- img  
|- textFiles
|- data  <- Esta carpeta ya existe, los dataset estan ahi
```

En la carpeta de img se guardaran los Boxplot generados con la nomenclatura bp[Propiedad].png y los ScatterPlot con la sintaxis sp[Properties].png

En la carpeta de textFiles estan los resumenes, siendo los resumen[Archivo].txt las salidas originales y los resumen[Archivo]Limpio.txt tienen los resumenes tras la limpieza

## Corriendo el Sript de Python

Debemos asegurarnos de tener disponible el comando de python en el path.
Antes de ejecutar el archivo main.py necesitamos instalar las dependencias necesarias.

```bash
# pip
pip install -r requirements.txt

#conda
conda create -n yourenv pip  #creamos un entorno con el comando pip disponible
pip install -r requirements.txt

#venv
python -m pip install --user virtualenv  #instalamos venv
python -m venv yourenv  # Creamos el entorno
pip install -r requirements.txt
```

Para ejecutar el comando

```bash
python main.py
```
