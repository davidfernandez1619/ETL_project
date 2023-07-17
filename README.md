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

I created some graphs to visualize my data and take conclusions. This were the steps I took:

* **Analyzing our movies' durations:**

First, I wanted to check if the duration of our movies followed a normal distribution. To do this, I first took out from my dataframe some movies that belonged to categories that weren't movies, like documentaries and/or short subjects (there were just a few), as well as films under 40 mins, so we could really analyze those elements that were actually films. 

After this, I made a graphic to show our movies duration distribution (histogram), and another to show how the average of our films durations had varied per decades (bar graphic). 

* **Analyzing our movies' scores:**

I followed the exact same processs with our movies scores; I made a histogram for the distribution of the scores and a bar graphic for the evolution of the films scores per decades.  

* **Analyzing the relationship between both concepts:**

Next, I wanted to check if there is any correlation between a movie's duration and its score. For this, I created a scatter plot with our movies durations and scores, and calculated the correlation between both concepts. 

* **Analyzing our movies' categories:**

I was curious to check which, of all the winning categories our CSV had (105) were the ones that appeared most times, meaning that they were the most awarded categories. To get this data, I counted every category, and selected the 10 most appearing ones. 

Finally, based on this top 10 categories, I created a bar graphic to show which category had the highest score mean of all the movies belonging to it. 

If you want to see the whole process of creating all the graphics, check the file [5-Visualization](https://github.com/davidfernandez1619/ETL_project/blob/main/Notebooks/5-Visualization.ipynb) in the 'Notebook' file. 

Also, you can visit all my CSVs in the ['Data' directory](https://github.com/davidfernandez1619/ETL_project/tree/main/Data). 

## Conclusion

Based on the graphics I created, I could draw the following conclusions:

* **The duration and score of the Oscar-winning movies have increased over time:**

Here you can see the evolution of duration per decades:

![image](https://github.com/davidfernandez1619/ETL_project/assets/38441372/c8da65f4-de16-4a69-a117-124fa9955524)

As we can see, the duration of movies grew from the 1920s, peaked in the 1960s and has pretty much stayed the same since then, although they suffered some decrement in the 2010s. 

And here you can observe the evolution of score per decades:

![image](https://github.com/davidfernandez1619/ETL_project/assets/38441372/5094c4e1-908c-4a60-bc84-4728a73bb709)

As the graphic shows, the mean of the score of movies has slowly and gradually grown from the 1920s until the 1990s, and stayed more or less stable since then. 

* **There's barely correlation between the score and duration of movies:**

Having analyzed score and duration, I wanted to check if there was any correlation between the score and duration of a movie, so I created a scatter plot: 

![image](https://github.com/davidfernandez1619/ETL_project/assets/38441372/667d9862-a956-4af9-aadc-9602665f13dc)

The correlation between both concepts is 0.37, so we can conclude that there is barely any correlation between the score and duration of a movie. 

* **'Directing' is both the most awarded category, and its movies have one of the higest 'score' average**

As we can see in the following graphic, these are the top 10 most awarded categories in the Oscars, meaning that they appeared the most times in our CSV:

![image](https://github.com/davidfernandez1619/ETL_project/assets/38441372/4e6b22ca-27cd-4d78-b013-c256991af8cd)

'Directing' appears the highest number of times, followed of 'Film editing' and 'Actress in a supporting role'. 

In this graphic, we can see that also the category 'Directing' has the highest score average of its movies, only second to 'Best Picture'.

![image](https://github.com/davidfernandez1619/ETL_project/assets/38441372/f673cd07-8375-4fb7-97a2-254108a18176)

## Next steps

* To expand this analysis to other cinematic awards. We could see if we get very different results if we focus on movies that won the Golden Globes, Emmy or BAFTA, for example.

* To add new data to our CSV, like 'movie popularity', 'movie genre', 'nominees' or 'box office', and make new connections between them, to answer questions like: what genres raise the most money? is the movie popularity of the nominees the same as the winner ones? is a movie popularity correlated with its box office?

* Focus on non-awarded movies. Does the data change a lot between awarded and non-awarded movies? We could take a random sample of awarded and non-awarded films per decade, and compare them according to the parameters used on this project. 

## Tools















