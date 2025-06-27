# 🛒 Inventario Analítico para Tienditas de la Esquina

Este proyecto es una aplicación web desarrollada con Spring Boot y PostgreSQL que permite a pequeños negocios minoristas (tienditas) llevar un control analítico de inventario, ventas, compras y mermas. La plataforma facilita el análisis histórico y la toma de decisiones inteligentes para mejorar la gestión y rentabilidad del negocio.

## 🚀 Tecnologías usadas
- Java 21 
- Spring Boot
- Spring Data JPA
- PostgreSQL 15
- Docker & Docker Compose
- Maven
- HTML + CSS

## 🧑‍💻 Funcionalidades principales
- Registro y consulta de productos, compras, ventas y mermas
- Reportes analíticos sobre productos de mayor rotación, ventas históricas, periodos críticos, etc.
- Interfaz web sencilla y responsiva
- Arquitectura portable y fácil de desplegar

## ⚙️ Instalación y ejecución rápida con Docker

### 1. Clona el repositorio

```bash
git clone https://github.com/sreyesnunez/Examen3erParcial.git
cd InventarioDW

```

### 2. Construye el proyecto

Compila el backend y genera el archivo JAR:

```bash
mvn clean package -DskipTests
```

### 3. Levanta los contenedores

Asegúrate de tener Docker y Docker Compose instalados, luego ejecuta:

```bash
docker-compose up --build
```

### 4. Accede a la aplicación 

Una vez levantado el contenedor, abre tu navegador y ve a:

```
http://localhost:8080/index.html
```

## 📦 Estructura principal del proyecto

- /src — Código fuente Java (Spring Boot)
- /db-init/dump.sql — Script SQL de inicialización de la base de datos
- /Dockerfile — Definición de la imagen Docker del backend
- /docker-compose.yml — Orquestación de servicios
- /README.md — Esta guía

## 📝 Notas

- Si cambias usuario/password de la base de datos, actualiza ambos en application.properties y docker-compose.yml.
- Para recargar los datos desde el dump, ejecuta docker-compose down -v antes de levantar el sistema.
- Puedes monitorear logs con docker logs spring_app o docker logs postgres_db.

## 👤 Créditos
- Desarrollado por Sebastián Reyes Núñez
- 3er Examen Parcial - Ingeniería de Software - ESCOM - IPN