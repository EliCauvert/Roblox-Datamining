local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0)
	assert(type(p0) == "table", string.format("AddGames action expects games to be a table, was %s", type(p0)))
	
	return { games = p0 }
end)