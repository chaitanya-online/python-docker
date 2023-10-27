# Use the official Python image as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy application files from the host to the container's working directory
COPY . /app


# Set the command to run the application
CMD ["python", "hello.py"]
