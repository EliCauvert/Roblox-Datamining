local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local NavigationUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

return function(p1)
	-- upvalues: ReactModule (copy), UseAvatarRouteFunction (copy), NavigationUtilsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	ReactModule.useEffect(function()
		-- upvalues: NavigationUtilsModule (upval), UseAvatarRouteResult (copy), p1 (copy), UseStateResult2 (copy)
		UseStateResult2((NavigationUtilsModule.isWithinViewContext(UseAvatarRouteResult, p1)))
	end, { UseAvatarRouteResult })
	
	return UseStateResult
end