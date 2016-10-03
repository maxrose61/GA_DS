## Command Line Chipotle Homework


### Description of data file
**Structure of the file**
To retrieve the column headers, I used a head command: `head -n 1 chipotle.csv`

To retrieve the column headers, I used a head command: `head -n 1 chipotle.csv`

| order_id | quantity | item_name | choice_description | item_price | 

Reviewing the contents of the file I see multiple items share an order_id (multiple rows).

| order_id | quantity | item_name | choice_description | item_price | 
|-------|--------|----------|------------|----------:| 
| 1 | 1 | Chips and Fresh Tomato Salsa | NULL | $2.39 | 
| 1 | 1 | Izze | [Clementine] | $3.39  | 
| 1 | 1 | Nantucket Nectar | [Apple] | $3.39  | 
| 1 | 1 | Chips and Tomatillo-Green Chili Salsa | NULL | $2.39 | 


Multiple items share the order_id, so I can use a piped command to get the number of unique order ids:
cat chipotle.tsv | cut -f 1 | uniq | wc -l
Which returns 1835, though that includes the header row.

We could subtract 1 for the header or use this command:
cat chipotle.tsv | cut -f 1 | uniq | tail -n 1
Returns the last row with the order id of 1834, the highest/last order_id.

**Number of lines in the file:**
wc -l chipotle.tsv 
* 4623

### Let's Talk Burritos
What is more popular?
cat chipotle.tsv | cut -f3 | grep -i 'burrito' | sort | uniq -c
* 91 Barbacoa Burrito
*  6 Burrito
* 59 Carnitas Burrito
* 553 Chicken Burrito
* 368 Steak Burrito
* 95 Veggie Burrito
  
Looks like chicken is the winner!

#### You want beans with that burrito?

`cat chipotle.tsv | cut -f3,4 | grep -i 'chicken burrito' | grep -i 'pinto bean' | sort -k 1 | wc -l`<br>
* 105


`cat chipotle.tsv | cut -f3,4 | grep -i 'chicken burrito' | grep -i 'black bean' | sort -k 1 | wc -l`<br> 
* 282


Black beans are more popular more than a 2 to 1 margin.

### Find all the data files (CSV, TSV) in the repo

`find . | grep -E 'tsv|csv' > alldatafiles.txt`

./data/Airline_on_time_west_coast.csv
./data/airlines.csv
./data/bank-additional.csv
./data/bikeshare.csv
./data/chipotle.tsv
./data/citibike_feb2014.csv
./data/drinks.csv
./data/drones.csv
./data/features.csv.zip
./data/hitters.csv
./data/icecream.csv
./data/imdb_1000.csv
./data/mtcars.csv
./data/NBA_players_2015.csv
./data/ozone.csv
./data/pronto_cycle_share/2015_station_data.csv
./data/pronto_cycle_share/2015_trip_data.csv
./data/pronto_cycle_share/2015_weather_data.csv
./data/rossmann.csv
./data/rt_critics.csv
./data/sms.tsv
./data/stores.csv
./data/syria.csv
./data/time_series_train.csv
./data/time_series_train.csv.zip
./data/titanic.csv
./data/ufo.csv
./data/vehicles_test.csv
./data/vehicles_train.csv
./data/yelp.csv

### Occurances of the word "dictionary":
Searching from the root of my local class repository:
maxr-mp:DS-SEA-4 maxrose$ 
`for file in $(find . | grep -E 'tsv|csv'); do grep -i 'dictionary' $file| wc -w; done | paste -s -d+ - | bc`
* 188




 

