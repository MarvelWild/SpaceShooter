local _={}

_.play_music=function(track)
	if track==nil then return end
	track:play()
end


return _