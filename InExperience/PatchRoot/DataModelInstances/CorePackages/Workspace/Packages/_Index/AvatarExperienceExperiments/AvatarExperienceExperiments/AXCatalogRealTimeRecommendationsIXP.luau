local Parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local AXCatalogRealTimeRecommendationsIXPV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPV2", false)
local AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPEnabledForAllV2", false)

return require(Parent.IXPUtils).defineIXPTest({
	name = "AvatarMarketplace.UA.PerfCatalogRealTimeRecommendations",
	recordExposure = false,
	layer = require(Parent.ExperimentLayers).AppUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1): boolean --[[ Line: 26 ]]
		return p1.catalogRealTimeRecommendations ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean --[[ Line: 30 ]]
		return true
	end,
	getEnabledFlag = function() --[[ Line: 34 ]]
		-- upvalues: AXCatalogRealTimeRecommendationsIXPV2 (copy)
		return AXCatalogRealTimeRecommendationsIXPV2
	end,
	getEnabledForAllFlag = function() --[[ Line: 38 ]]
		-- upvalues: AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 (copy)
		return AXCatalogRealTimeRecommendationsIXPEnabledForAllV2
	end,
	variables = {
		UserIsInExperiment = function(p1, p2) --[[ Line: 43 ]]
			return p2 or p1.catalogRealTimeRecommendations ~= nil
		end,
		EnabledForUser = function(p1, p2) --[[ Line: 46 ]]
			return p2 or (p1.catalogRealTimeRecommendations or false)
		end
	}
})