local Parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local AXPrefetchMarketplaceIXP5 = game:DefineFastFlag("AXPrefetchMarketplaceIXP5", false)
local AXPrefetchMarketplaceIXPEnabledForAll5 = game:DefineFastFlag("AXPrefetchMarketplaceIXPEnabledForAll5", false)

return require(Parent.IXPUtils).defineIXPTest({
	name = "AvatarMarketplace.UA.PrefetchMarketplace",
	recordExposure = false,
	layer = require(Parent.ExperimentLayers).AppUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1): boolean --[[ Line: 24 ]]
		return p1.enableMarketplacePrefetch ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean --[[ Line: 28 ]]
		return true
	end,
	getEnabledFlag = function() --[[ Line: 32 ]]
		-- upvalues: AXPrefetchMarketplaceIXP5 (copy)
		return AXPrefetchMarketplaceIXP5
	end,
	getEnabledForAllFlag = function() --[[ Line: 36 ]]
		-- upvalues: AXPrefetchMarketplaceIXPEnabledForAll5 (copy)
		return AXPrefetchMarketplaceIXPEnabledForAll5
	end,
	variables = {
		UserIsInExperiment = function(p1, p2) --[[ Line: 41 ]]
			return p2 or p1.enableMarketplacePrefetch ~= nil
		end,
		EnabledForUser = function(p1, p2) --[[ Line: 44 ]]
			return p2 or (p1.enableMarketplacePrefetch or false)
		end
	}
})