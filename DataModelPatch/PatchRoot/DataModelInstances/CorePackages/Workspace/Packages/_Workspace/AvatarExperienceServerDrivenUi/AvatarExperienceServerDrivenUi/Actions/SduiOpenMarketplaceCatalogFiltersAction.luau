local Parent = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigationModule = require(Parent.Navigation)
local GetCurrentRouteStateFunction = NavigationModule.getCurrentRouteState
local GetRootNavigationFunction = NavigationModule.getRootNavigation
local RoactNavigationModule = require(Parent.RoactNavigation)
local _ = require(Parent.SduiCoreSystem)

return function(_, _, p1, _)
	-- upvalues: GetCurrentRouteStateFunction (copy), GetRootNavigationFunction (copy), AvatarScreen (copy), RoactNavigationModule (copy)
	local Navigation = p1.dependencies.getNavigation()
	local CurrentRouteState = GetCurrentRouteStateFunction(GetRootNavigationFunction(Navigation))
	
	if CurrentRouteState and CurrentRouteState.routeName == AvatarScreen.SortAndFilters then
		Navigation.dispatch(RoactNavigationModule.Actions.back(nil))
		
		return
	else
		Navigation.navigate(AvatarScreen.SortAndFilters, {})
	end
end