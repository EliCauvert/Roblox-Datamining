local parent = script:FindFirstAncestor("Squads").Parent
local fFlagDebugSquadLogsEnabled = require(parent.SharedFlags).FFlagDebugSquadLogsEnabled
local squads = require(parent.Lumberyak).Logger.new(nil, "Squads")
squads:setContext({ prefix = "[Squads] - " })
squads:addSink({
	maxLevel = if fFlagDebugSquadLogsEnabled then squads.Levels.Debug else squads.Levels.Warning,
	log = function(_, p0, _) --[[ line: 11 ]]
		print(p0)
	end
})

return squads