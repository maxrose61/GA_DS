select distinct
ac.name as artist
,tr.id as trackid
,tr.name as trackname
,re.id as recordingid
,rel.name as releasename
,rel.release_group
--,rc.country
,rc.date_year
,lab.name as labelname
,area.name as countryname
,wo.id as workid
,wo.name
,coalesce(rm.rating, 0) as rating

from artist_credit ac
join recording re on ac.id  = re.artist_credit
join track tr on re.id = tr.recording

join medium med on tr.medium = med.id
join medium_format mf on med.format = mf.id and mf.id in (1,7)
join release rel on med.release = rel.id
join release_country rc on rel.id = rc.release
join country_area ca on rc.country = ca.area
join area as area on ca.area = ca.area and area.type = 1 
join release_label rl on rel.id = rl.release
join label lab on rl.label = lab.id
join l_recording_work lrw on re.id = lrw.entity0
join work wo on lrw.entity1 = wo.id and wo.type = 17
left join recording_meta rm on lrw.id = rm.id

where ac.id in (825,303)
and area.id in (221,222)
order by 7, 1, 5

--limit 50000


-- stones 825
-- beatles 303