# ETL Oscars project

![image](https://github.com/davidfernandez1619/ETL_project/assets/38441372/7542b7aa-9538-4b84-97d9-3a232d7be786)

## Introduction 

As a cinema enthusiast and data analyst student at Ironhack, I wanted to do my first ETL project about award-winning movies. My goal was to analyze academy-awarded movies, and focus on the winning categories, movies duration and their scores, with the goal of finding relations and detect changes over time. 

I chose Oscars winning movies, since it's the most prestigious and important award a movie can win in the cinematic industry, so they're basically the highest possible award you can win.

Let's go to our project!

## Step 1: Extract and clean my CSV

I found a CSV on [Kaggle](https://www.kaggle.com/), containing all the Oscar-winning movies from 1928 to 2023, including the winners and nominees. 

It was very complete, but it needed a little bit of cleaning. So I took out the nominees, deleted the null values, and dropped some columns to focus on those that were relevant to my project. You can see this process in the files ['1-Cleaning_Oscars_csv'](https://github.com/davidfernandez1619/ETL_project/blob/main/Notebooks/1-Cleaning_Oscars_csv.ipynb), inside the 'Notebooks' directory.  

## Step 2: Web scraping and more cleaning

My CSV didn't contain the movies duration and scores, so I had to get them from somewhere. 

I scraped the data from the [IMDB](https://www.imdb.com/), which is a webpage that contains super complete information about pretty much any movie ever made in cinema history (except a select few!). 

I used Selenium to (automatically) look for every film in my CSV and, for each one of them, take from IMDB the movie's duration and score, and store the values in new columns. 

When my scraping finished, I did a bit of cleaning of my CSV. I removed the null values




