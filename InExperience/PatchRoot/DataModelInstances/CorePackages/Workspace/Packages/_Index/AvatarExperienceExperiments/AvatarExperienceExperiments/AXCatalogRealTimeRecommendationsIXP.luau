local Parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(Parent.IXPUtils)
local AXCatalogRealTimeRecommendationsIXPV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPV2", false)
local AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPEnabledForAllV2", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.PerfCatalogRealTimeRecommendations",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1): boolean
		return p1.catalogRealTimeRecommendations ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: AXCatalogRealTimeRecommendationsIXPV2 (copy)
		return AXCatalogRealTimeRecommendationsIXPV2
	end,
	getEnabledForAllFlag = function()
		-- upvalues: AXCatalogRealTimeRecommendationsIXPEnabledForAllV2 (copy)
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