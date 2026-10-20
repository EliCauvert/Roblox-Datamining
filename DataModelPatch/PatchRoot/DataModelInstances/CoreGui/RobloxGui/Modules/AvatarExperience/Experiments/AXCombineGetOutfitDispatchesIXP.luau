local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
game:DefineFastFlag("AXCombineGetOutfitDispatchesIXP3", false)
game:DefineFastFlag("AXCombineGetOutfitDispatchesIXPForAll3", false)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.CombineGetOutfitDispatches",
	recordExposure = false,
	layer = game:DefineFastString("AXCombineGetOutfitDispatchesIXPLayer3", AppUserLayers.AvatarExperienceUACustomizeView),
	getIsUserInExperiment = function(p1): boolean
		return p1.combineGetOutfitDispatches ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXCombineGetOutfitDispatchesIXP3")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXCombineGetOutfitDispatchesIXPForAll3")
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			return p2 or (p1.combineGetOutfitDispatches or false)
		end
	}
})