
select
ac.id
,ac.name
,pt.name as rgtypename
,rg.name as rgname
--,wo.name


from artist_credit ac
join release_group rg on ac.id = rg.artist_credit
join release_group_primary_type pt on rg.type = pt.id
join 
    (select  
    min(name) as name
    ,min(id) as id
    ,status
    ,release_group
    from release 
    where artist_credit in (303, 825)
    group by release_group,status
    ) rel on rg.id = rel.release_group
join medium med on rel.id = med.release

join l_recording_work lrw on re.id = lrw.entity0
join work wo on lrw.entity1 = wo.id and wo.type = 17

where ac.id in (303, 825)
and rg.type in (1,2,3)
and rel.status = 1  -- oficial only
and med.format in (1,7)
-- select * from release_group_primary_type





