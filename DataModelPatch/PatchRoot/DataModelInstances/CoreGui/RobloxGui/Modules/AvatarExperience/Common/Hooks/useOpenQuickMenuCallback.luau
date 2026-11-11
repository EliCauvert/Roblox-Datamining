local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen

return function(OnOverlayClosed)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), AvatarScreen (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return (ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), OnOverlayClosed (copy)
		if UseNavigationResult then
			UseNavigationResult.navigate(AvatarScreen.AvatarExperienceQuickMenu, { onOverlayClosed = OnOverlayClosed })
		end
	end, { OnOverlayClosed, UseNavigationResult }))
end