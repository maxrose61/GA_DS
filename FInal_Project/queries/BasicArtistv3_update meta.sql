-- drop table  allalbums

select distinct
ac.id as artistid
,ac.name as artist
,wo.name as songname
--,tr.id as trackid
--,tr.name as trackname
,re.id as recordingid
,rel.name as releasename
,rel.release_group
--,rc.country
--,rc.date_year
,coalesce(rgm.first_release_date_year || '-' || rgm.first_release_date_month || '-'  || rgm.first_release_date_day, '1950-01-01') as releasedate
--,coalesce(rc.date_year || '-' || rc.date_month || '-'  || rc.date_day, '1980-01-01') as releasedate
,lab.name as labelname
,area.id as countryid
,area.name as countryname
,wo.id as workid
--,rgm.rating as rating -- from releasegroup
,coalesce(rm.rating, rgm.rating, 0) as rating

into allalbums_newmeta

from artist_credit ac
join recording re on ac.id  = re.artist_credit
join track tr on re.id = tr.recording
join medium med on tr.medium = med.id
join medium_format mf on med.format = mf.id and mf.id in (1)  -- 1 = CD, 7 = Vinyl
join release rel on med.release = rel.id
join release_group rg on rel.release_group = rg.id
join release_group_meta rgm on rg.id = rgm.id
--left join release_group_secondary_type_join stj on rg.id = stj.release_group
--join (select id, 
join release_country rc on rel.id = rc.release
join country_area ca on rc.country = ca.area
join area as area on ca.area = ca.area and area.type = 1 
join release_label rl on rel.id = rl.release
join label lab on rl.label = lab.id
join l_recording_work lrw on re.id = lrw.entity0
join work wo on lrw.entity1 = wo.id and wo.type = 17
left join recording_meta rm on lrw.id = rm.id

where ac.id in (825,303)
--and area.id in (221,222)
and rel.status = 1
order by 1,2,4

--limit 5000

--select * from  allalbums  limit 100

-- select * from  allalbums_newmeta   where releasedate > '1950-01-01'    limit 1000

-- select distinct releasedate from  allalbums       limit 100

-- stones 825
-- beatles 303

/*
update allalbums set releasedate = coalesce(releasedate, '1980-01-01')::date

*/



