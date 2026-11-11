local Parent = script:FindFirstAncestor("MultiPageSignup").Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local _ = require(Parent.Navigation)
local _ = require(Parent.UserActivationFramework)

return function(p1, InitialRouteName, p2)
	-- upvalues: RoactNavigationModule (copy)
	return if p2 then RoactNavigationModule.createRobloxStackNavigator(p1, {
		keepVisitedScreensMounted = true,
		renderUnderlyingPage = true,
		initialRouteName = InitialRouteName,
		defaultNavigationOptions = { overlayTransparency = 1 },
		mode = RoactNavigationModule.StackPresentationStyle.Default,
		backBehavior = RoactNavigationModule.BackBehavior.History
	}) else RoactNavigationModule.createRobloxSwitchNavigator(p1, {
		keepVisitedScreensMounted = true,
		initialRouteName = InitialRouteName,
		backBehavior = RoactNavigationModule.BackBehavior.History
	})
end