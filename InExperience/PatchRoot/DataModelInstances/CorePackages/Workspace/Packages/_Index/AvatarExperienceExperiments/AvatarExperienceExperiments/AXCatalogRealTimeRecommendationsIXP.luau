local parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(parent.IXPUtils)
local AXCatalogRealTimeRecommendationsIXPV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPV2", false)
local AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPEnabledForAllV2", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.PerfCatalogRealTimeRecommendations",
	recordExposure = false,
	layer = appUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p0) --[[ line: 26 ]]
		return p0.catalogRealTimeRecommendations ~= nil
	end,
	getDependentFlagsEnabled = function() --[[ line: 30 ]]
		return true
	end,
	getEnabledFlag = function() --[[ line: 34 ]]
		-- upvalues: AXCatalogRealTimeRecommendationsIXPV2 (ref)
		return AXCatalogRealTimeRecommendationsIXPV2
	end,
	getEnabledForAllFlag = function() --[[ line: 38 ]]
		-- upvalues: AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 (ref)
		return AXCatalogRealTimeRecommendationsIXPEnabledForAllV2
	end,
	variables = {
		UserIsInExperiment = function(p1, p2) --[[ line: 43 ]]
			return p2 or p1.catalogRealTimeRecommendations ~= nil
		end,
		EnabledForUser = function(p3, p4) --[[ line: 46 ]]
			return p4 or (p3.catalogRealTimeRecommendations or false)
		end
	}
})