local Parent = script:FindFirstAncestor("GameInfosRodux").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(Games)
	assert(type(Games) == "table", string.format("AddGames action expects games to be a table, was %s", (type(Games))))
	
	return { games = Games }
end)