SELECT distinct
ar.name as artist_name
,ar.id as artist_id
--,wo.name as song_name
,wo.id as workid

into bs_work_composers

FROM l_artist_work aw
join artist ar on aw.entity0 = ar.id
join work wo on aw.entity1 = wo.id

where wo.id in
(select distinct  workid
from allalbums_newmeta2)

and ar.name ~* '(Bill Wyman|George Harrison|John Lennon|Keith Richards|Mick Jagger|Nanker Phelge|Paul McCartney|Richard Starkey)'