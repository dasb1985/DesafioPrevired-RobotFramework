
# Desafio Previred

Este desafio fue realizado con RobotFramework + Selenium + RPA  como librerias

El objetivo fue cumplir el desafio con un lenguaje conocido ademas de seguir practicando 


## Installation

I - Descargar Python 3.X.X desde el repositorio oficial
    (Se aconseja esta version 3.21.4 https://www.python.org/ftp/python/3.12.4/python-3.12.4-amd64.exe)

II - Una vez instalado Python descargar ChromeDriver acorde a la version del Chrome que tenga instalado y copiar en 

III - Una vez instalado python Clonar el repositorio

IV - En una consola CMD parado en la raiz del repositorio ejecutar el siguiente comando que instalara las librerias y dependencias
```bash
  pip install -r ./Resources/requirements.txt 
```
    
## Run Locally

Ir al directorio del proyecto

```bash
  cd my-project
```

Ejecutar el siguiente comando el cual ejecutara el test dejando los resultados en la carpeta Results

```bash
   robot.exe -d Results .\Test\shoppingCreatingNewAccount.robot
```

EL siguiente comando ejecutara el script con los requerimientos para los puntos extras

```bash
   robot.exe -d Results .\Test\puntosExtrasTest.robot
```

Si se desea ejecutar todos los scripts basta con ejecutar
```bash
   robot.exe -d Results .\Test\
``


## Documentation

Dentro de la carpeta 'Data' existe un archivo excel el cual contiene informacion de usuarios para la ejecucion, se pueden agregar mas usuarios y los test lo buscaran o se pueden modificar los ya existentes

Debido al flujo de la pagina, al realizar una compra y crear una cuenta nueva, el correo no se puede volver a usar, por ende el test deja de ser reutilizable.

Para evitar esto dentro de los test existe la variable ${idVarPrincipal} la cual al poner un valor entero buscara ese valor dentro del campo "id" del excel y extraera desde ahi los valors para crear una nueva cuenta.

Dicho lo anterior, el excel se puede modificar los datos o agregar.

