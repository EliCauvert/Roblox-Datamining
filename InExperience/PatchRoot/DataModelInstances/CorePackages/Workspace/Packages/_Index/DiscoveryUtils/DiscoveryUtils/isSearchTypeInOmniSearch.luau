local searchTypes = require(script:FindFirstAncestor("DiscoveryUtils").Parent.RobloxAppEnums).SearchTypes

return function(p1)
	-- upvalues: searchTypes (ref)
	return p1 == searchTypes.Games or p1 == searchTypes.Players or (p1 == searchTypes.Auto or p1 == searchTypes.TopResults)
end