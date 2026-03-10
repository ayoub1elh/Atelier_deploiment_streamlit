# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Upgrade pip
RUN pip install --upgrade pip setuptools wheel

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies (with binary wheels only to avoid compilation issues)
RUN pip install --no-cache-dir --only-binary=:all: -r requirements.txt

# Copy application files
COPY app.py .

# Expose port (Streamlit default)
EXPOSE 8501

# Set environment variables
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0
ENV STREAMLIT_SERVER_HEADLESS=true

# Run Streamlit app
CMD ["streamlit", "run", "app.py"]
