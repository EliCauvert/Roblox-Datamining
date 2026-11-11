local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local SystemMenuTopBarModule = require(AppChat.Components.TopBar.SystemMenuTopBar)
local ConfigureTopBarWithNavigationOptionsModule = require(AppChat.configureTopBarWithNavigationOptions)
local IsolatedAutoFocusNavigationModule = require(AppChat.Navigators.isolatedAutoFocusNavigation)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)

local function getActiveRouteName(Navigation)
	local State = Navigation and Navigation.state
	local Route = nil
	
	if not State or not State.routes or not State.index then
		return nil
	end
	while State and State.routes and State.index do
		Route = State.routes[State.index]
		
		if not Route then break end
		if not Route.routes or not Route.index then
			return Route.routeName
		end
		State = Route
	end
	return nil
end

local function _(p1)
	-- upvalues: ResponsiveModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), getActiveRouteName (copy), EnumScreensModule (copy), ReactModule (copy), SystemMenuTopBarModule (copy), ConfigureTopBarWithNavigationOptionsModule (copy), FoundationModule (copy)
	return function(p2)
		-- upvalues: ResponsiveModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), getActiveRouteName (upval), EnumScreensModule (upval), ReactModule (upval), SystemMenuTopBarModule (upval), ConfigureTopBarWithNavigationOptionsModule (upval), FoundationModule (upval), p1 (copy)
		local UseBreakpointYOrSmallerResult = ResponsiveModule.useBreakpointYOrSmaller(ResponsiveModule.Keys.Small)
		local _UDim2 = UDim2.new(1, if ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small) then -24 else -360, 1, if UseBreakpointYOrSmallerResult then -24 else -72)
		local Element = nil
		
		if FFlagAppChatTopBarConfigDrivenModule() then
			if FFlagAppChatPerfTrackingModule then
				AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local ScreenName = getActiveRouteName(p2.navigation)
			
			if ScreenName == EnumScreensModule.CreateNewChat or ScreenName == EnumScreensModule.EditChatMembers or ScreenName == EnumScreensModule.QuickStartSquadInviteFriends then
				Element = ReactModule.createElement(SystemMenuTopBarModule, { screenName = ScreenName, navigation = p2.navigation })
			end
		end
		if not Element then
			Element = ConfigureTopBarWithNavigationOptionsModule(p2.navigation)
		end
		return ReactModule.createElement(FoundationModule.View, {
			tag = "col position-center-center anchor-center-center clip bg-surface-0 radius-large",
			Size = _UDim2
		}, {
			sizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			topBar = Element,
			overlayContent = ReactModule.createElement(p1, p2)
		})
	end
end

return function(p1)
	-- upvalues: RoactNavigationModule (copy), ReactModule (copy), IsolatedAutoFocusNavigationModule (copy), ResponsiveModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), getActiveRouteName (copy), EnumScreensModule (copy), SystemMenuTopBarModule (copy), ConfigureTopBarWithNavigationOptionsModule (copy), FoundationModule (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local RobloxStackNavigator = RoactNavigationModule.createRobloxStackNavigator(p1, { defaultNavigationOptions = { isDialog = true } })
	local OverlayNavigatorConnector = ReactModule.PureComponent:extend("OverlayNavigatorConnector")
	OverlayNavigatorConnector.router = RobloxStackNavigator.router
	local IsolatedAutoFocusNavigationModuleResult = IsolatedAutoFocusNavigationModule(function(p2)
		-- upvalues: ResponsiveModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), getActiveRouteName (upval), EnumScreensModule (upval), ReactModule (upval), SystemMenuTopBarModule (upval), ConfigureTopBarWithNavigationOptionsModule (upval), FoundationModule (upval), RobloxStackNavigator (copy)
		local UseBreakpointYOrSmallerResult = ResponsiveModule.useBreakpointYOrSmaller(ResponsiveModule.Keys.Small)
		local _UDim2 = UDim2.new(1, if ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small) then -24 else -360, 1, if UseBreakpointYOrSmallerResult then -24 else -72)
		local Element = nil
		
		if FFlagAppChatTopBarConfigDrivenModule() then
			if FFlagAppChatPerfTrackingModule then
				AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local ScreenName = getActiveRouteName(p2.navigation)
			
			if ScreenName == EnumScreensModule.CreateNewChat or ScreenName == EnumScreensModule.EditChatMembers or ScreenName == EnumScreensModule.QuickStartSquadInviteFriends then
				Element = ReactModule.createElement(SystemMenuTopBarModule, { screenName = ScreenName, navigation = p2.navigation })
			end
		end
		if not Element then
			Element = ConfigureTopBarWithNavigationOptionsModule(p2.navigation)
		end
		return ReactModule.createElement(FoundationModule.View, {
			tag = "col position-center-center anchor-center-center clip bg-surface-0 radius-large",
			Size = _UDim2
		}, {
			sizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			topBar = Element,
			overlayContent = ReactModule.createElement(RobloxStackNavigator, p2)
		})
	end, FocusNavigableSurfaceIdentifierEnum.PopUp)
	
	function OverlayNavigatorConnector.render(p2)
		-- upvalues: ReactModule (upval), IsolatedAutoFocusNavigationModuleResult (copy)
		return ReactModule.createElement(IsolatedAutoFocusNavigationModuleResult, p2.props)
	end
	
	return OverlayNavigatorConnector
end