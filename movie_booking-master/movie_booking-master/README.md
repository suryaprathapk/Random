#### A python script to  notify you when ticket booking of a movie starts.  
I am using BookMyShow's website for verifying ticket booking status.  
So go the BookMyShow and copy the URL of your movie and put that URL  
in the res variable.   
res = requests.get('https://in.bookmyshow.com/kanpur/movies/batman-v-superman-dawn-of-justice/ET00030143')  
We are requesting Dawn of Justice in Kanpur city in this case.  
Script will take it from here.  
You will get notifications and your shell will also print status results.

##### Requirements:
* requests module
* bs4 module
* gi.repository module
