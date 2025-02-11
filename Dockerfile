# Use the official Apache Airflow image
FROM apache/airflow:2.10.4

# Switch to root user to install system dependencies
USER root

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    wget \
    gpg \
    && rm -rf /var/lib/apt/lists/*

# Add Google's signing key & repo, then install Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Install ChromeDriver (match installed Chrome version)
RUN CHROME_VERSION=$(google-chrome --version | awk '{print $3}' | cut -d '.' -f 1) \
    && CHROMEDRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION") \
    && wget -q "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" -O /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/chromedriver \
    && rm /tmp/chromedriver.zip || echo "ChromeDriver installation failed, continuing..."

# Switch to airflow user BEFORE running pip install
USER airflow

# Copy the requirements.txt file into the container
COPY requirements.txt /tmp/requirements.txt

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Switch back to root user temporarily to delete the file
USER root
RUN rm -f /tmp/requirements.txt

# Switch back to airflow user
USER airflow
