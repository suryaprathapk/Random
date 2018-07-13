#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup
from gi.repository import Notify

res = requests.get('https://in.bookmyshow.com/kanpur/movies/batman-v-superman-dawn-of-justice/ET00030143')
print(res.status_code)

text_data = res.text
soup = BeautifulSoup(text_data)

#dude = soup.select('a')
dude = soup.find_all(class_='showtimes btn _cuatro')

if len(dude)==0:
    print("Booking has not started yet :(")
else:
    print("Book your ticket! Book your ticket!")

Notify.init("start")
notification = Notify.Notification.new("Booking has not started yet :(")
notification.set_app_name("BvsS")

if len(dude)==1:
    notification.update("Book your ticket, Book your ticket!")

notification.show()
