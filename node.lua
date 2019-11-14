-- node is entity
-- todo: перенести в entity, поддержка иерархии (для разных целей, например удаление с дочерними, или зацепить координаты за родителя)

local _={}

_.new=function(name, parent, entity_name)

	
	local children={}
	
	local result
	if entity_name~=nil then
		result=Base_entity.new(entity_name,false)
	else
		-- нода без сущности, ок
		result={}
	end
	
	result.parent=parent
	result.children=children
	
	
	if parent~=nil then
		table.insert(parent.children, result)
	end
	
	
	return result
end


return _