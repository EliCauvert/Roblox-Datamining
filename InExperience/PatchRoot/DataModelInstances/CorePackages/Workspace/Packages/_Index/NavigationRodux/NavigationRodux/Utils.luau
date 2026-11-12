local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local CryoModule = require(Parent.Cryo)
local GetActiveRoutesFunction = require(Parent.Navigation).getActiveRoutes
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagAppIaHomeSubTab = require(Parent.SharedFlags).FFlagAppIaHomeSubTab
local _ = require(NavigationRodux.types)
local ConstantsModule = require(NavigationRodux.Constants)

local function legacyRouteFilter(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return p1.routeName ~= ConstantsModule.TempRnSwitchNavigatorName and p1.key ~= "StackRouterRoot"
end

local function getLegacyPageFromRoactNavigationRoute(Route)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(Route.params or {}, { name = Route.routeName, rnKey = Route.key })
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
	getLegacyHistoryFromRoactNavigationState = function(p1)
		-- upvalues: ConstantsModule (copy), FFlagAppIaHomeSubTab (copy), getLegacyPageFromRoactNavigationRoute (copy), CryoModule (copy)
		local JoinResults = {}
		
		for i = 1, p1.index do
			local Route = p1.routes[i]
			
			if Route.routes and Route.routeName == ConstantsModule.TempRnSwitchNavigatorName then
				Route = Route.routes[Route.index]
			end
			if FFlagAppIaHomeSubTab and Route.routes and Route.routeName == ConstantsModule.HomeContainerName then
				Route = Route.routes[Route.index]
			end
			JoinResults[i] = CryoModule.List.join(JoinResults[i - 1] or {}, { (getLegacyPageFromRoactNavigationRoute(Route)) })
		end
		return JoinResults
	end,
	getCurrentTabName = function(p2)
		-- upvalues: ConstantsModule (copy), getTabNavigatorState (copy), AppPage (copy)
		local v1 = nil
		if p2.routeName == ConstantsModule.TempRnSwitchNavigatorName then
			v1 = p2
		else
			local Route = p2.routes[p2.index]
			v1 = if Route.routes then getTabNavigatorState(Route) else nil
		end
		return if v1 == nil then AppPage.None else v1.routes[v1.index].routeName
	end
}