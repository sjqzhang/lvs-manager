#!/usr/bin/env python
# -*- coding: utf8 -*-

import requests
import json
import time


key = 'afec1b98-7fe4-410b-9c82-9fd3a9861bab'
timestamp = str(time.time())


def md5(src):
    import hashlib

    m2 = hashlib.md5()
    m2.update(src)
    return m2.hexdigest()


data = {'vip': ['127.0.0.1:80'],'line':'cm', 'room': 'ns', 'business': 'xxxxxxxxxtt', 'rs': ['127.0.0.1:80'],
        'persistence_timeout': 60, 'module': 'flyme-80', 'id': '586cb123c720b28f89e8f94b','special':0,
        'timestamp':timestamp,'md5':md5(key+timestamp)}
#增加
print requests.post('http://127.0.0.1:8888/webapi/?action=editLvsManagerConfig', {'data':json.dumps(data)}).json()


data = {'room': 'ns', 'business': 'aider', 'id': ['58608a40c720b25a75b6304a'],
        'timestamp':timestamp,'md5':md5(key+timestamp)}

#查询
print requests.post('http://127.0.0.1:8888/webapi/?action=getLvsManagerConfigVipInstanceInfoList', {'data':json.dumps(data)}).json()

#上线
data = { 'id': ['58608a40c720b25a75b6304a'],
        'timestamp':timestamp,'md5':md5(key+timestamp)}
print requests.post('http://127.0.0.1:8888/webapi/?action=online', {'data':json.dumps(data)}).json()


#下线
data = { 'id': ['58608a40c720b25a75b6304a','585ced8c8420575851cb6c46'],
        'timestamp':timestamp,'md5':md5(key+timestamp)}
print requests.post('http://127.0.0.1:8888/webapi/?action=offline', {'data':json.dumps(data)}).json()