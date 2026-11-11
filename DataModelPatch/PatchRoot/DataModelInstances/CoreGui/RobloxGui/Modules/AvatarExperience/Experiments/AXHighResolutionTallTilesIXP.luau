local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
game:DefineFastFlag("AXHighResolutionTallTilesEnabled", false)
game:DefineFastFlag("AXHighResolutionTallTilesEnabledForAll", false)
game:DefineFastString("AXHighResolutionTallTilesIXPLayer", AppUserLayers.AvatarExperienceUAMarketplaceView)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.AXHighResolutionTallTiles",
	layer = game:GetFastString("AXHighResolutionTallTilesIXPLayer"),
	getIsUserInExperiment = function(p1): boolean
		return p1.enableHighResolutionTallTiles ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXHighResolutionTallTilesEnabled")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXHighResolutionTallTilesEnabledForAll")
	end,
	variables = {
		EnableHighResolutionTallTiles = function(p1, p2)
			return p2 or (p1.enableHighResolutionTallTiles or false)
		end
	}
})