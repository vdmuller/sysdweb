# Use an official Python image as the base
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libsystemd-dev \
    pkg-config \
    gcc \
    libdbus-1-dev \
    libdbus-glib-1-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the application code into the container
COPY . /app

# Install Python dependencies
RUN pip install /app

# Expose the port the app runs on
EXPOSE 10088

# Define the command to run the app
CMD ["python", "sysdweb"]