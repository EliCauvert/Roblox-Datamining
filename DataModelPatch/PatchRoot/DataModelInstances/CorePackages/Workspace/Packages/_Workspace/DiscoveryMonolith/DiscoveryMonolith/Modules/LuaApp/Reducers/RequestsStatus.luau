local Modules = script:FindFirstAncestor("DiscoveryMonolith").Modules
local OmniRecommendationsMetadataRetrievalStatusModule = require(Modules.LuaApp.Reducers.OmniRecommendationsMetadataRetrievalStatus)
local SearchesInGamesStatusModule = require(Modules.LuaApp.Reducers.SearchesInGamesStatus)

return function(p1, p2)
	-- upvalues: SearchesInGamesStatusModule (copy), OmniRecommendationsMetadataRetrievalStatusModule (copy)
	local P0 = p1 or {}
	
	return {
		SearchesInGamesStatus = SearchesInGamesStatusModule(P0.SearchesInGamesStatus, p2),
		OmniRecommendationsMetadataRetrievalStatus = OmniRecommendationsMetadataRetrievalStatusModule(P0.OmniRecommendationsMetadataRetrievalStatus, p2)
	}
end