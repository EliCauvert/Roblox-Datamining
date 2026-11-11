local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local _ = require(Parent.Navigation)
local CurrentTabContext = require(Parent.RobloxAppNavigation).CurrentTabContext
local CreateAdaptiveSwitchNavigatorModule = require(script.Parent.createAdaptiveSwitchNavigator)

return function(p1)
	-- upvalues: CreateAdaptiveSwitchNavigatorModule (copy), RoactNavigationModule (copy), ReactModule (copy), CurrentTabContext (copy)
	local AdaptiveSwitchNavigatorModule = CreateAdaptiveSwitchNavigatorModule(p1, {
		keepVisitedScreensMounted = true,
		resetOnBlur = false,
		backBehavior = RoactNavigationModule.BackBehavior.InitialRoute
	})
	local SwitchNavigatorWrapper = ReactModule.Component:extend("SwitchNavigatorWrapper")
	SwitchNavigatorWrapper.router = AdaptiveSwitchNavigatorModule.router
	
	function SwitchNavigatorWrapper.render(p2)
		-- upvalues: ReactModule (upval), CurrentTabContext (upval), AdaptiveSwitchNavigatorModule (copy)
		local State = p2.props.navigation.state
		
		return ReactModule.createElement(CurrentTabContext.Provider, { value = State.routes[State.index].routeName }, {
			Navigator = ReactModule.createElement(AdaptiveSwitchNavigatorModule, p2.props)
		})
	end
	
	return SwitchNavigatorWrapper
end