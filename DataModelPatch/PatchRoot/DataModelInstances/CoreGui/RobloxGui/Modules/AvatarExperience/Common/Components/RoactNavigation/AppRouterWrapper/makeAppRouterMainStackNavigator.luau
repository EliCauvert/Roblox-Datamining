local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactNavigationModule = require(game:GetService("CorePackages").Packages.RoactNavigation)
local CreateAvatarExperienceStackNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.createAvatarExperienceStackNavigator)
local BuildMainStackConfigTableModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.buildMainStackConfigTable)

return function(p1)
	-- upvalues: BuildMainStackConfigTableModule (copy), CreateAvatarExperienceStackNavigatorModule (copy), RoactNavigationModule (copy)
	return (CreateAvatarExperienceStackNavigatorModule(BuildMainStackConfigTableModule(p1), {
		mode = RoactNavigationModule.StackPresentationStyle.Overlay,
		defaultNavigationOptions = {
			overlayEnabled = true,
			overlayTransparency = 1,
			absorbInput = false,
			renderUnderlyingPage = true
		}
	}))
end