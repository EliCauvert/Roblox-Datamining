local searchTypes = require(script:FindFirstAncestor("DiscoveryUtils").Parent.RobloxAppEnums).SearchTypes

return function(p0)
	-- upvalues: searchTypes (ref)
	return p0 == searchTypes.Games or p0 == searchTypes.Players or (p0 == searchTypes.Auto or p0 == searchTypes.TopResults)
end