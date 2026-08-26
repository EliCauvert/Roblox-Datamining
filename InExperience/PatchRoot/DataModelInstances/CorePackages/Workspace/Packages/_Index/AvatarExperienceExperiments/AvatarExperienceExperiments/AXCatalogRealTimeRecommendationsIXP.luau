local parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(parent.IXPUtils)
local AXCatalogRealTimeRecommendationsIXPV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPV2", false)
local AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPEnabledForAllV2", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.PerfCatalogRealTimeRecommendations",
	recordExposure = false,
	layer = appUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1)
		return p1.catalogRealTimeRecommendations ~= nil
	end,
	getDependentFlagsEnabled = function()
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: AXCatalogRealTimeRecommendationsIXPV2 (ref)
		return AXCatalogRealTimeRecommendationsIXPV2
	end,
	getEnabledForAllFlag = function()
		-- upvalues: AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 (ref)
		return AXCatalogRealTimeRecommendationsIXPEnabledForAllV2
	end,
	variables = {
		UserIsInExperiment = function(p1, p2)
			return p2 or p1.catalogRealTimeRecommendations ~= nil
		end,
		EnabledForUser = function(p1, p2)
			return p2 or (p1.catalogRealTimeRecommendations or false)
		end
	}
})