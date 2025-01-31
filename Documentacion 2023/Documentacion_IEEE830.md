# Especificacion de Requerimientos de Software
Proyecto BankArg

## Capitulo 2
Proyecto BankArg

## Introducción
Este documento es una Especificación de Requisitos Software (ERS) para el Sistema de información de banca online. Esta especificación se ha estructurado en base al estándar IEEE. Práctica recomendada para especificaciones de Requisitos Software ANSI/IEEE 830, 1998.
### 1.1 Propósito
El presente documento tiene como propósito definir las especificaciones funcionales para el desarrollo de un sistema de información web que permitirá al usuario acceder a su cuenta bancaria.
### 1.2 Ámbito del sistema
El sistema será definido como BankArg. Proporcionará un manejo eficiente sobre la información entre el usuario y los dueños del banco.
El principal beneficio es aportar un entorno seguro y ágil para que los usuarios, luego de un tutorial de bienvenida y haber ingresado al sistema bancario personal con sus respectivos usuarios y contraseñas, puedan visualizar su saldo, registrar contactos frecuentes, realizar transferencias a terceros, administrar sus tarjetas, agregar pago de servicios, recibir alertas de vencimientos, solicitar préstamos, validación de token, aviso en caso de inicio de sesión en otro dispositivo, turnero online, y por úlitmo un formulario de contacto.
Como contraparte los dueños del banco obtendrán un reporte de los usuarios registrados junto con los servicios más utilizados, que les permitirán otorgar un mejor servicio y realizar futuras adecuaciones.
### 1.3 Definiciones, acrónimos y abreviaturas

- Usuario = Persona que usará el sistema para visualizar su cuenta bancaria
- SIS-I = Sistema de Información Web para la Gestión de Procesos Administrativos y Académicos
- ERS = Especificación de Requisitos Software
- RF = Requerimiento Funcional
- RNF = Requerimiento No Funcional
- FTP = Protocolo de Transferencia de Archivos

### 1.4 Personal involucrado
- Nombre: Ezequiel Giampaoli
/ Rol: Scrum master y desarrollador
/ Información de contacto: ezegiampaoli@gmail.com

- Nombre: Gabriel Alejandro Orellana
/ Rol: Desarrollador
/ Información de contacto: gabi.ale.orellana@gmail.com

- Nombre: Soledad Peralta
/ Rol: Desarrolladora
/ Información de contacto: ssperaltaa@gmail.com

- Nombre: Roberto Ariel Milian
/ Rol: Desarrollador
/ Información de contacto: milianarieleam@gmail.com

- Nombre: Maximiliano Veron
/ Rol: Desarrollador
/ Información de contacto: maxi.ush.ind@gmail.com

- Nombre: Joaquin Bonvechi
/ Rol: Desarrollador
/ Información de contacto: joacobonvechi2272002@gmail.com

- Nombre: Maria Laura Peralta
/ Rol: Desarrolladora
/ Información de contacto: lali.635@gmail.com

- Nombre: Valentin Alterio
/ Rol: Desarrollador
/ Información de contacto: alteriovalentin01@gmail.com

- Nombre: Juan Jose Salinas
/ Rol: Desarrollador
/ Información de contacto: juansalinaa@gmail.com

### 1.5 Referencias
- Titulo del documento: Standard IEEE 830 - 1998
- Referencia: IEEE 

### 1.6 Resúmen
Este documento se ha estructurado en tres partes: primero se realiza una introducción al proyecto desarrollado otorgando una visión general de la especificación de recursos del sistema. En segundo lugar se intenta establecer las principales funciones que éste debe realizar, los datos asociados y los factores, restricciones, supuestos y dependencias que afectan al desarrollo, sin entrar en excesivos detalles. Por último, se definen detalladamente los requisitos que debe satisfacer el sistema.

## 2. Descripción general

### 2.1 Perspectiva del producto
El sistema de banca online “BankArg” será un producto diseñado en principio para trabajar en entornos WEB, lo que permitirá su utilización de forma rápida y eficaz, accesible en cualquier dispositivo. Contará con distintas secciones para que el usuario pueda acceder a todos sus datos relevantes, historial de movimientos, transferencias, pagos, turnos, préstamos y seguridad. Tendrá además una guía de ayuda para que los usuarios puedan resolver todas sus dudas con respecto al uso del sistema y sus herramientas disponibles. 

### 2.2 Funciones del producto
En principio "BankArg" proporcionará las siguientes funciones:
- Acceso a cuenta
- Transferencias de dinero
- Pagos de servicios con sus respectivos comprobantes
- Alertas de vencimientos
- Solicitud de préstamos 
- Validación token para mayor seguridad
- Avisos en caso de iniciar sesión en otro dispositivo

### 2.3 Características de los usuarios
Establecemos distintos usuarios a saber:
- Los usuarios finales de este producto, no requieren de ningúna formación previa para su utilización.
- Desarrolladores, con amplios conocimientos para la implementación del software propuesto.
- Y por último los Dueños de BankArg íntegramente capacitados en el sistema bancario.

### 2.4 Restricciones
-	Interfaz para ser usada con internet.
-	Lenguajes y tecnologías en uso: Frontend HTML, CSS, JV Backend:Python, Base de datos: SQL 
-	Los servidores deben ser capaces de atender consultas concurrentemente.
-	El sistema se diseñará según un modelo cliente/servidor.
-	El sistema deberá tener un diseño e implementación sencilla, independiente de la plataforma o del lenguaje de programación.


## 3. Requisitos especificos

### Product Backlog

- US01- Como dueño del banco quiero una sección donde el cliente pueda ver todos los servicios que brindamos para que pueda acceder a ellos con mayor facilidad.
- US02- Como cliente, quiero poder solicitar una tarjeta de crédito o débito en línea.
- US03- Como cliente, quiero poder informar de cargos fraudulentos o disputar transacciones sospechosas.
- US04- Como cliente, quiero poder acceder a un servicio de asesoría financiera en línea para obtener consejos y sugerencias personalizadas sobre cómo invertir mi dinero.
- US05- Como cliente, quiero poder solicitar un seguro en línea para mi hogar, automóvil u otros bienes para protegerme de imprevistos. 
- US06- Como cliente, quiero poder recibir notificaciones en tiempo real sobre actividades sospechosas en mi cuenta, como retiros inusuales o gastos atípicos.
- US07- Como cliente, quiero poder contratar un plazo fijo en línea y obtener información clara y precisa sobre los plazos, las tasas de interés y los requisitos para poder invertir mi dinero de manera segura y rentable.
- US08- Como cliente, quiero poder abrir una cuenta de ahorro en línea para poder ahorrar dinero de manera efectiva y conveniente.
- US09- Como cliente, quiero poder establecer metas de ahorro en línea para que pueda trabajar hacia objetivos financieros específicos, como un fondo de emergencia o una compra importante.
- US10- Como cliente, quiero poder recibir alertas por correo electrónico o mensaje de texto cuando mi cuenta bancaria cae por debajo de un monto específico. 
- US11 Como cliente, quiero poder ver los depositos y el dinero de mi cuenta y acceder a los y últimos movimientos.
- US12 Como cliente, quiero realizar tranferencias: inmediata a mis propias cuentas, a cuentas de terceros (personas), a otros bancos y a cuentas de terceros: Entidades financieras privadas con CVU, poder hacer transferencias diferidas, consultas de las últimas transferencias y poder transferir montos superiores a los impuestos por el sistema del BCRA.

## SPRINTS

#### N° de sprint: 0
- Sprint Backlog: 
1. Definir requerimientos para el nuevo módulo a desarrollar e-commerce (colocarlos en el Product Backlog del Project), a su vez revisar si han cumplimentado todos los requerimientos previos, realizando mejoras del mismo
2. Plantear Historias de Usuarios y Tareas dependientes de las US para incorporarlas en el repositorio remoto GitHub.
3. Definir tareas dentro de las Historias de Usuario 
- Responsabilidades:
- Calendario: Fecha Inicio = 10/04/2023 -  Fecha de Fin = 21/04/2023
- Inconvenientes: -

#### N° de sprint: 1
- Sprint Backlog: 
1. Convertir los archivos .html del proyecto previo, en una SPA en Angular con módulos y components correspondientes.
2. Crear módulos y componentes para la tienda virtual o ecommerce.
3. Incorporar la navegabilidad de la aplicación mediante Routing con Angular.
4. Diseño conceptual al que ya hemos visto como DER: Diagrama Entidad-Relación.
5. Diseño Lógico que consta de la Normalización y el Modelo Relacional.
6. Diseño Físico que es el script legible de la DB en MySQL.
7. Crear un Diagrama de Clases y Casos de Uso para facilitar el modelado en POO.
- Responsabilidades:
- Calendario: Fecha Inicio = 24/04/2023 -  Fecha de Fin = 07/05/2023
- Inconvenientes: -

#### N° de sprint: 2
- Sprint Backlog: 
Frontend: Se requiere:
1. Crear servicios que consuman un API Rest de prueba. Para realizar las peticiones http, utilizar el servicio de HttpClient.
2. Inyectar a los componentes los correspondientes servicios a fin de que los componentes puedan acceder a los datos y mostrarlos en pantalla. Incluye enlace de datos (Data binding).
3. Incorporar la programación reactiva (asincrónica) mediante observables para la comunicación entre servicios y componentes.
Backend:
4. Establecer el modelo de base de datos del primer sprint en Django usando clases.
5. Establecer el sistema de usuarios en Django-Admin (registro, login y roles).
6. Crear un ABM (CRUD) de productos/servicios utilizando el panel de control de Django.
- Responsabilidades:
- Calendario: Fecha Inicio = 08/05/2023 -  Fecha de Fin = 21/05/2023
- Inconvenientes: -

#### N° de sprint: 3
- Sprint Backlog: 
1. Incorporar formularios reactivos de Registro y Login para la autenticación y formularios para la manipulación (Alta) de servicios/productos/suscripción, según el caso con sus respectivas validaciones. 
2. Conexión con el backend para el registro e inicio de sesión.
3. Conexión con backend para almacenar los datos de los productos/servicios y detalles de producto/servicios en la DB a través del modelo en Django.
4. Opcional: Agregar rutas protegidas a la navegación en base al usuario autenticado/autorizado. Ej. para acceder al tablero de control o bien, para acceder al registro de productos/servicios.
5. Registro de usuarios.
6. Login de usuarios.
7. Registro / Alta de al menos 3 productos/servicios/suscripción ( solo desde el rol Administrador, mediante su panel de control).
8. Tablero de control (Gestión) o Dashboard con módulos planteados en la maquetación del FrontEnd según proyecto: 
  - El rol ADMIN pueda ver la lista de usuarios registrados y el listado de los productos/servicios/suscripción según corresponda.
  - El rol USUARIO registrado solo que pueda ver su Dashboard para editar su perfil.
9. OPCIONAL: Token validación del login con JWT.
- Responsabilidades:
- Calendario: Fecha Inicio = 22/05/2023 -  Fecha de Fin = 04/06/2023 
- Inconvenientes: -

#### N° de sprint: 4
- Sprint Backlog: 
1. Tablero de control para usuarios: Mostrar catálogo (mínimo 3 productos o servicios o suscripción). Seleccionar para comprar. Simular Pago con API Mercado Pago o similar. 
2. Tablero de control administrador CRUD básico funcional de producto y cliente.
3. Actualizar documentación IEEE830 - tablero Kanban (project) y Wiki.
4. Actualizado todo el proyecto en GitHub como respaldo 
5. Demo final en video con participación de todo el equipo describiendo todas las funcionalidades.
6. OPCIONAL: Sitio publicado en Servidor
- Responsabilidades:
- Calendario: Fecha Inicio = 05/06/2023 -  Fecha de Fin = 18/06/2023
- Inconvenientes: -




