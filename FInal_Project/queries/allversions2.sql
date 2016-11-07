-- make table allalbums_newmeta2 first

-- drop table bs_covers

select distinct
min(rec.id) as recording_id
,alb.artistid as source_artist
,ac.name as recording_artist
,rec.name as record_name
,rec.artist_credit as rec_artist_id
,wo.id as workid
,coalesce(rm.rating, wm.rating) as rating
--,rec.length/1000 as recdur

into bs_covers

from recording rec
join artist_credit ac on rec.artist_credit = ac.id 
join l_recording_work lrw on rec.id = lrw.entity0
join (select distinct artistid,  workid   from allalbums_newmeta2) alb on lrw.entity1 = alb.workid
join work wo on alb.workid = wo.id
left join recording_meta rm on rec.id = rm.id
left join work_meta wm on wo.id = wm.id

where ac.id not in (303, 825)
and wo.id in (select workid from bs_work_composers)

group by
alb.artistid
,ac.name
,rec.name 
,rec.artist_credit 
,wo.id
,coalesce(rm.rating, wm.rating) 
--,rec.length/1000

order by 
rec.name
,rec.artist_credit





