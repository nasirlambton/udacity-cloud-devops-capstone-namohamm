FROM python:3.7.3-stretch

## Step 1:
# Create a working directory in docker container
WORKDIR /app

## Step 2:
# Copy python source code to working directory 
COPY app.py requirements.txt /app/

## Step 3:
# Install required packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose application interface port 80
EXPOSE 80

## Step 5:
# Run app.py with container launch
CMD ["python", "app.py"]