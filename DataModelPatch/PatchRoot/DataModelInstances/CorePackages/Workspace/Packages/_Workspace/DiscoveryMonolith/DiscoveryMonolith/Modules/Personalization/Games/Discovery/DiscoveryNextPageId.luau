local SetDiscoveryNextPageIdModule = require(script:FindFirstAncestor("DiscoveryMonolith").Modules.Personalization.Games.Discovery.SetDiscoveryNextPageId)

return function(p1, p2)
	-- upvalues: SetDiscoveryNextPageIdModule (copy)
	return if p2.type == SetDiscoveryNextPageIdModule.name then p2.nextPageId else p1 or ""
end