local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local cryoModule = require(parent.Cryo)
local getActiveRoutes = require(parent.Navigation).getActiveRoutes
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(navigationRodux.types)
local constantsModule = require(navigationRodux.Constants)

local function legacyRouteFilter(p0)
	-- upvalues: constantsModule (ref)
	return p0.routeName ~= constantsModule.TempRnSwitchNavigatorName and p0.key ~= "StackRouterRoot"
end

local function getLegacyPageFromRoactNavigationRoute(p1)
	-- upvalues: cryoModule (ref)
	return cryoModule.Dictionary.join(p1.params or {}, { name = p1.routeName, rnKey = p1.key })
end

local function getTabNavigatorState(p2)
	-- upvalues: constantsModule (ref), getTabNavigatorState (ref)
	if p2.routeName == constantsModule.TempRnSwitchNavigatorName then
		return p2
	end
	local index = p2.routes[p2.index]
	
	return if index.routes then getTabNavigatorState(index) else nil
end

return {
	getLegacyPageFromRoactNavigationRoute = getLegacyPageFromRoactNavigationRoute,
	getLegacyRouteFromRoactNavigationState = function(p3)
		-- upvalues: cryoModule (ref), getActiveRoutes (ref), legacyRouteFilter (ref), getLegacyPageFromRoactNavigationRoute (ref)
		return cryoModule.List.map(cryoModule.List.filter(getActiveRoutes(p3), legacyRouteFilter), getLegacyPageFromRoactNavigationRoute)
	end,
	getCurrentTabName = function(p4)
		-- upvalues: constantsModule (ref), getTabNavigatorState (ref), appPage (ref)
		local var6
		if p4.routeName == constantsModule.TempRnSwitchNavigatorName then
			var6 = p4
		else
			local index = p4.routes[p4.index]
			var6 = if index.routes then getTabNavigatorState(index) else nil
		end
		return if var6 == nil then appPage.None else var6.routes[var6.index].routeName
	end
}