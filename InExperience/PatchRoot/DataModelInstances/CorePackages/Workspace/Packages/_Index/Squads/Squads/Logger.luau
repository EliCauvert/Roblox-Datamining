local parent = script:FindFirstAncestor("Squads").Parent
local fFlagDebugSquadLogsEnabled = require(parent.SharedFlags).FFlagDebugSquadLogsEnabled
local squads = require(parent.Lumberyak).Logger.new(nil, "Squads")
squads:setContext({ prefix = "[Squads] - " })
squads:addSink({
	maxLevel = if fFlagDebugSquadLogsEnabled then squads.Levels.Debug else squads.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return squads