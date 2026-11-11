local CorePackages = game:GetService("CorePackages")
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local CreateNavigatorFunction = RoactNavigationModule.createNavigator
local SwitchRouterFunction = RoactNavigationModule.SwitchRouter
local _ = require(CorePackages.Workspace.Packages.Navigation)
local RobloxAppNavigationCoreModule = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore)
local PreloadingSwitchViewModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.PreloadingSwitchView)
local FFlagAXUsePreloadingSwitchView = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUsePreloadingSwitchView

return function(p1, p2)
	-- upvalues: SwitchRouterFunction (copy), CreateNavigatorFunction (copy), FFlagAXUsePreloadingSwitchView (copy), PreloadingSwitchViewModule (copy), RobloxAppNavigationCoreModule (copy)
	return CreateNavigatorFunction(if FFlagAXUsePreloadingSwitchView then PreloadingSwitchViewModule else RobloxAppNavigationCoreModule.AppSwitchView, SwitchRouterFunction(p1, p2), p2)
end