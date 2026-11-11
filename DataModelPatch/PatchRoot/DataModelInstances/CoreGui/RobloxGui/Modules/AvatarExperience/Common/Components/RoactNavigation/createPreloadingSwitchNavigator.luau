local RoactNavigationModule = require(game:GetService("CorePackages").Packages.RoactNavigation)
local CreateNavigatorFunction = RoactNavigationModule.createNavigator
local SwitchRouterFunction = RoactNavigationModule.SwitchRouter
local PreloadingSwitchViewModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.PreloadingSwitchView)

return function(p1, p2)
	-- upvalues: SwitchRouterFunction (copy), CreateNavigatorFunction (copy), PreloadingSwitchViewModule (copy)
	return CreateNavigatorFunction(PreloadingSwitchViewModule, SwitchRouterFunction(p1, p2), p2 or {})
end