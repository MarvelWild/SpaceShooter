-- точка для поиска коллизий
local _={}
_.entity_name="pointer"

_.new=function()
	local result=_.pow.baseEntity.new(_.entity_name,nil,{is_service=true})
	
	return result
end

return _