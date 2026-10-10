local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local appNavBarModule = require(parent.AppNavBar)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible

return function(p1, p2)
	-- upvalues: useStore (ref), navigationModule (ref), appNavBarModule (ref), reactModule (ref), setTabBarVisible (ref)
	local var1 = useStore()
	local var2 = navigationModule.useNavigationFocus()
	local state = p1.state
	local var3 = if appNavBarModule.useNavBarPlacement() == appNavBarModule.Placement.Bottom then state.routes[state.index].routeName == p2 else true
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), var3 (ref), appNavBarModule (copy), setTabBarVisible (copy)
		if var2 and var1:getState().TabBarVisible ~= var3 then
			appNavBarModule.AppNavTelemetry.logVisibilityStart(var3)
			var1:dispatch(setTabBarVisible(var3))
		end
	end, { var1, var2, var3 })
end