local parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(parent.IXPUtils)
local AXPrefetchMarketplaceIXP5 = game:DefineFastFlag("AXPrefetchMarketplaceIXP5", false)
local AXPrefetchMarketplaceIXPEnabledForAll5 = game:DefineFastFlag("AXPrefetchMarketplaceIXPEnabledForAll5", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.PrefetchMarketplace",
	recordExposure = false,
	layer = appUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p0) --[[ line: 24 ]]
		return p0.enableMarketplacePrefetch ~= nil
	end,
	getDependentFlagsEnabled = function() --[[ line: 28 ]]
		return true
	end,
	getEnabledFlag = function() --[[ line: 32 ]]
		-- upvalues: AXPrefetchMarketplaceIXP5 (ref)
		return AXPrefetchMarketplaceIXP5
	end,
	getEnabledForAllFlag = function() --[[ line: 36 ]]
		-- upvalues: AXPrefetchMarketplaceIXPEnabledForAll5 (ref)
		return AXPrefetchMarketplaceIXPEnabledForAll5
	end,
	variables = {
		UserIsInExperiment = function(p1, p2) --[[ line: 41 ]]
			return p2 or p1.enableMarketplacePrefetch ~= nil
		end,
		EnabledForUser = function(p3, p4) --[[ line: 44 ]]
			return p4 or (p3.enableMarketplacePrefetch or false)
		end
	}
})