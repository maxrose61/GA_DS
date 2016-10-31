select
a.name
,rg.id as rgid
,rg.name
,rpt.name as releasetype
,relstat.name

--,rel.*



from 


release_group rg
join release_group_primary_type rpt on rg.type = rpt.id
left join release_group_secondary_type_join stj on rg.id = stj.release_group
join release rel on rg.id = rel.release_group
join release_status relstat on rel.status = relstat.id and relstat.id = 1
join medium med on rel.id = med.release and med.format = 1
join l_release_group_work rgw on rg.id = rgw.entity0
--join track tr on 
--join release_group_secondary_type rst on stj.secondary_type = rst.id
join artist a on rg.artist_credit = a.id
where a.id in (825,303)
and rpt.id = 1
and stj.release_group is null





-- select * from l_release_group_work limit 50

