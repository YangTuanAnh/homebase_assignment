import requests
from bs4 import BeautifulSoup
import requests_cache
import os

class BatdongsanScraper:
    def __init__(self):
        pass
    
    def scrape_real_estate_data(self, url):
        response = requests.get(url)

        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')

            print(soup.prettify())
        else:
            print(f"Error: {response.status_code}")

if __name__ == "__main__":
    target_url = "https://www.batdongsan.com.vn/nha-dat-ban"

    scraper = BatdongsanScraper()
    scraper.scrape_real_estate_data(target_url)
