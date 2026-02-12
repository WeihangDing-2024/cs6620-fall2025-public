# Use an official Python runtime as a parent image
# 'slim' variants are smaller and generally preferred for production
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# --no-cache-dir reduces the image size by not caching the install files
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the Flask application
# Note: Ensure your main file is named 'app.py' or update the command below
# We use host=0.0.0.0 so the server is accessible externally
CMD ["flask", "run", "--host=0.0.0.0"]