local parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(parent.IXPUtils)
local AXPrefetchMarketplaceIXP5 = game:DefineFastFlag("AXPrefetchMarketplaceIXP5", false)
local AXPrefetchMarketplaceIXPEnabledForAll5 = game:DefineFastFlag("AXPrefetchMarketplaceIXPEnabledForAll5", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.PrefetchMarketplace",
	recordExposure = false,
	layer = appUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1)
		return p1.enableMarketplacePrefetch ~= nil
	end,
	getDependentFlagsEnabled = function()
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: AXPrefetchMarketplaceIXP5 (ref)
		return AXPrefetchMarketplaceIXP5
	end,
	getEnabledForAllFlag = function()
		-- upvalues: AXPrefetchMarketplaceIXPEnabledForAll5 (ref)
		return AXPrefetchMarketplaceIXPEnabledForAll5
	end,
	variables = {
		UserIsInExperiment = function(p1, p2)
			return p2 or p1.enableMarketplacePrefetch ~= nil
		end,
		EnabledForUser = function(p1, p2)
			return p2 or (p1.enableMarketplacePrefetch or false)
		end
	}
})