select

w.*
,wt.name as worktype
,wa.id as aliasid
,wa.work_attribute_type
--,wal.*
--,wat.*

from work w 
join work_type wt on w.type = wt.id and w.type = 17
join work_attribute wa on w.id = wa.work


where w.name ~* 'All Together Now'

limit 50

