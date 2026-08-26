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

local function getActiveRouteName(p1)
	local index
	local state = p1 and p1.state
	
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

local function _(p2)
	-- upvalues: responsiveModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getActiveRouteName (ref), enumScreensModule (ref), reactModule (ref), systemMenuTopBarModule (ref), configureTopBarWithNavigationOptionsModule (ref), foundationModule (ref)
	return function(p3)
		-- upvalues: responsiveModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), getActiveRouteName (copy), enumScreensModule (copy), reactModule (copy), systemMenuTopBarModule (copy), configureTopBarWithNavigationOptionsModule (copy), foundationModule (copy), p2 (ref)
		local uDim2 = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72)
		local var1 = nil
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			if fFlagAppChatPerfTrackingModule then
				appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local var2 = getActiveRouteName(p3.navigation)
			
			if var2 == enumScreensModule.CreateNewChat or var2 == enumScreensModule.EditChatMembers or var2 == enumScreensModule.QuickStartSquadInviteFriends then
				var1 = reactModule.createElement(systemMenuTopBarModule, { screenName = var2, navigation = p3.navigation })
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
			topBar = var1 or configureTopBarWithNavigationOptionsModule(p3.navigation),
			overlayContent = reactModule.createElement(p2, p3)
		})
	end
end

return function(p2)
	-- upvalues: roactNavigationModule (ref), fFlagFixPaginatedChatMembersCutoffModule (ref), reactModule (ref), isolatedAutoFocusNavigationModule (ref), responsiveModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getActiveRouteName (ref), enumScreensModule (ref), systemMenuTopBarModule (ref), configureTopBarWithNavigationOptionsModule (ref), foundationModule (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1 = roactNavigationModule.createRobloxStackNavigator(p2, {
		defaultNavigationOptions = {
			isDialog = true,
			absorbInputSelectable = if fFlagFixPaginatedChatMembersCutoffModule then false else nil
		}
	})
	local overlayNavigatorConnector = reactModule.PureComponent:extend("OverlayNavigatorConnector")
	overlayNavigatorConnector.router = var1.router
	local var2 = isolatedAutoFocusNavigationModule(function(p3)
		-- upvalues: responsiveModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), getActiveRouteName (copy), enumScreensModule (copy), reactModule (copy), systemMenuTopBarModule (copy), configureTopBarWithNavigationOptionsModule (copy), foundationModule (copy), var1 (ref)
		local uDim2 = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72)
		local var3 = nil
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			if fFlagAppChatPerfTrackingModule then
				appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
			end
			local var4 = getActiveRouteName(p3.navigation)
			
			if var4 == enumScreensModule.CreateNewChat or var4 == enumScreensModule.EditChatMembers or var4 == enumScreensModule.QuickStartSquadInviteFriends then
				var3 = reactModule.createElement(systemMenuTopBarModule, { screenName = var4, navigation = p3.navigation })
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
			topBar = var3 or configureTopBarWithNavigationOptionsModule(p3.navigation),
			overlayContent = reactModule.createElement(var1, p3)
		})
	end, focusNavigableSurfaceIdentifierEnum.PopUp)
	
	function overlayNavigatorConnector.render(p3)
		-- upvalues: reactModule (copy), var2 (ref)
		return reactModule.createElement(var2, p3.props)
	end
	
	return overlayNavigatorConnector
end