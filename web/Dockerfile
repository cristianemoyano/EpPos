FROM python:3.9

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Create a working directory for the django project
WORKDIR /web

# Copy code
COPY . .

# Install the requirements to the container
RUN pip install --no-cache-dir -r requirements.txt

# Open a port on the container
EXPOSE 8000