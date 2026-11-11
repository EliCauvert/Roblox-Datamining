local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
game:DefineFastFlag("AXShareButtonOnActionBarIXPEnabled", false)
game:DefineFastFlag("AXShareButtonOnActionBarIXPEnabledForAll", false)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.ItemDetails.ShareButtonProfileration",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUAActionBarView,
	getIsUserInExperiment = function(p1): boolean
		return p1.showShareButtonOnActionBar ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXShareButtonOnActionBarIXPEnabled")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXShareButtonOnActionBarIXPEnabledForAll")
	end,
	variables = {
		ShowShareButtonOnActionBar = function(p1, p2)
			-- upvalues: SendAXCounterV2Function (copy), ConstantsModule (copy)
			SendAXCounterV2Function(ConstantsModule.Counter.ShareButtonProfileration.Experiment, {
				variant = if p1.showShareButtonOnActionBar == nil then "nil" elseif p1.showShareButtonOnActionBar then "treatment" else "control"
			})
			
			return p2 or p1.showShareButtonOnActionBar
		end
	}
})