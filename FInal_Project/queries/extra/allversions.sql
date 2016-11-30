-- make temptable allalbums first

select 
rec.id
,alb.artist as sourceartist
,ac.name as recording_artist
,rec.name as recordname
,rec.artist_credit as recartistcredit
,rec.length/1000 as recdur


from recording rec
join artist_credit ac on rec.artist_credit = ac.id 
join (select distinct workid, songname, artist   from allalbums) alb on rec.name = alb.songname
join work wo on alb.workid = wo.id

order by 
rec.name
,rec.artist_credit