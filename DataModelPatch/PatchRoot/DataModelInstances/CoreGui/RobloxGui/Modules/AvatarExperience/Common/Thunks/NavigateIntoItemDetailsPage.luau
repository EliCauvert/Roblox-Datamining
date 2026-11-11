local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local NavigationUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

return function(p1, p2)
	-- upvalues: NavigationUtilsModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy)
	return function(p3)
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval), p2 (copy), NavigateWithLockFunction (upval)
		p3:dispatch(NavigateWithLockFunction(function()
			-- upvalues: NavigationUtilsModule (upval), p1 (upval), AvatarScreen (upval), p2 (upval)
			NavigationUtilsModule.closeFiltersAndItemDetails(p1)
			NavigationUtilsModule.closeTryOnManager(p1)
			p1.navigate(AvatarScreen.ItemDetails, p2)
		end))
	end
end