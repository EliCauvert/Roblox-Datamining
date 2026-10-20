local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local CryoModule = require(Parent.Cryo)
local GetActiveRoutesFunction = require(Parent.Navigation).getActiveRoutes
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(NavigationRodux.types)
local ConstantsModule = require(NavigationRodux.Constants)

local function legacyRouteFilter(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return p1.routeName ~= ConstantsModule.TempRnSwitchNavigatorName and p1.key ~= "StackRouterRoot"
end

local function getLegacyPageFromRoactNavigationRoute(p1)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p1.params or {}, { name = p1.routeName, rnKey = p1.key })
end

local function getTabNavigatorState(Route)
	-- upvalues: ConstantsModule (copy), getTabNavigatorState (copy)
	if Route.routeName == ConstantsModule.TempRnSwitchNavigatorName then
		return Route
	else
		local Route1 = Route.routes[Route.index]
		
		return if Route1.routes then getTabNavigatorState(Route1) else nil
	end
end

return {
	getLegacyPageFromRoactNavigationRoute = getLegacyPageFromRoactNavigationRoute,
	getLegacyRouteFromRoactNavigationState = function(p1)
		-- upvalues: CryoModule (copy), GetActiveRoutesFunction (copy), legacyRouteFilter (copy), getLegacyPageFromRoactNavigationRoute (copy)
		return CryoModule.List.map(CryoModule.List.filter(GetActiveRoutesFunction(p1), legacyRouteFilter), getLegacyPageFromRoactNavigationRoute)
	end,
	getCurrentTabName = function(p1)
		-- upvalues: ConstantsModule (copy), getTabNavigatorState (copy), AppPage (copy)
		local v1 = nil
		if p1.routeName == ConstantsModule.TempRnSwitchNavigatorName then
			v1 = p1
		else
			local Route = p1.routes[p1.index]
			v1 = if Route.routes then getTabNavigatorState(Route) else nil
		end
		return if v1 == nil then AppPage.None else v1.routes[v1.index].routeName
	end
}