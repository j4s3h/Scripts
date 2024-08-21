#!/bin/bash

# Prompt the user for project-specific variables
read -p "Enter your project name: " PROJECT_NAME
read -p "Enter your Python version (e.g., 3.9): " PYTHON_VERSION
read -p "Enter your desired port (e.g., 8000): " PORT

# Create Dockerfile
cat <<EOF > Dockerfile
# Base image
FROM python:$PYTHON_VERSION-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /app/

# Run migrations
RUN python manage.py migrate

# Expose the port
EXPOSE $PORT

# Start the server
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "$PROJECT_NAME.wsgi:application"]
EOF

# Notify the user
echo "Dockerfile created successfully with the following configuration:"
echo "Project Name: $PROJECT_NAME"
echo "Python Version: $PYTHON_VERSION"
echo "Port: $PORT"
