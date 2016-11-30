select 
rec.id as recid
,rec.name as recname
,ac.name
,coalesce(rm.rating, 0) as rating
from recording rec
join recording_meta rm on rec.id = rm.id
join artist_credit ac on rec.artist_credit = ac.id

limit 5000