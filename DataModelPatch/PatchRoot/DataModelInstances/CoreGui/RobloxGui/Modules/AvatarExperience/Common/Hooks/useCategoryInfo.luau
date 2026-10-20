local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils)
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return function()
	-- upvalues: UseAvatarRouteFunction (copy), ReactModule (copy), UtilsModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	
	return UseSelectorFunction(ReactModule.useCallback(function(p1)
		-- upvalues: UtilsModule (upval), UseAvatarRouteResult (copy)
		return UtilsModule.getCategoryInfoFromState(p1, UseAvatarRouteResult)
	end, { UseAvatarRouteResult }), GetUseSelectorDeepEqualsFunction())
end