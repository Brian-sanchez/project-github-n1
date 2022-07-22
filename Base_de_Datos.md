# Introducción a las Bases de Datos
## Datos y Archivos

El propio nombre **Informática** hace referencia al hecho de ser una ciencia que trabaja con información.En informática se conoce como **dato** a cualquier elemento informativo que tenga relevancia para el
sistema.

El ser humano desde siempre ha necesitado gestionar datos,Como herramienta el ser humano al principio sólo poseía su memoria y cálculo y como mucho la ayuda de sus dedos.
La escritura fue la herramienta que permitió al ser humano poder gestionar bases cada vez más grandes de datos.

La informática adaptó sus herramientas para que los elementos que el usuario maneja en el ordenador se parezcan a los que utilizaba manualmente. Así en informática se sigue hablado de ficheros,
formularios, carpetas, directorios.

##  Sistemas de información
### La empresa como sistema.**

El sistema completo que forma la empresa se suele dividir en los siguientes subsistemas:
- Subsistema productivo. También llamado subsistema real o físico. Representa la parte de la
empresa encargada de gestionar la producción de la misma.
- Subsistema financiero. Encargado de la gestión de los bienes económicos de la empresa
- Subsistema directivo. Encargado de la gestión organizativa de la empresa

### **Sistemas de información.**

Un sistema de información genérico está formado por los siguientes elementos:
- Recursos físicos. Carpetas, documentos, equipamiento, discos.
- Recursos humanos. Personal que maneja la información.
- Protocolo. Normas que debe cumplir la información para que sea manejada (formato de la
información, modelo para los documentos,etc)

### **Componentes de un sistema de información electrónico.**

En el caso de una gestión electrónica de la información , los componentes son:

- Datos. Se trata de la información relevante que almacena y gestiona el sistema de información.
- Hardware. Equipamiento físico que se utiliza para gestionar los datos. cada uno de los
dispositivos electrónicos que permiten el funcionamiento del sistema de información.
- Software. Aplicaciones informáticas que se encargan de la gestión de la base de datos y de las
herramientas que facilitan su uso.
- Recursos humanos. Personal que maneja el sistema de información.

## Archivos

Los ficheros o archivos son la herramienta fundamental de trabajo en una computadora.
Los datos deben de ser almacenados en componentes de almacenamiento permanente, lo que se
conoce como **memoria secundaria**.

En general sobre los archivos se pueden realizar las siguientes operaciones:
- Abrir (***open***). Prepara el fichero para su proceso.
- Cerrar (***close***). Cierra el fichero impidiendo su proceso inmediato.
- Leer (***read***). Obtiene información del fichero.
- Escribir (***write***). Graba información en el fichero.
- Posicionarse (***seek***). Coloca el puntero de lectura en una posición
concreta del mismo (no se puede realizar en todos los tipos de ficheros).

### **ficheros secuenciales.**

En estos ficheros, los datos se organizan secuencialmente en el orden en el que fueron grabados. Para
leer los últimos datos hay que leer los anteriores.

**Ventajas**
- Rápidos para obtener registros contiguos de una base de datos
- No hay huecos en el archivo al grabarse los datos seguidos, datos más compactos.

**Desventajas**
- Consultas muy lentas al tener que leer todos los datos anteriores al dato que queremos leer
- Algoritmos de lectura y escritura más complejos
- No se pueden eliminar registros del fichero (se pueden marcar de manera especial para que no
sean tenidos en cuenta, pero no se pueden borrar)
- El borrado provoca archivos que no son compactos
- La ordenación de los datos requiere volver a crearle de nuevo
- Fin de fichero (***eof***). Indica si hemos llegado al final del fichero.

### **Ficheros de acceso directo o aleatorio.**

Se puede leer una posición concreta del fichero, con saber la posición (normalmente en bytes) del dato a leer, lo quese hace es colocar el llamado puntero de archivo en esa posición y después leer.

**Ventajas**
- Acceso rápido al no tener que leer los datos anteriores
- La modificación de datos es más sencilla
- Permiten acceso secuencial
- Permiten leer y escribir a la vez
- Aptos para organizaciones relativas directas, en las que la clave del registro se relaciona con
su posición en el archivo

**Desventajas**
- Salvo en archivos relativos directos, no es apto por sí mismo para usar en bases de datos, ya que
los datos se organizan en base a una clave
- No se pueden borrar datos (sí marcar para borrado, pero generarán huecos)
- Las consultas sobre multitud de registros son más lentas que en el caso anterior.

### **Ficheros secuenciales encadenados.**

Son ficheros secuenciales gestionados mediante punteros.

**Ventajas**
-El fichero mantiene el orden en el que se añadieron los registros y un segundo orden en base a
una clave
- La ordenación no requiere reorganizar todo el fichero, sino sólo modificar los punteros
- Las mismas ventajas que el acceso secuencial
- En esta caso sí se borran los registros y al reorganizar, se perderán definitivamente

**Desventajas**
- No se borran los registros, sino que se marcan para ser ignorados. Por lo que se malgasta
espacio
- Añadir registros o modificar las claves son operaciones que requieren recalcular los punteros

### **Ficheros secuenciales indexados.**

Se utilizan dos ficheros para los datos, uno posee los registros almacenados de forma secuencial, pero
que permite su acceso aleatorio. El otro posee una tabla con punteros a la posición ordenada de los
registros. Ese segundo fichero es el índice, una tabla con la ordenación deseada para los registros y la
posición que ocupan en el archivo. 

**Ventajas**
- El archivo está siempre ordenado en base a una clave
- La búsqueda de datos es rapidísima
- Permite la lectura secuencial (que además será en el orden de la clave)
- El borrado de registros es posible (aunque más problemático que en el caso anterior)
- 
**Desventajas**
- Para un uso óptimo hay que reorganizar el archivo principal y esta operación es muy costosa ya
que hay que reescribir de nuevo y de forma ordenada todo el archivo.
- La adición de registros requiere más tiempo que en los casos anteriores al tener que reordenar los índices

### **Ficheros indexado – encadenados.**

Utiliza punteros e índices, es una variante encadenada del caso anterior. Hay un fichero de índices y otro fichero de tipo encadenado con punteros a los
siguientes registros. Cuando se añaden registros se añaden en un tercer registro llamado de desbordamiento u overflow.En ese archivo los datos se almacenan secuencialmente.

**Ventajas**
- Posee las mismas ventajas que los archivos secuenciales indexados, además de una mayor
rapidez al reorganizar el fichero (sólo se modifican los punteros)

**Desventajas**
- Requieren compactar los datos a menudo para reorganizar índices y quitar el fichero de
desbordamiento.

## **Operaciones relacionadas con uso de ficheros en bases de datos.**

**Borrado y recuperación de registros**

Algunos de los tipos de ficheros vistos anteriormente no admiten el borrado real de datos, sino que sólo permiten añadir un dato que indica si el registro está borrado o no. Esto es interesante ya que permite
anular una operación de borrado.
En otros casos los datos antes de ser eliminados del todo pasan a un fichero especial en el que se mantienen durante cierto tiempo para su posible recuperación.

**Fragmentación y compactación de datos**

La fragmentación en un archivo hace referencia a la posibilidad de que éste tenga huecos interiores
debido a borrado de datos u a otras causas. Causa los siguientes problemas:

- Mayor espacio de almacenamiento
- Lentitud en las operaciones de lectura y escritura del fichero

Por ello se requiere compactar los datos. Esta técnica permite eliminar los huecos interiores a un
archivo. Las formas de realizarla son:

- Reescribir el archivo para eliminar los huecos. Es la mejor, pero lógicamente es la más
lenta al requerir releer y reorganizar todo el contenido del fichero.

- Aprovechar huecos. De forma que los nuevos registros se inserten en esos huecos. Esta
técnica suele requerir un paso previo para reorganizar esos huecos.

**Compresión de datos**

Para ahorrar espacio de almacenamiento, se utilizan técnicas de compresión de datos.
La ventaja es que los datos ocupan menos espacio y la desventaja es que al manipular los datos hay
que descomprimirlos lo que hace que la manipulación de los datos sea lenta.

**Cifrado de datos**

Utilizar técnicas de cifrado para proteger los ficheros en caso de que alguien no autorizado se haga con el fichero. Para descifrar necesitamos una clave o bien aplicar métodos de descifrado.



# Historia y evolución de las bases de datos

**- Primer prototipo de una BD (1884):**

En 1884 Herman Hollerith creó la máquina automática de tarjetas perforadas, siendo nombrado así el primer ingeniero estadístico de la historia.
Esta tecnologia fue utilizada para el censo que se estaba llevando a cabo en Estados Unidos en ese momento, lo cual permitio que esta tarea se realizara de una manera mucho mas efectiva.

**- Cintas magneticas (1950):**

En la década de los cincuenta (1950s) se desarrollan las cintas magnéticas, para automatizar la información y hacer respaldos. Esto sirvió para suplir las necesidades de información de las nuevas industrias. Y a través de este mecanismo se empezó a automatizar la información, con la desventaja de que solo se podía hacer de forma secuencial.

**- Discos Duros (1960):**

Posteriormente en la decada de 1960, las computadoras bajaron los precios para que las compañías privadas las pudiesen adquirir, dando paso a que se popularizara el uso de los discos, cosa que fue un adelanto muy efectivo en la época, debido a que a partir de este soporte se podía consultar la información directamente, sin tener que saber la ubicación exacta de los datos

**- Desarrollo de softwares de gestion basados en el modelo relacional (1980):**

En la época de los ochenta también se desarrollará el SQL (Structured Query Language) o lo que es lo mismo un lenguaje de consultas o lenguaje declarativo de acceso a bases de datos relacionales que permite efectuar consultas con el fin de recuperar información de interés de una base de datos y hacer cambios sobre la base de datos de forma sencilla; además de analiza grandes cantidades de información y permitir especificar diversos tipos de operaciones frente a la misma información, a diferencia de las bases de datos de los años ochenta que se diseñaron para aplicaciones de procesamiento de transacciones. Pero cabe destacar que ORACLE es considerado como uno de los sistemas de bases de datos más completos que existen en el mundo, y aunque su dominio en el mercado de servidores empresariales ha sido casi total hasta hace relativamente poco, actualmente sufre la competencia del SQL Server de la compañía Microsoft y de la oferta de otros Sistemas Administradores de Bases de Datos Relacionales con licencia libre como es el caso de PostgreSQL, MySQL o Firebird que aparecerían posteriormente en la década de 1990.


# Diseño y desarrollo de una base de datos


## - Etapa 1: Relevamiento de requerimientos:
Primero es necesario necesario reunirse con el cliente y anilizar los requerimientos que debe cumplir el software a desarrollar.
Ademas, se recopila toda la información que es necesaria para entender el sistema (ya sea en formato fisico o digital).

## - Etapa 2: Diseño conceptual (modelo entidad-relación):
En esta etapa basicamente se identifican los principales elementos del sistema (entidades) y sus caracteristicas (atributos) y se realiza un esquema conceptual.
Para poder apreciar con mayor claridad como se relacionan las distintas entidades y la funcion de cada una. Ademas se establecen los distintos niveles de cardinalidad (uno a uno, uno a muchos, muchos a muchos)

## - Etapa 3: Diseño logico (diseño de tablas relacionales):
En esta etapa se realiza una transicion del modelo conceptual desarrollado previamente a un modelo de tablas relacionales, los elementos del modelo previo tendrán denominaciones distintas, por ejemplo:
- Entidades = Tablas
- Atributos = Campos
- Registros = Tuplas
- Cardinalidad = Relaciones

Otras consideraciones:
- Cada entidad corresponde a una tabla.
- Cuando hay una relacion muchos a muchos, se debe crear “una tabla intermedia” cuando se pasa al modelo relacional.

## - Etapa 4: Diseño fisico:
El objetivo del diseño físico es la generación del esquema físico de la base de datos en el modelo de datos que implementa el SGBD. Esto incluye la definición sobre el SGBD de las tablas con sus campos, la imposición de todas las restricciones de integridad y la definición de índices.











