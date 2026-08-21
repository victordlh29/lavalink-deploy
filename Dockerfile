# Lavalink v4.2.2 for Render.com (Free Tier)
# Docs: https://lavalink.dev

FROM eclipse-temurin:17-jre-jammy

# Install curl for downloading
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download Lavalink v4.2.2
RUN curl -L -o /app/Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar

# Copy your custom configuration
COPY application.yml /app/application.yml

# Render sets PORT env var. We map it to SERVER_PORT for Spring Boot (Lavalink).
# Default to 10000 if not set.
ENV SERVER_PORT=${PORT:-10000}

# Expose the port Render will route to
EXPOSE ${SERVER_PORT}

# Start Lavalink
CMD ["java", "-jar", "Lavalink.jar"]
