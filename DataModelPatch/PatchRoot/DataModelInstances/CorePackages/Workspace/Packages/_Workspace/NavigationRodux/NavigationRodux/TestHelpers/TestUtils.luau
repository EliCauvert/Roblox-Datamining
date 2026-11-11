local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local NavigationModule = require(Parent.Navigation)
local GetCurrentRouteStateFunction = NavigationModule.getCurrentRouteState
local RoactNavigationModule = require(Parent.RoactNavigation)
local Actions = RoactNavigationModule.Actions
local StackActions = RoactNavigationModule.StackActions
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ConstantsModule = require(NavigationRodux.Constants)
local _ = require(NavigationRodux.types)
local GetLegacyRouteFromRoactNavigationStateFunction = require(NavigationRodux.Utils).getLegacyRouteFromRoactNavigationState
local CreateMockStackStateFunction = NavigationModule.TestUtils.createMockStackState
local CreateMockScreenStateFunction = NavigationModule.TestUtils.createMockScreenState

local function createMockReducerStateFromRouteState(RoactNavigationState)
	-- upvalues: GetLegacyRouteFromRoactNavigationStateFunction (copy), GetCurrentRouteStateFunction (copy)
	return {
		lockNavigationActions = false,
		backNavigationDisableCounter = 0,
		history = {
			(GetLegacyRouteFromRoactNavigationStateFunction(RoactNavigationState))
		},
		currentRoute = GetCurrentRouteStateFunction({ state = RoactNavigationState }),
		roactNavigationState = RoactNavigationState
	}
end

local function createMockRouteStateFromPages(List)
	-- upvalues: CreateMockScreenStateFunction (copy), CreateMockStackStateFunction (copy)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, CreateMockScreenStateFunction(value.name, value))
	end
	return CreateMockStackStateFunction("StackRouterRoot", List1)
end

local config = {
	[AppPage.Home] = true,
	[AppPage.Games] = true,
	[AppPage.Moments] = true,
	[AppPage.AvatarExperienceRoot] = true,
	[AppPage.Chat] = true,
	[AppPage.More] = true
}

local function navigateToRoute(p1, List)
	-- upvalues: Actions (copy), config (copy), ConstantsModule (copy), StackActions (copy)
	local Actions1 = {}
	
	for _, RouteName in List do
		local Config = if typeof(RouteName) == "string" then { routeName = RouteName } else RouteName
		local NavigateResult = Actions.navigate(Config)
		
		if config[Config.routeName] then
			NavigateResult = Actions.navigate({
				routeName = ConstantsModule.TempRnSwitchNavigatorName,
				action = NavigateResult,
				key = ConstantsModule.TempRnSwitchNavigatorName
			})
		end
		table.insert(Actions1, NavigateResult)
	end
	p1.dispatch(StackActions.reset({ index = #Actions1, actions = Actions1 }))
end

return {
	createMockReducerStateFromRouteState = createMockReducerStateFromRouteState,
	createMockRouteStateFromPages = createMockRouteStateFromPages,
	createMockNavigationState = function(...)
		-- upvalues: createMockRouteStateFromPages (copy), createMockReducerStateFromRouteState (copy)
		local List = {}
		
		for _, Name in { ... } do
			table.insert(List, { name = Name })
		end
		return (createMockReducerStateFromRouteState((createMockRouteStateFromPages(List))))
	end,
	resetNavigation = function(p2, p3)
		-- upvalues: navigateToRoute (copy)
		p2.notifyEvents()
		
		if p3 == nil or #p3 == 0 then
			p2.dispatch({
				type = "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION"
			})
			
			return
		else
			navigateToRoute(p2, p3)
			p2.notifyEvents()
		end
	end,
	createMockStackState = CreateMockStackStateFunction,
	createMockSwitchState = NavigationModule.TestUtils.createMockSwitchState,
	createMockScreenState = CreateMockScreenStateFunction
}