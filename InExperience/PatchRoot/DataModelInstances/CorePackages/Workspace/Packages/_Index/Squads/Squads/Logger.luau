local Parent = script:FindFirstAncestor("Squads").Parent
local FFlagDebugSquadLogsEnabled = require(Parent.SharedFlags).FFlagDebugSquadLogsEnabled
local Squads = require(Parent.Lumberyak).Logger.new(nil, "Squads")
Squads:setContext({ prefix = "[Squads] - " })
Squads:addSink({
	maxLevel = if FFlagDebugSquadLogsEnabled then Squads.Levels.Debug else Squads.Levels.Warning,
	log = function(_, p1, _) --[[ Line: 11 ]]
		print(p1)
	end
})

return Squads