local Parent = script:FindFirstAncestor("RoduxSquads").Parent
local FFlagDebugSquadLogsEnabled = require(Parent.SharedFlags).FFlagDebugSquadLogsEnabled
local RoduxSquads = require(Parent.Lumberyak).Logger.new(nil, "RoduxSquads")
RoduxSquads:setContext({ prefix = "[RoduxSquads] - " })
RoduxSquads:addSink({
	maxLevel = if FFlagDebugSquadLogsEnabled then RoduxSquads.Levels.Debug else RoduxSquads.Levels.Warning,
	log = function(_, p1, _) --[[ Line: 13 ]]
		print(p1)
	end
})

return RoduxSquads