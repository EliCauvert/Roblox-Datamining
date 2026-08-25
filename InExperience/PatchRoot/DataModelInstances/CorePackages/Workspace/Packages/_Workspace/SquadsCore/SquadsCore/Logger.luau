local parent = script:FindFirstAncestor("SquadsCore").Parent
local fFlagDebugSquadLogsEnabled = require(parent.SharedFlags).FFlagDebugSquadLogsEnabled
local squadsCore = require(parent.Lumberyak).Logger.new(nil, "SquadsCore")
squadsCore:setContext({ prefix = "[SquadsCore] - " })
squadsCore:addSink({
	maxLevel = if fFlagDebugSquadLogsEnabled then squadsCore.Levels.Debug else squadsCore.Levels.Warning,
	log = function(_, p0, _)
		print(p0)
	end
})

return squadsCore