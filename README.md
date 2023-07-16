# ETL Oscars project

![image](https://github.com/davidfernandez1619/ETL_project/assets/38441372/09967b9e-5590-4d1a-9041-a44dcf8b15fd)

## Introduction 

As a cinema enthusiast and data analyst student at Ironhack, I wanted to do my first ETL project about award-winning movies. My goal was to analyze academy-awarded movies, and focus on the winning categories, movies duration and their scores, with the goal of finding relations and detect changes over time. 

Within the wide range of existing awards, I chose Oscars winning movies, since it's the most prestigious and highest possible award a movie can win within the cinematic industry. 

These are the steps I took:

## Step 1: Extract and clean my CSV

I found a CSV on [Kaggle](https://www.kaggle.com/), containing all the Oscar-winning movies from 1928 to 2023, including the winners and nominees. 

It was very complete, but it needed a little bit of cleaning. So I took out the nominees, deleted the null values, and dropped some columns to focus on those that were relevant to my project. You can see this process in the files ['1-Cleaning_Oscars_csv'](https://github.com/davidfernandez1619/ETL_project/blob/main/Notebooks/1-Cleaning_Oscars_csv.ipynb), inside the 'Notebooks' directory.  

## Step 2: Web scraping and more cleaning

My CSV didn't contain the movies duration and scores, so I had to get them from somewhere. 

I scraped the data from the [IMDB](https://www.imdb.com/), which is a webpage that contains super complete information about pretty much any movie ever made in cinema history (except a select few!). 

I used Selenium to (automatically) search for every film in my CSV and, for each one of them, take from IMDB the movie's duration and score, and store the values in new columns. 

When my scraping finished, I did a bit of cleaning of my CSV. I removed the null values, and apply some corrections to our 'score' and 'duration' values, so I could manipulate and use them for later. All this web scraping and cleaning processes are in the files [2-Web_scrapping](https://github.com/davidfernandez1619/ETL_project/blob/main/Notebooks/2-Web_scrapping.ipynb) and [3-Cleaning_scrapped_csv](https://github.com/davidfernandez1619/ETL_project/blob/main/Notebooks/3-Cleaning_scrapped_csv.ipynb) files, in the 'Notebooks' file. 

## Step 3: Visualization

* **Analyzing our movies' durations:**

First, I wanted to check if the duration of our movies followed a normal distribution. To do this, I first took out from my dataframe some movies that belonged to categories that weren't movies, like documentaries and/or short subjects (there were just a few), as well as films under 40 mins, so we could really analyze those elements that were actually films. 

After this, I made a graphic to show our movies duration distribution, and another to show how the average of our films durations had varied over time (per decades). 

* **Analyzing our movies' scores:**

We followed the exact same processs with our movies scores; we made two graphics: one for the distribution of the scores and another for the evolution of the films scores per decades.  

* **Analyzing the relationship between both concepts**











