## Quantifying Influence: The Beatles vs. The Rolling Stones


A description of my project can be found [here](FirstPresentation_MRose_DS4.pdf), in the project question presented to class.<br><br>

With an instance of the **Musicbrainz** server/database installed and running in my home, I spent significant time becoming aqcuainted with the schema and developing suitable queries to connect individual songs (or works in the schema) to recordings of the songs, and then to releases of the recording. A release is part of a release group which  could be a single or an album (compact disc or vinyl). Each release group is typically distributed globally i.e. multiple countries, each with a potentially unique release date.<br><br>

In my primary query to be exported, I decided early on to aggregate the number of releases and re-releases for use as a feature, making the assumption that popular or impactful recordings will have a greater number of releases than lesser material. Aggregation occurs in both the new tables I generated in the database and later in the DataFrames where addtional data was aggregated and merged into a single csv to build and test models on.


A second query and export consists of all the cover versions of the Beatles and Stones original material that I could find in the database. I extracted each artist and each version, expecting to use the number of times covered and number of artists covering in the modeling. I excluded from this csv export any songs not written by the two bands, presuming that their original work would be most relavant to my model. It should be noted that each band themselves recorded a significant number of covers, particularly early in their respective careers. The Rolling Stones, with a body of work spanning over 50 years, continue to incorporate non-original songs in their work to this day. These songs are excluded from the models.<br><br>

The queries can be reviewed here [Queries located here](queries).<br><br>

The final, albeit small CSV file I exported identifies which songs in the combined catalog of the two bands are original, which I defined as any work recorded by either band for which at least one band member was credited as composer.<br><br>

### __and ar.name ~* '(Bill Wyman|George Harrison|John Lennon|Keith Richards|Mick Jagger|Nanker Phelge|Paul McCartney|Richard Starkey)'__


### From here the reader can access two notebooks, the first covering the import, cleaning, aggregating and merging of the three source CSV files into a DataFrame which is then saved into a new CSV to bring into the second notebook for model evaluation.

[Raw CSV files here](data)<br><br>

Notebook 1 [Quantifying_Influence_Acquire_Clean_Merge.ipynb](Quantifying_Influence_Acquire_Clean_Merge.ipynb)

Notebook 2 [Quantifying_Influence_Analysis_maxrose_DSFinal](Quantifying_Influence_Analysis_maxrose_DSFinal.ipynb)
<br><br>

