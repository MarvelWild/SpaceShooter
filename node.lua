-- node is entity

local _={}

_.new=function(name, parent, entity_name)

	
	local children={}
	
	local result
	if entity_name~=nil then
		result=base_entity.new(entity_name,false)
	else
		-- нода без сущности, ок
		result={}
	end
	
	result.parent=parent
	result.children=children
	
	local draw=function()
		
		log("drawing node:"..result.name)
		
		-- todo draw self
		-- todo sorting order, delayed draw - сортированный список
		for k,child in pairs(children) do
			
			log("calling children draw:"..child.name)
			
			child:draw()
		end
	end
	
	result.draw=draw
	
	if parent~=nil then
		table.insert(parent.children, result)
	end
	
	
	return result
end


return _