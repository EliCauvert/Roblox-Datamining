local parent = script:FindFirstAncestor("AvatarExperienceExperiments").Parent
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(parent.IXPUtils)
game:DefineFastFlag("AXEnableAccessoryAdjustmentDuringTryOn2", false)
game:DefineFastFlag("AXEnableAccessoryAdjustmentDuringTryOnForAll2", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.EnableAccessoryAdjustmentDuringTryOn2",
	recordExposure = false,
	layer = appUserLayers.AvatarExperienceUAAllViews,
	getIsUserInExperiment = function(p0) --[[ line: 22 ]]
		return p0.enableAccessoryAdjustmentQuickEntryButtonDuringTryOn ~= nil
	end,
	getDependentFlagsEnabled = function() --[[ line: 27 ]]
		return true
	end,
	getEnabledFlag = function() --[[ line: 31 ]]
		return game:GetFastFlag("AXEnableAccessoryAdjustmentDuringTryOn2")
	end,
	getEnabledForAllFlag = function() --[[ line: 35 ]]
		return game:GetFastFlag("AXEnableAccessoryAdjustmentDuringTryOnForAll2")
	end,
	variables = {
		EnabledForUser = function(p1, p2) --[[ line: 40 ]]
			return p2 or (p1.enableAccessoryAdjustmentQuickEntryButtonDuringTryOn or false)
		end
	}
})