local RobloxAppNavigationCore = script:FindFirstAncestor("RobloxAppNavigationCore")
local Parent = RobloxAppNavigationCore.Parent
local CreateNavigatorFunction = require(Parent.RoactNavigation).createNavigator
local _ = require(Parent.Navigation)
local AdaptiveSwitchViewModule = require(RobloxAppNavigationCore.Views.AdaptiveSwitchView)
local CreateLazySwitchRouterModule = require(RobloxAppNavigationCore.Routers.createLazySwitchRouter)

return function(p1, p2)
	-- upvalues: CreateLazySwitchRouterModule (copy), CreateNavigatorFunction (copy), AdaptiveSwitchViewModule (copy)
	return CreateNavigatorFunction(AdaptiveSwitchViewModule, CreateLazySwitchRouterModule(p1, p2), p2)
end