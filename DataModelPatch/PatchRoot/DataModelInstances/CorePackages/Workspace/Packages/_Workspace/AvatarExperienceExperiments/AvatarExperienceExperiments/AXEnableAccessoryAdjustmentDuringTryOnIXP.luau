local Parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(Parent.IXPUtils)
game:DefineFastFlag("AXEnableAccessoryAdjustmentDuringTryOn2", false)
game:DefineFastFlag("AXEnableAccessoryAdjustmentDuringTryOnForAll2", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.EnableAccessoryAdjustmentDuringTryOn2",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUAAllViews,
	getIsUserInExperiment = function(p1): boolean
		return p1.enableAccessoryAdjustmentQuickEntryButtonDuringTryOn ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXEnableAccessoryAdjustmentDuringTryOn2")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXEnableAccessoryAdjustmentDuringTryOnForAll2")
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			return p2 or (p1.enableAccessoryAdjustmentQuickEntryButtonDuringTryOn or false)
		end
	}
})