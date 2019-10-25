local pathOfThisFile = ...
-- 4 is a length(thisFile) - this file
local folderOfThisFile = string.sub(pathOfThisFile, 0, string.len(pathOfThisFile)-4)

local _={}

local _pow

_.init=function(pow)
	_pow=pow
	
	local initModule=pow.internals.initModule
	
	_.state=require(folderOfThisFile.."/state")
	
	local event=require(folderOfThisFile.."/event")
	initModule(event)
	_.event=event
	
	
	if (_pow.moses.include(_pow.options,"server")) then
		local server=require(folderOfThisFile.."/server")
		initModule(server)
		_.server=server
	end
	
	if (_pow.moses.include(_pow.options,"client")) then
		local client=require(folderOfThisFile.."/client")
		initModule(client)
		_.client=client
	end
end


return _
