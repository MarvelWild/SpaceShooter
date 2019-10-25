-- точка для поиска коллизий
local _={}
_.entityName="pointer"
_.new=function()
	local result=base_entity.new(_.entityName,true)
	
	return result
end

return _