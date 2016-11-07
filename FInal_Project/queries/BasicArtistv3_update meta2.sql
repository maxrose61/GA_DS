-- drop table  allalbums_newmeta

-- drop table allalbums_newmeta2

select distinct
ac.id as artistid
,ac.name as artist
,wo.name as songname
,rel.name as releasename
,wo.id as workid
,re.id as recordingid
,rel.release_group
,coalesce(rgm.first_release_date_year || '-' || rgm.first_release_date_month || '-'  || rgm.first_release_date_day,rc.date_year || '-' || rc.date_month || '-'  || rc.date_day, '1962-01-01') as releasedate
,count(lab.name) as label_cnt
,count(area.name) as country_cnt
,coalesce(rm.rating, rgm.rating, 0) as rating

--,tr.id as trackid
--,tr.name as trackname
--,rc.country
--,rc.date_year
--,coalesce(rc.date_year || '-' || rc.date_month || '-'  || rc.date_day, '1980-01-01') as releasedate
--,rgm.rating as rating -- from releasegroup
--,area.id as countryid

into allalbums_newmeta2

from artist_credit ac
join recording re on ac.id  = re.artist_credit
join track tr on re.id = tr.recording
join medium med on tr.medium = med.id
join medium_format mf on med.format = mf.id and mf.id in (1)  -- 1 = CD, 7 = Vinyl
join release rel on med.release = rel.id
join (select distinct id from  release_group where artist_credit in (825,303) and type in (1,2)) rg on rel.release_group = rg.id
join release_group_meta rgm on rg.id = rgm.id
join release_country rc on rel.id = rc.release
join country_area ca on rc.country = ca.area
join area as area on ca.area = area.id and area.type = 1 
join release_label rl on rel.id = rl.release
join label lab on rl.label = lab.id
join l_recording_work lrw on re.id = lrw.entity0
join work wo on lrw.entity1 = wo.id and wo.type = 17
left join recording_meta rm on lrw.id = rm.id

where ac.id in (825,303)

and rel.status = 1 -- official


group by
ac.id 
,ac.name 
,wo.name 
,rel.name 
,wo.id 
,re.id
,rel.release_group
,coalesce(rgm.first_release_date_year || '-' || rgm.first_release_date_month || '-'  || rgm.first_release_date_day,rc.date_year || '-' || rc.date_month || '-'  || rc.date_day, '1962-01-01') 
,coalesce(rm.rating, rgm.rating, 0) 
order by 1,8,4,3

--limit 5000

--select * from  allalbums  limit 100

-- select * from  allalbums_newmeta   where releasedate > '1950-01-01'    limit 1000

-- select distinct releasedate from  allalbums       limit 100

-- stones 825
-- beatles 303

/*
update allalbums set releasedate = coalesce(releasedate, '1980-01-01')::date

*/

--and area.id in (221,222) us, UK

