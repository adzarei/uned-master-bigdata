#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 30 16:30:33 2019

@author: Andrés Duque Fernández
"""

from time import sleep
from kafka import KafkaProducer
import random

producer = KafkaProducer(bootstrap_servers=['localhost:9092'], value_serializer=lambda x: x.encode('utf-8'))

tweet_list = []
with open("./sentweets_esp.txt") as infile:
    for line in infile.readlines():
        tweet_list.append(line.strip())
        
random.shuffle(tweet_list)

for tweet in tweet_list:  
    producer.send('kafkaTwitter', value=tweet)
    sleep(random.random()/10)
