local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local NavigationModule = require(Parent.Navigation)
local AppNavBarModule = require(Parent.AppNavBar)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible

return function(p1, RouteName) --[[ Line: 16 | Named "useManageBuildNavBarVisibility" ]]
	-- upvalues: UseStoreFunction (copy), NavigationModule (copy), AppNavBarModule (copy), ReactModule (copy), SetTabBarVisibleFunction (copy)
	local UseStoreResult = UseStoreFunction()
	local UseNavigationFocusResult = NavigationModule.useNavigationFocus()
	local State = p1.state
	local IsNotUseNavBarPlacementResultMatch: boolean = AppNavBarModule.useNavBarPlacement() ~= AppNavBarModule.Placement.Bottom or State.routes[State.index].routeName == RouteName
	ReactModule.useEffect(function() --[[ Line: 23 ]]
		-- upvalues: UseNavigationFocusResult (copy), UseStoreResult (copy), IsNotUseNavBarPlacementResultMatch (copy), AppNavBarModule (upval), SetTabBarVisibleFunction (upval)
		if UseNavigationFocusResult and UseStoreResult:getState().TabBarVisible ~= IsNotUseNavBarPlacementResultMatch then
			AppNavBarModule.AppNavTelemetry.logVisibilityStart(IsNotUseNavBarPlacementResultMatch)
			UseStoreResult:dispatch(SetTabBarVisibleFunction(IsNotUseNavBarPlacementResultMatch))
		end
	end, {
		UseStoreResult,
		UseNavigationFocusResult,
		IsNotUseNavBarPlacementResultMatch
	})
end