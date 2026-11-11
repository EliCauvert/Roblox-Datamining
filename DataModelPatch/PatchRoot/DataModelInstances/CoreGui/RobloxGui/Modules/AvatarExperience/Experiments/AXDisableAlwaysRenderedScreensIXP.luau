local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
game:DefineFastFlag("AXDisableAlwaysRenderedScreensIXP2", false)
game:DefineFastFlag("AXDisableAlwaysRenderedScreensIXPEnabledForAll2", false)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.All.DisableAlwaysRenderedScreens",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1): boolean
		return p1.disableAlwaysRenderedScreens ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXDisableAlwaysRenderedScreensIXP2")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXDisableAlwaysRenderedScreensIXPEnabledForAll2")
	end,
	variables = {
		DisableAlwaysRenderedScreen = function(p1, p2)
			return p2 or (p1.disableAlwaysRenderedScreens or false)
		end
	}
})