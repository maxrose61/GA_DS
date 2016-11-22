## Quantifying Influence: The Beatles vs. The Rolling Stones

A description of my project can be found [here](FirstPresentation_MRose_DS4.pdf), in the project question presented to class.<br><br>

With an instance of the Musicbrainz server/database installed and running in my home, I spent significant time becoming aqcuainted with the schema and developing suitable queries to connect individual songs (or works in the schema) to recordings of the songs, and then to releases of the recording. A release is part of a release group which  could be a single or an album (compact disc or vinyl). Each release group is typically distributed globally i.e. multiple countries, each with a potentially unique release date.<br><br>

I decided early on to aggregate the number of releases and re-releases for use as a feature, making the assumption that popular or impactful recordings will have a greater number of releases than lesser material. Aggregation occured both the new tables I generated in the database and later in the DataFrames where addtional data was aggregated and merged into a single csv to build and test models on.

The queries can be reviewed here [Queries located here](queries).<br><br>

A second query and export consists of all the versions (aka "covers") of the Beatles and Stones original material that I could find in the database. I extracted each artist and each version, expecting to use the number of times covered and number of artists covering in the modeling. I excluded from this csv export any songs not written by the two bands, presuming that their original work would be most relavant to my model. It should be noted that each band themselves recorded a significant number of covers, particularly early in their respective careers. The Rolling Stones, with a body of work spanning over 50 years, continue to incorporate non-original songs in their work to this day.<br><br>

Which brings me to the final, albeit small csv file which identifies which songs in the combined catalog of the two bands are original, which I defined as any work recorded by either band for which at least one band member was credited as composer.

From here I will point you to two notebooks, the first covering the import, cleaning, aggregating and merging of the three source CSV files into a DataFrame which is then saved into a new CSV to bring into the second notebook for model evaluation.

[Raw CSV files here](data)<br><br>

Notebook 1 [_maxrose_dsFinal_Acquire_Clean_Merge](_maxrose_dsFinal_Acquire_Clean_Merge.ipynb)

Notebook 2 [Quantifying_Influence_Analysis_maxrose_DSFinal](Quantifying_Influence_Analysis_maxrose_DSFinal.ipynb)
<br><br>
At the time of this draft, I have noted some issues with the data that will likely need to be resolved through slight modifications to the SQL queries, particularly around finding or aggregating accurate release dates, which are to be considered in the analysis and modeling of the data.


