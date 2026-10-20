local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
game:DefineFastFlag("AXCatalogPerfReduxReductionIXP2", false)
game:DefineFastFlag("AXCatalogPerfReduxReductionIXPEnabledForAll2", false)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarExperience.UA.MarketplaceView.CatalogPerfReduxReduction",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1): boolean
		return p1.reduceCatalogDispatches ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXCatalogPerfReduxReductionIXP2")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXCatalogPerfReduxReductionIXPEnabledForAll2")
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			return p2 or (p1.reduceCatalogDispatches or false)
		end
	}
})