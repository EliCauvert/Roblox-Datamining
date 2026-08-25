local parent = script:FindFirstAncestor("RoduxSquads").Parent
local fFlagDebugSquadLogsEnabled = require(parent.SharedFlags).FFlagDebugSquadLogsEnabled
local roduxSquads = require(parent.Lumberyak).Logger.new(nil, "RoduxSquads")
roduxSquads:setContext({ prefix = "[RoduxSquads] - " })
roduxSquads:addSink({
	maxLevel = if fFlagDebugSquadLogsEnabled then roduxSquads.Levels.Debug else roduxSquads.Levels.Warning,
	log = function(_, p0, _)
		print(p0)
	end
})

return roduxSquads