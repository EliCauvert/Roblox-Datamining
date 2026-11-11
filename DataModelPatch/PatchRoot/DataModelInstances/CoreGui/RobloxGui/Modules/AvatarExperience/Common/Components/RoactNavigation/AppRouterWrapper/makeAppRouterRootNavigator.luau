local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarPromptDescriptorsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors)
local MakeAppRouterMainStackNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterMainStackNavigator)

local function buildConfigTable(p1)
	-- upvalues: MakeAppRouterMainStackNavigatorModule (copy), CryoModule (copy), AvatarScreen (copy), AvatarPromptDescriptorsModule (copy)
	return (CryoModule.List.join({
		{
			[AvatarScreen.AvatarExperienceMainStackNavigator] = MakeAppRouterMainStackNavigatorModule(p1)
		}
	}, AvatarPromptDescriptorsModule))
end

return function(p1)
	-- upvalues: buildConfigTable (copy), RoactNavigationModule (copy)
	return (RoactNavigationModule.createRobloxStackNavigator(buildConfigTable(p1), {
		mode = RoactNavigationModule.StackPresentationStyle.Overlay,
		defaultNavigationOptions = {
			absorbInput = false,
			overlayEnabled = true,
			overlayTransparency = 1
		}
	}))
end