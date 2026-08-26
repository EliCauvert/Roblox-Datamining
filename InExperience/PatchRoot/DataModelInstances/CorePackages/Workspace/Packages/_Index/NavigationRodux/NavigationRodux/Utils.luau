local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local cryoModule = require(parent.Cryo)
local getActiveRoutes = require(parent.Navigation).getActiveRoutes
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(navigationRodux.types)
local constantsModule = require(navigationRodux.Constants)

local function legacyRouteFilter(p1)
	-- upvalues: constantsModule (ref)
	return p1.routeName ~= constantsModule.TempRnSwitchNavigatorName and p1.key ~= "StackRouterRoot"
end

local function getLegacyPageFromRoactNavigationRoute(p1)
	-- upvalues: cryoModule (ref)
	return cryoModule.Dictionary.join(p1.params or {}, { name = p1.routeName, rnKey = p1.key })
end

local function getTabNavigatorState(p1)
	-- upvalues: constantsModule (ref), getTabNavigatorState (ref)
	if p1.routeName == constantsModule.TempRnSwitchNavigatorName then
		return p1
	end
	local index = p1.routes[p1.index]
	
	return if index.routes then getTabNavigatorState(index) else nil
end

return {
	getLegacyPageFromRoactNavigationRoute = getLegacyPageFromRoactNavigationRoute,
	getLegacyRouteFromRoactNavigationState = function(p1)
		-- upvalues: cryoModule (ref), getActiveRoutes (ref), legacyRouteFilter (ref), getLegacyPageFromRoactNavigationRoute (ref)
		return cryoModule.List.map(cryoModule.List.filter(getActiveRoutes(p1), legacyRouteFilter), getLegacyPageFromRoactNavigationRoute)
	end,
	getCurrentTabName = function(p1)
		-- upvalues: constantsModule (ref), getTabNavigatorState (ref), appPage (ref)
		local var1
		if p1.routeName == constantsModule.TempRnSwitchNavigatorName then
			var1 = p1
		else
			local index = p1.routes[p1.index]
			var1 = if index.routes then getTabNavigatorState(index) else nil
		end
		return if var1 == nil then appPage.None else var1.routes[var1.index].routeName
	end
}