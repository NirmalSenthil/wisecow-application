import requests
import time

url = "http://application_url"
timeout = 10  # seconds
check_interval = 60  # seconds

def check_application_health(url):
    try:
        response = requests.get(url, timeout=timeout)
        if response.status_code == 200:
            print(f"The application is UP. Status code: {response.status_code}")
        else:
            print(f"The application is DOWN. Status code: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"The application is DOWN. Error: {e}")

try:
    while True:
        check_application_health(url)
        time.sleep(check_interval)
except KeyboardInterrupt:
    print("Health check stopped by user.")

