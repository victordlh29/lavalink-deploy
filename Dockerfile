# Lavalink v4.2.2 for Render.com (Free Tier)
# Docs: https://lavalink.dev

FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Download Lavalink v4.2.2
ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar /app/Lavalink.jar

# Copy your custom configuration
COPY application.yml /app/application.yml

# Expose Lavalink port
EXPOSE 2334

# Start Lavalink
ENTRYPOINT ["java", "-jar", "Lavalink.jar"]
