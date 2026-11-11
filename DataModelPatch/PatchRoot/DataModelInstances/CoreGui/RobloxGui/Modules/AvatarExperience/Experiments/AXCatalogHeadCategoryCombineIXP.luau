local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local GetFFlagAXEnableHeadCombineHeadPickerIXPTogetherModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXEnableHeadCombineHeadPickerIXPTogether)
game:DefineFastFlag("AXHeadCategoryCombineEnabled4", false)
game:DefineFastFlag("AXHeadCategoryCombineEnabledForAll4", false)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.Catalog.HeadCategoryCombine",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUACustomizeView,
	getIsUserInExperiment = function(p1): boolean
		return p1.enableHeadCategoryCombination ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: GetFFlagAXEnableHeadCombineHeadPickerIXPTogetherModule (copy)
		return game:GetFastFlag("AXHeadCategoryCombineEnabled4") or GetFFlagAXEnableHeadCombineHeadPickerIXPTogetherModule()
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXHeadCategoryCombineEnabledForAll4")
	end,
	variables = {
		EnableHeadCategoryCombination = function(p1, p2)
			return p2 or (p1.enableHeadCategoryCombination or false)
		end
	}
})