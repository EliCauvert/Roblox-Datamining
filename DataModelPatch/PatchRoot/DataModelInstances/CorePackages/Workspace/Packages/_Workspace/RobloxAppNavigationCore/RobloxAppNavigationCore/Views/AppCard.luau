local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local ReactModule = require(Parent.React)
local SceneView = require(Parent.RoactNavigation).SceneView
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local NavigationModule = require(Parent.Navigation)
local UseEarlyIsFocusedFunction = NavigationModule.useEarlyIsFocused
local GetCurrentRouteKeyFunction = NavigationModule.getCurrentRouteKey
local GetRouteKeyIsInNavigationStateFunction = NavigationModule.getRouteKeyIsInNavigationState
local ReactProfiler = require(Parent.RoactUtils).Profiling.ReactProfiler
local FFlagLuaAppEnablePageLoadTracker = require(Parent.SharedFlags).FFlagLuaAppEnablePageLoadTracker
local FFlagAXMigrateAXToGlobalAutofocus = require(Parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local ComponentTracker = require(Parent.PageLoadTracker).ComponentTracker
local FFlagLuaAppsDefaultSelection = require(Parent.SharedFlags).FFlagLuaAppsDefaultSelection
local Context = ReactModule.createContext({})

local function _(p1, p2)
	-- upvalues: GetCurrentRouteKeyFunction (copy), GetRouteKeyIsInNavigationStateFunction (copy)
	local CurrentRouteKey = GetCurrentRouteKeyFunction(p1)
	
	return if p2.options.hasSubNavigation and CurrentRouteKey ~= nil then GetRouteKeyIsInNavigationStateFunction(CurrentRouteKey, p2.state) else CurrentRouteKey == p2.key
end

return function(p1)
	-- upvalues: UseEarlyIsFocusedFunction (copy), GetCurrentRouteKeyFunction (copy), GetRouteKeyIsInNavigationStateFunction (copy), FFlagLuaAppsDefaultSelection (copy), ReactModule (copy), ReactProfiler (copy), Context (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigationUtilsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagLuaAppEnablePageLoadTracker (copy), ComponentTracker (copy), SceneView (copy)
	local Descriptor = p1.descriptor
	local Navigation = Descriptor.navigation
	local IsActive = UseEarlyIsFocusedFunction() and p1.isActive
	local CurrentRouteKey = GetCurrentRouteKeyFunction(Navigation)
	local RouteKeyIsInNavigationState = if Descriptor.options.hasSubNavigation and CurrentRouteKey ~= nil then GetRouteKeyIsInNavigationStateFunction(CurrentRouteKey, Descriptor.state) else CurrentRouteKey == Descriptor.key
	local RouteName = Navigation.state.routeName or "UnknownRoute"
	
	return ReactModule.createElement(ReactProfiler, { id = RouteName }, {
		DescriptorContext = ReactModule.createElement(Context.Provider, { value = p1.descriptor }, {
			FocusRoot = ReactModule.createElement(FocusNavigableSurfaceWrapper, {
				isFocusable = IsActive and RouteKeyIsInNavigationState,
				surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.RouterView,
				shouldRestoreFocus = not FFlagLuaAppsDefaultSelection or (if FFlagLuaAppsDefaultSelection then IsActive and RouteKeyIsInNavigationState else nil),
				frameProps = {
					Interactable = true,
					SelectionGroup = if FFlagAXMigrateAXToGlobalAutofocus then p1.descriptor.options.hasSelectionGroup else nil,
					Visible = p1.isVisible,
					ZIndex = p1.ZIndex
				}
			}, if FFlagLuaAppEnablePageLoadTracker then {
				ComponentTracker = ReactModule.createElement(ComponentTracker, {
					componentName = `Page-{RouteName}`,
					isActive = p1.isActive
				}, {
					SceneView = ReactModule.createElement(SceneView, {
						navigation = Navigation,
						component = Descriptor.getComponent(),
						screenProps = p1.screenProps
					})
				})
			} else {
				SceneView = ReactModule.createElement(SceneView, {
					navigation = Navigation,
					component = Descriptor.getComponent(),
					screenProps = p1.screenProps
				})
			})
		})
	})
end