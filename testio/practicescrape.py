# import selenium 
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
# chromedriver extension
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import getpass
from time import sleep
#import flask
from flask import Flask, jsonify, request
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)

@app.route('/attendance', methods=['GET'])
def get_attendance():
    #request_data = request.get_json()
    #username = request_data['username']
    #password = request_data['password']
    #eventURL = request_data['event']

    #attendance_list = scrape_attendance(username, password, eventURL)

    attendance_list = scrape_attendance(1, 1, 1)
    jsonified_list = jsonify(attendance_list)

    print(jsonified_list.json[2])

    return jsonify(attendance_list)

def scrape_attendance(loginPhone, myPassword, eventPage):
    attendance = []

    # 0 - Default, 1 - Allow, 2 - Block
    chrome_options = Options()
    chrome_options.add_experimental_option("prefs", { "profile.default_content_setting_values.notifications": 1})
    chrome_options.add_argument("--headless=new")

    # loginPhone = input("INPUT | Facebook Username: ")
    # myPassword=getpass.getpass(prompt='INPUT | Facebook Password: ')
    # eventPage = input("INPUT | Link to event: ")

    # driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options = chrome_options)
    # deprecated chromedriver
    driver = webdriver.Chrome(options = chrome_options)
    driver.get("https://www.facebook.com/")
    driver.maximize_window()

    username = driver.find_element(By.XPATH,"//input[@type='text']")
    username.send_keys(loginPhone)

    password = driver.find_element(By.XPATH,"//input[@placeholder='Password']")
    password.send_keys(myPassword)

    loginButton = driver.find_element(By.XPATH,"//button[@type='submit']")
    loginButton.click()
    sleep(7)

    driver.get(eventPage)
    sleep(2)
    webdriver.ActionChains(driver).send_keys(Keys.ESCAPE).perform()

    openlist = driver.find_element(By.XPATH, '//div[@class="x1d52u69 x1pi30zi x1swvt13"]')
    openlist.click()

    sleep(2)
    friendXPath = '//a[@class="x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv xzsf02u x1s688f"]'
    friends = driver.find_elements(By.XPATH, friendXPath)
    del friends[0:3]

    print("Attendees: ")
    for f in friends:
        # print(f.text)
        attendance.append(f.text)
        # print(f.text)

    # print(attendance)
    sleep(2)
    driver.quit()
    return attendance


if __name__ == '__main__':
    app.run()
    # scrape_attendance(1,1,1)