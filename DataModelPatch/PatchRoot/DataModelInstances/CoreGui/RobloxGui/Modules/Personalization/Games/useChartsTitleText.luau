local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)

return function()
	-- upvalues: UseAppPolicyModule (copy), UseLocalizationModule (copy)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1)
		return p1.getGamesPageCreationCenterTitle()
	end)
	local UseLocalizationModuleResult = UseLocalizationModule({
		creationCenter = "CommonUI.Features.Label.CreationCenter",
		chartsTitle = "CommonUI.Features.Label.Charts"
	})
	
	return if UseAppPolicyModuleResult then UseLocalizationModuleResult.creationCenter else UseLocalizationModuleResult.chartsTitle
end