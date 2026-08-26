local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "table", string.format("AddGames action expects games to be a table, was %s", type(p1)))
	
	return { games = p1 }
end)