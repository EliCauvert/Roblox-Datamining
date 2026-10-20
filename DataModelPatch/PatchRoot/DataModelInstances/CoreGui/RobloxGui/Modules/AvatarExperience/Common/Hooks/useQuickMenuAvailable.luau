local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseLastInputMethodFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMethod
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals

return function(): boolean
	-- upvalues: UseAvatarRouteFunction (copy), ReactModule (copy), FullView (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), UseLastInputMethodFunction (copy), IsVRAppBuildFunction (copy)
	local Name = UseAvatarRouteFunction().opaque.name
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p1): boolean
		-- upvalues: Name (copy), FullView (upval)
		return p1.AvatarExperience.Common.FullView[Name] == FullView.SceneFullView
	end, { Name }), GetUseSelectorDeepEqualsFunction())
	local IsGamepad = UseLastInputMethodFunction() == "Gamepad"
	
	return not UseSelectorResult and not IsVRAppBuildFunction() and IsGamepad
end