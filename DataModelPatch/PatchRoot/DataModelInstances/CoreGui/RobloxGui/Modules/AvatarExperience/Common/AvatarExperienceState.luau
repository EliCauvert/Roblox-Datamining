local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local AvatarExperienceModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Reducers.AvatarExperience)
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen

return {
	mockAvatarExperienceState = function(p1)
		-- upvalues: AvatarExperienceModule (copy), NavigationRoduxModule (copy), AvatarScreen (copy), CryoModule (copy)
		return (CryoModule.Dictionary.join({
			TabBarVisible = false,
			AvatarExperience = AvatarExperienceModule(nil, {}),
			TopBar = { topBarHeight = 0, statusBarHeight = 0 },
			Navigation = NavigationRoduxModule.TestUtils.createMockNavigationState(AvatarScreen.AvatarExperienceRoot),
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 },
			ScreenSize = Vector2.new(1000, 1000),
			FetchingStatus = {}
		}, p1 or {}))
	end
}