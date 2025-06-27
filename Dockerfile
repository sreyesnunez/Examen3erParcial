# Usa una imagen de Java JDK oficial
FROM eclipse-temurin:21-jdk-alpine

# Crea el directorio para la app
WORKDIR /app

# Copia el JAR compilado a la imagen
COPY target/*.jar app.jar

# Expón el puerto 8000
EXPOSE 8000

# Comando para correr la app
ENTRYPOINT ["java", "-jar", "app.jar"]
