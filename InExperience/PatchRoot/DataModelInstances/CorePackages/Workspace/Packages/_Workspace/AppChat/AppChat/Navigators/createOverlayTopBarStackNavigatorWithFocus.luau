local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local focusNavigableSurfaceIdentifierEnum = require(parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local enumScreensModule = require(appChat.EnumScreens)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local systemMenuTopBarModule = require(appChat.Components.TopBar.SystemMenuTopBar)
local configureTopBarWithNavigationOptionsModule = require(appChat.configureTopBarWithNavigationOptions)
local isolatedAutoFocusNavigationModule = require(appChat.Navigators.isolatedAutoFocusNavigation)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)

local function getActiveRouteName(p0) --[[ line: 25 ]]
	local index
	local state = p0 and p0.state
	
	if not state or not state.routes or not state.index then
		return nil
	end
	while state and state.routes and state.index do
		index = state.routes[state.index]
		
		if not index then break end
		if not index.routes or not index.index then
			return index.routeName
		end
		state = index
	end
	return nil
end

local function _(p1) --[[ line: 52 | named "wrapInOverlay" ]]
	-- upvalues: responsiveModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getActiveRouteName (ref), enumScreensModule (ref), reactModule (ref), systemMenuTopBarModule (ref), configureTopBarWithNavigationOptionsModule (ref), foundationModule (ref)
	return function(p2) --[[ line: 53 ]]
		-- upvalues: responsiveModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), getActiveRouteName (copy), enumScreensModule (copy), reactModule (copy), systemMenuTopBarModule (copy), configureTopBarWithNavigationOptionsModule (copy), foundationModule (copy), p1 (ref)
		local uDim2 = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72)
		local var15 = nil
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			if fFlagAppChatPerfTrackingModule then
				appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local var16 = getActiveRouteName(p2.navigation)
			
			if var16 == enumScreensModule.CreateNewChat or var16 == enumScreensModule.EditChatMembers or var16 == enumScreensModule.QuickStartSquadInviteFriends then
				var15 = reactModule.createElement(systemMenuTopBarModule, { screenName = var16, navigation = p2.navigation })
			end
		end
		return reactModule.createElement(foundationModule.View, {
			tag = "col position-center-center anchor-center-center clip bg-surface-0 radius-large",
			Size = uDim2
		}, {
			sizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			topBar = var15 or configureTopBarWithNavigationOptionsModule(p2.navigation),
			overlayContent = reactModule.createElement(p1, p2)
		})
	end
end

return function(p3) --[[ line: 100 ]]
	-- upvalues: roactNavigationModule (ref), reactModule (ref), isolatedAutoFocusNavigationModule (ref), responsiveModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getActiveRouteName (ref), enumScreensModule (ref), systemMenuTopBarModule (ref), configureTopBarWithNavigationOptionsModule (ref), foundationModule (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var17 = roactNavigationModule.createRobloxStackNavigator(p3, { defaultNavigationOptions = { isDialog = true } })
	local overlayNavigatorConnector = reactModule.PureComponent:extend("OverlayNavigatorConnector")
	overlayNavigatorConnector.router = var17.router
	local var19 = isolatedAutoFocusNavigationModule(function(p4) --[[ line: 53 ]]
		-- upvalues: responsiveModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), getActiveRouteName (copy), enumScreensModule (copy), reactModule (copy), systemMenuTopBarModule (copy), configureTopBarWithNavigationOptionsModule (copy), foundationModule (copy), var17 (ref)
		local uDim2 = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72)
		local var15 = nil
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			if fFlagAppChatPerfTrackingModule then
				appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local var16 = getActiveRouteName(p4.navigation)
			
			if var16 == enumScreensModule.CreateNewChat or var16 == enumScreensModule.EditChatMembers or var16 == enumScreensModule.QuickStartSquadInviteFriends then
				var15 = reactModule.createElement(systemMenuTopBarModule, { screenName = var16, navigation = p4.navigation })
			end
		end
		return reactModule.createElement(foundationModule.View, {
			tag = "col position-center-center anchor-center-center clip bg-surface-0 radius-large",
			Size = uDim2
		}, {
			sizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			topBar = var15 or configureTopBarWithNavigationOptionsModule(p4.navigation),
			overlayContent = reactModule.createElement(var17, p4)
		})
	end, focusNavigableSurfaceIdentifierEnum.PopUp)
	
	function overlayNavigatorConnector.render(p5) --[[ line: 109 ]]
		-- upvalues: reactModule (copy), var19 (ref)
		return reactModule.createElement(var19, p5.props)
	end
	
	return overlayNavigatorConnector
end