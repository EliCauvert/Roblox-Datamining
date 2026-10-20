local RobloxAppNavigationCore = script:FindFirstAncestor("RobloxAppNavigationCore")
local Parent = RobloxAppNavigationCore.Parent
local CreateNavigatorFunction = require(Parent.RoactNavigation).createNavigator
local _ = require(Parent.Navigation)
local AdaptiveStackViewModule = require(RobloxAppNavigationCore.Views.AdaptiveStackView)
local CreateLuaAppStackRouterModule = require(RobloxAppNavigationCore.Routers.createLuaAppStackRouter)

return function(p1, p2)
	-- upvalues: CreateLuaAppStackRouterModule (copy), CreateNavigatorFunction (copy), AdaptiveStackViewModule (copy)
	return CreateNavigatorFunction(AdaptiveStackViewModule, CreateLuaAppStackRouterModule(p1, p2), p2)
end