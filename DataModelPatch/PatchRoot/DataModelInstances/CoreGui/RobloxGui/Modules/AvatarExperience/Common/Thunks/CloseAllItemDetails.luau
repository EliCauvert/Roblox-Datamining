local AvatarScreen = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CloseMatchingScreensModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Thunks.CloseMatchingScreens)

return function(p1)
	-- upvalues: CloseMatchingScreensModule (copy), AvatarScreen (copy)
	return CloseMatchingScreensModule(p1, { AvatarScreen.ItemDetails })
end