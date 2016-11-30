

--select * from work
--where name ~* 'Yer Bl'

select 
ac.name
,rel.id as releaseid
,rel.name as releasename
,rel.release_group
,l.name as langname
--,w.*

from release  rel
join artist_credit ac on rel.artist_credit = ac.id
join language l on rel.language = l.id
join l_recording_work lrw on 

join medium med on rel.
join medium_format mf on med.format = mf.id

where mf.id in (1,7)
join  recording r on 
join track tr on r.id = tr.recording
join work 
--join  ( select distinct 
--w.name,  w.id, w.language
--from work w
--join work_type wt on w.type = wt.id
--where wt.id = 17
--and w.language = 120
--) w on l.id = w.language

where ac.id in (
--303
825
)

limit 5000



