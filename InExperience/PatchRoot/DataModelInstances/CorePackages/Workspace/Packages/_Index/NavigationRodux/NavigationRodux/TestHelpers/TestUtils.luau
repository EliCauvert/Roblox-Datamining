local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local navigationModule = require(parent.Navigation)
local getCurrentRouteState = navigationModule.getCurrentRouteState
local roactNavigationModule = require(parent.RoactNavigation)
local actions = roactNavigationModule.Actions
local stackActions = roactNavigationModule.StackActions
local appPage = require(parent.RobloxAppEnums).AppPage
local constantsModule = require(navigationRodux.Constants)
local _ = require(navigationRodux.types)
local getLegacyRouteFromRoactNavigationState = require(navigationRodux.Utils).getLegacyRouteFromRoactNavigationState
local createMockStackState = navigationModule.TestUtils.createMockStackState
local createMockScreenState = navigationModule.TestUtils.createMockScreenState

local function createMockReducerStateFromRouteState(p1)
	-- upvalues: getLegacyRouteFromRoactNavigationState (ref), getCurrentRouteState (ref)
	return {
		lockNavigationActions = false,
		backNavigationDisableCounter = 0,
		history = { getLegacyRouteFromRoactNavigationState(p1) },
		currentRoute = getCurrentRouteState({ state = p1 }),
		roactNavigationState = p1
	}
end

local function createMockRouteStateFromPages(p1)
	-- upvalues: createMockScreenState (ref), createMockStackState (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, createMockScreenState(v.name, v))
	end
	return createMockStackState("StackRouterRoot", t)
end

local function createMockNavigationState(...)
	-- upvalues: createMockRouteStateFromPages (ref), createMockReducerStateFromRouteState (ref)
	local t = {}
	
	for i, v in { ... } do
		table.insert(t, { name = v })
	end
	return createMockReducerStateFromRouteState(createMockRouteStateFromPages(t))
end

local t = {
	[appPage.Home] = true,
	[appPage.Games] = true,
	[appPage.Moments] = true,
	[appPage.AvatarExperienceRoot] = true,
	[appPage.Chat] = true,
	[appPage.More] = true
}

local function navigateToRoute(p2, p3)
	-- upvalues: actions (ref), t (ref), constantsModule (ref), stackActions (ref)
	local t_1 = {}
	
	for i, v in p3 do
		local var1 = if typeof(v) == "string" then { routeName = v } else v
		local var2 = actions.navigate(var1)
		
		if t[var1.routeName] then
			var2 = actions.navigate({
				routeName = constantsModule.TempRnSwitchNavigatorName,
				action = var2,
				key = constantsModule.TempRnSwitchNavigatorName
			})
		end
		table.insert(t_1, var2)
	end
	p2.dispatch(stackActions.reset({ index = #t_1, actions = t_1 }))
end

return {
	createMockReducerStateFromRouteState = createMockReducerStateFromRouteState,
	createMockRouteStateFromPages = createMockRouteStateFromPages,
	createMockNavigationState = createMockNavigationState,
	resetNavigation = function(value, p4)
		-- upvalues: navigateToRoute (ref)
		value.notifyEvents()
		
		if p4 == nil or #p4 == 0 then
			value.dispatch({
				type = "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION"
			})
			
			return
		end
		navigateToRoute(value, p4)
		value.notifyEvents()
	end,
	createMockStackState = createMockStackState,
	createMockSwitchState = navigationModule.TestUtils.createMockSwitchState,
	createMockScreenState = createMockScreenState
}