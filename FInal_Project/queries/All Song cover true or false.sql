-- drop table work_is_cover

select

distinct

aa.workid
,case when comp.workid is null then 1 else 0 end as is_cover

into work_is_cover

from allalbums_newmeta2 aa
left join bs_work_composers comp on aa.workid = comp.workid



--   select * from bs_work_composers