#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd  
import numpy as np
import re
import pickle
from tqdm import tqdm


from selenium import webdriver     # I import everything I need to do web scrapping with selenium
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import TimeoutException


'''This is a function that takes a dataframe that contains films, and takes the 'duration' and 'score' of each film
from IMDB, using Selenium'''

def selen(movies_df):
    
    for index, (value, year) in enumerate(zip(movies_df['film'], movies_df['year_film'])): # We iterate through each film (row), and we want to write its title and year
        
        driver.get("https://www.imdb.com/") # This is the web page we get the info from IMDB, which a movie database
        driver.implicitly_wait(2)
        
        try:

            driver.find_element("css selector", "#suggestion-search").send_keys(f'{value} {str(year)}') # In IMDB's search box, we write each film and its year
            time.sleep(2)

            try:

                driver.find_element("css selector", "#react-autowhatever-navSuggestionSearch--item-0 > a:nth-child(1) > div:nth-child(2)").click() # Try to click on the first option that our seach shows
            except:
                movies_df.loc[index, 'score'] = np.nan # If our movie doesn't have an IMDB profile, we fill our column 'score' and 'duration' with null values, and clear our search box
                movies_df.loc[index, 'duration'] = np.nan
                driver.find_element("css selector", "#suggestion-search").clear()

                continue  # Continue to the next iteration

            try:
                duration = driver.find_element('xpath', '/html/body/div[2]/main/div/section[1]/section/div[3]/section/section/div[2]/div[1]/ul/li[3]').text
                movies_df.loc[index, 'duration'] = duration # If the film has a duration written, take it and assign it to our 'duration' column
            except:
                movies_df.loc[index, 'duration'] = np.nan # If not, assign a null value to the 'duration' column
                continue  # Continue to the next iteration

            try:
                score = driver.find_element('xpath', '/html/body/div[2]/main/div/section[1]/section/div[3]/section/section/div[2]/div[2]/div/div[1]/a/span/div/div[2]/div[1]').text
                movies_df.loc[index, 'score'] = score # If the film has a score written, take it and assign it to our 'score' column
            except:
                movies_df.loc[index, 'score'] = np.nan # If not, assign a null value to the 'score' column

        except TimeoutException:
            continue  # Go to the next iteration, if it shows an error of Timeout Exception 

    driver.quit() # At the end of the function, close the Firefox navegator 


'''We create a function that converts a duration strings (ej: 1h 39min) to minutes (99), in integer format'''

def convert_duration_to_minutes(value): 
    hours = re.findall(r'\d+h', value) # we use regex to get all values followed by an 'h' (hours) and store them
    minutes = re.findall(r'\d+min', value) # the same, but with mins

    hours = int(hours[0].rstrip('h')) if hours else 0 # If regex finds hours, we take out the 'h' and store the number
    minutes = int(minutes[0].rstrip('min')) if minutes else 0 # If regex finds mins, we take 'mins' and store the number

    total_minutes = hours * 60 + minutes # since we want everything in mins, we multiply the hours by 60 and add the remaining minutes

    return total_minutes # our function returns the total mins


'''We create a function that converts a score in strings (8,8\n/10) to a single float (8.8)'''

def clean_rating(value):
    parts = value.split('\n/')
    if len(parts) == 2:
        try:
            cleaned_value = parts[0].replace(',', '.').strip()  # Reemplazar comas por puntos y eliminar espacios en blanco
            return float(cleaned_value)
        except ValueError:
            return None
    else:
        return None
    
'''We create a functin that takes a bunch of words, and returns the same words, but with the first letter of each
word in capital letters'''

def capitalize_words(value):
    words = value.split()  # Divide the value in words
    capitalized_words = []  # List to store the capitalized words

    for word in words:
        # Capitalize the first letter of each word
        capitalized_word = word[0].upper() + word[1:].lower()
        capitalized_words.append(capitalized_word)  # Add the capitalized word to our list 
    # Now we join the capitalized words in a single string
    result = ' '.join(capitalized_words)
    return result


# In[1]:


import os

current_directory = os.getcwd()
print(current_directory)

