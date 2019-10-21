local isDebug=arg[#arg] == "-debug"
if isDebug then require("mobdebug").start() end

res=require "res.res"
node=require "node"
player_code=require "player"
debug=require "debug"

root_node=node.new("root")
game_node=node.new("game",root_node)
player=player_code.new(game_node)


love.load=function()
end

love.draw=function()
	root_node.draw()
end

love.update=function()
end
