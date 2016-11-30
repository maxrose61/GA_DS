select 
*
from  l_artist_work lrw

--join work w on lrw.entity1 = w.id

where lrw.entity1 = 15243

limit 5000


--  select * from artist where id = 1160983

-- select * from recording where id in (9767649)

select count(*) from l_recording_work

select count(*) from l_artist_work where entity0_credit = 303

select *  from l_recording_work where entity0 = 6385770

select * from recording rec 
join artist_credit ac on rec.artist_credit = ac.id
join (select distinct artistid, songname   from allalbums) alb on rec.name = alb.songname


where rec.name in 
(select distinct songname )


