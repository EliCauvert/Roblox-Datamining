local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
game:DefineFastFlag("AXItemDetails3DPreviewEnabled", false)
game:DefineFastFlag("AXItemDetails3DPreviewEnabledForAll", false)
game:DefineFastString("AXItemDetails3DPreviewIXPLayer", AppUserLayers.AvatarExperienceUAItemDetailsView)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.AXItemDetails3DPreview",
	recordExposure = false,
	layer = game:GetFastString("AXItemDetails3DPreviewIXPLayer"),
	getIsUserInExperiment = function(p1): boolean
		return p1.enableItemDetails3DPreview ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXItemDetails3DPreviewEnabled")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXItemDetails3DPreviewEnabledForAll")
	end,
	variables = {
		EnableItemDetails3DPreview = function(p1, p2)
			return p2 or (p1.enableItemDetails3DPreview or false)
		end
	}
})