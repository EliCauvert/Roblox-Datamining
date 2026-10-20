local Parent = script:FindFirstAncestor("SquadsCore").Parent
local FFlagDebugSquadLogsEnabled = require(Parent.SharedFlags).FFlagDebugSquadLogsEnabled
local SquadsCore = require(Parent.Lumberyak).Logger.new(nil, "SquadsCore")
SquadsCore:setContext({ prefix = "[SquadsCore] - " })
SquadsCore:addSink({
	maxLevel = if FFlagDebugSquadLogsEnabled then SquadsCore.Levels.Debug else SquadsCore.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return SquadsCore