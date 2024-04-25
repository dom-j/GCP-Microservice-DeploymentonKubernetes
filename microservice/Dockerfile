# Use an official Python runtime as the base image
FROM python:3.8-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Copy requirements.txt into the working directory
COPY requirements.txt ./

# Install the application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the working directory
COPY . .

# Expose port 8080 for the application
EXPOSE 8080

# Define the command to run the application
CMD [ "python", "./sample-app.py" ]