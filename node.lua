local _={}

_.name=nil
_.new=function(name, parent)

	
	local children={}
	local result= {
		name=name,
		parent=parent,
		children=children
	}
	
	local draw=function()
		
		log("drawing node:".._.name)
		
		-- todo draw self
		-- todo sorting order, delayed draw - сортированный список
		for k,child in pairs(children) do
			
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