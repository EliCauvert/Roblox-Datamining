local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SelectHasModerationAlertModule = require(Modules.AvatarExperience.Common.Selectors.selectHasModerationAlert)
local SelectHasNoSharedAvatarsOnMySharedAvatarsModule = require(Modules.AvatarExperience.Common.Selectors.selectHasNoSharedAvatarsOnMySharedAvatars)
local WidgetListModerationAlertModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Components.WidgetListModerationAlert)
local NoSharedAvatarsModule = require(Modules.AvatarExperience.AvatarEditor.Components.MySharedAvatars.NoSharedAvatars)
local TurnOffModerationAlert = game:DefineFastFlag("TurnOffModerationAlert", false)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return function(_)
	-- upvalues: UseAvatarRouteFunction (copy), UseSelectorFunction (copy), TurnOffModerationAlert (copy), SelectHasModerationAlertModule (copy), GetUseSelectorDeepEqualsFunction (copy), SelectHasNoSharedAvatarsOnMySharedAvatarsModule (copy), AvatarScreen (copy), ReactModule (copy), WidgetListModerationAlertModule (copy), NoSharedAvatarsModule (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: TurnOffModerationAlert (upval), SelectHasModerationAlertModule (upval), UseAvatarRouteResult (copy)
		return not TurnOffModerationAlert and SelectHasModerationAlertModule(p1, UseAvatarRouteResult)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: SelectHasNoSharedAvatarsOnMySharedAvatarsModule (upval), UseAvatarRouteResult (copy)
		return SelectHasNoSharedAvatarsOnMySharedAvatarsModule(p1, UseAvatarRouteResult)
	end, GetUseSelectorDeepEqualsFunction())
	
	if UseAvatarRouteResult and UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name == AvatarScreen.MySharedAvatars then
		if UseSelectorResult then
			return ReactModule.createElement(WidgetListModerationAlertModule)
		elseif UseSelectorResult1 then
			return ReactModule.createElement(NoSharedAvatarsModule)
		end
	end
	return nil
end