SELECT 
aw.*
,wo.*

--,lt.*


FROM l_artist_work aw
--join link ln on aw.link = ln.id
join work wo on aw.entity1 = wo.id
--join link_type lt on ln.link_type = lt.id

where wo.name ~* 'hey bulldog'
--where lt.name = composer
--where entity1 = 825

limit 1000

--  select * from artist where id = 1970

-- select * from l_recording_work limit 20 