SELECT 
aw.*
,wo.*

--,lt.*


FROM musicbrainz.l_artist_work aw
--join link ln on aw.link = ln.id
join work wo on aw.entity1 = wo.id
--join link_type lt on ln.link_type = lt.id
where wo.name = 'Yer Blues'
--where lt.name = composer
--where entity1 = 825

limit 1000

-- select * from l_recording_work limit 20 

-- select * from artist where id = 2122

-- select * from work where id = 182546