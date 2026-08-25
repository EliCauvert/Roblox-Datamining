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
local fFlagFixPaginatedChatMembersCutoffModule = require(appChat.Flags.FFlagFixPaginatedChatMembersCutoff)

local function getActiveRouteName(p0)
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

local function _(p1)
	-- upvalues: responsiveModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getActiveRouteName (ref), enumScreensModule (ref), reactModule (ref), systemMenuTopBarModule (ref), configureTopBarWithNavigationOptionsModule (ref), foundationModule (ref)
	return function(p2)
		-- upvalues: responsiveModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), getActiveRouteName (copy), enumScreensModule (copy), reactModule (copy), systemMenuTopBarModule (copy), configureTopBarWithNavigationOptionsModule (copy), foundationModule (copy), p1 (ref)
		local uDim2 = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72)
		local var16 = nil
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			if fFlagAppChatPerfTrackingModule then
				appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local var17 = getActiveRouteName(p2.navigation)
			
			if var17 == enumScreensModule.CreateNewChat or var17 == enumScreensModule.EditChatMembers or var17 == enumScreensModule.QuickStartSquadInviteFriends then
				var16 = reactModule.createElement(systemMenuTopBarModule, { screenName = var17, navigation = p2.navigation })
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
			topBar = var16 or configureTopBarWithNavigationOptionsModule(p2.navigation),
			overlayContent = reactModule.createElement(p1, p2)
		})
	end
end

return function(p3)
	-- upvalues: roactNavigationModule (ref), fFlagFixPaginatedChatMembersCutoffModule (ref), reactModule (ref), isolatedAutoFocusNavigationModule (ref), responsiveModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getActiveRouteName (ref), enumScreensModule (ref), systemMenuTopBarModule (ref), configureTopBarWithNavigationOptionsModule (ref), foundationModule (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var18 = roactNavigationModule.createRobloxStackNavigator(p3, {
		defaultNavigationOptions = {
			isDialog = true,
			absorbInputSelectable = if fFlagFixPaginatedChatMembersCutoffModule then false else nil
		}
	})
	local overlayNavigatorConnector = reactModule.PureComponent:extend("OverlayNavigatorConnector")
	overlayNavigatorConnector.router = var18.router
	local var20 = isolatedAutoFocusNavigationModule(function(p4)
		-- upvalues: responsiveModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), getActiveRouteName (copy), enumScreensModule (copy), reactModule (copy), systemMenuTopBarModule (copy), configureTopBarWithNavigationOptionsModule (copy), foundationModule (copy), var18 (ref)
		local uDim2 = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72)
		local var16 = nil
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			if fFlagAppChatPerfTrackingModule then
				appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local var17 = getActiveRouteName(p4.navigation)
			
			if var17 == enumScreensModule.CreateNewChat or var17 == enumScreensModule.EditChatMembers or var17 == enumScreensModule.QuickStartSquadInviteFriends then
				var16 = reactModule.createElement(systemMenuTopBarModule, { screenName = var17, navigation = p4.navigation })
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
			topBar = var16 or configureTopBarWithNavigationOptionsModule(p4.navigation),
			overlayContent = reactModule.createElement(var18, p4)
		})
	end, focusNavigableSurfaceIdentifierEnum.PopUp)
	
	function overlayNavigatorConnector.render(p5)
		-- upvalues: reactModule (copy), var20 (ref)
		return reactModule.createElement(var20, p5.props)
	end
	
	return overlayNavigatorConnector
end