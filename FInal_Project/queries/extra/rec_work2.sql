select * from l_recording_work l
join artist_credit ac on l.entity0 = ac.id
join work wo on l.entity1 = wo.id

where 
l.entity1 = 155973
--ac.name ~* 'keith richards'

 limit 5000

-- l_recording_work : ent1 = work_id

/*

select * from recording r 
join track tr on r.id = tr.recording

where r.artist_credit = 303

-- select 
* 
from medium med
join medium_format mf on med.format = mf.id

where mf.id in (1,7)
limit 1000


*/


