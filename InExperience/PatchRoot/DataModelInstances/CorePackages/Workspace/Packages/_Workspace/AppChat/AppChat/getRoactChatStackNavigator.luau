local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local IXPService = game:GetService("IXPService")
local backHandlerContextModule = require(appChat.Contexts.BackHandlerContext)
local enumScreensModule = require(appChat.EnumScreens)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local fFlagAppChatParticipantDialogGamepadFocusModule = require(appChat.Flags.FFlagAppChatParticipantDialogGamepadFocus)
local fFlagAppChatFixRootChatBackNavigation = sharedFlagsModule.FFlagAppChatFixRootChatBackNavigation
local appChatFixRootChatBackNavigationIxpEnabled = game:DefineFastFlag("AppChatFixRootChatBackNavigationIxpEnabled", false)
local appChatFixRootChatBackNavigationIxpLayer = game:DefineFastString("AppChatFixRootChatBackNavigationIxpLayer", "Party.LandingPage")
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local _ = require(appChat.types)

local function getActiveChildParams(p0)
	-- upvalues: getActiveChildParams (ref)
	local index = p0.routes and p0.routes[p0.index]
	
	return if index then getActiveChildParams(index) else p0.params
end

local function getActiveChildNavigationOptions(p1)
	-- upvalues: getActiveChildNavigationOptions (ref), roactNavigationModule (ref)
	local state = p1.state
	local index = state.routes and state.routes[state.index]
	
	return if index and index.routes then getActiveChildNavigationOptions(p1.getChildNavigation(index.key)) else roactNavigationModule.getActiveChildNavigationOptions(p1)
end

local function _(p2)
	return if p2 then if p2.conversation then p2.conversation.id else p2.conversationId else nil
end

local function RoactChatStackNavigatorWithFocusNavigation(p3)
	-- upvalues: reactModule (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), roactModule (ref)
	return roactModule.createFragment({
		FocusNavigationContainer = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ref = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p4)
				-- upvalues: p3 (ref)
				if p3.shouldSuppressNavigateBack(p4) then
					p4:cancel()
					
					return
				elseif p3.onNavigateBack() then
					p4:cancel()
				end
			end), { p3.onNavigateBack, p3.shouldSuppressNavigateBack }))
		}, {
			navigator = roactModule.createElement(p3.navigator, { navigation = p3.navigation })
		})
	})
end

local function RoactChatStackNavigatorWithBackHandler(p5)
	-- upvalues: roactModule (ref), backHandlerContextModule (ref), RoactChatStackNavigatorWithFocusNavigation (ref)
	return roactModule.createElement(backHandlerContextModule.Provider, { value = p5.registerBackHandler }, {
		FocusNavigation = roactModule.createElement(RoactChatStackNavigatorWithFocusNavigation, {
			navigation = p5.navigation,
			navigator = p5.navigator,
			onNavigateBack = p5.onNavigateBack,
			shouldSuppressNavigateBack = p5.shouldSuppressNavigateBack
		})
	})
end

return function(p6, p7, p8, p9)
	-- upvalues: roactModule (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), getActiveChildNavigationOptions (ref), roactNavigationModule (ref), appChatFixRootChatBackNavigationIxpEnabled (ref), IXPService (ref), appChatFixRootChatBackNavigationIxpLayer (ref), enumScreensModule (ref), fFlagAppChatFixRootChatBackNavigation (ref), getActiveChildParams (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), RoactChatStackNavigatorWithBackHandler (ref)
	local roactChatStackNavigator = roactModule.PureComponent:extend("RoactChatStackNavigator")
	roactChatStackNavigator.defaultProps = {
		navigation = nil,
		parameters = nil,
		notificationCount = 0,
		setActiveConversationId = function() end,
		setBackButtonEnabled = function() end,
		setTabBarVisible = function() end
	}
	
	function roactChatStackNavigator.init(p10)
		-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), p7 (ref), appChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), appChatFixRootChatBackNavigationIxpLayer (copy), enumScreensModule (copy), fFlagAppChatFixRootChatBackNavigation (copy), p9 (ref)
		p10.backButtonConnection = nil
		p10.backHandler = nil
		p10.suppressNextButtonBRelease = false
		
		function p10.registerBackHandler(p11)
			-- upvalues: p10 (ref)
			p10.backHandler = p11
			
			return function()
				-- upvalues: p10 (copy), p11 (ref)
				if p10.backHandler == p11 then
					p10.backHandler = nil
				end
			end
		end
		
		function p10.shouldSuppressNavigateBack(p12)
			-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), p10 (ref)
			if not fFlagAppChatParticipantDialogGamepadFocusModule or not p10.suppressNextButtonBRelease then
				return false
			end
			p10.suppressNextButtonBRelease = false
			
			return p12.eventData ~= nil and p12.eventData.KeyCode == Enum.KeyCode.ButtonB
		end
		
		function p10.onBackButtonPressed()
			-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), p10 (ref), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), p7 (copy), appChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), appChatFixRootChatBackNavigationIxpLayer (copy), enumScreensModule (copy), fFlagAppChatFixRootChatBackNavigation (copy), p9 (copy)
			if fFlagAppChatParticipantDialogGamepadFocusModule and p10.backHandler then
				p10.backHandler()
				
				return true
			end
			local navigation = p10.props.navigation
			local state = navigation.state
			local index = state.routes and state.routes[state.index]
			
			if not p7 or not (if index and index.routes then getActiveChildNavigationOptions(navigation.getChildNavigation(index.key)) else roactNavigationModule.getActiveChildNavigationOptions(navigation)).isRoot then
				p10.props.navigation.pop()
				
				return true
			elseif appChatFixRootChatBackNavigationIxpEnabled then
				IXPService:LogFlagLinkedUserLayerExposure(appChatFixRootChatBackNavigationIxpLayer)
			end
			p10.props.navigation.navigate(enumScreensModule.EmptyConversation)
			p7()
			
			if not fFlagAppChatFixRootChatBackNavigation and p9 and p10.props.chatIsVisible then
				p9.showExitDialog()
			end
			return false
		end
		
		function p10.onDirectBackButtonPressed()
			-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), p10 (ref)
			if fFlagAppChatParticipantDialogGamepadFocusModule then
				p10.suppressNextButtonBRelease = p10.backHandler ~= nil
			end
			return p10.onBackButtonPressed()
		end
	end
	
	function roactChatStackNavigator.willUpdate(p13, p14)
		-- upvalues: getActiveChildParams (copy), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy)
		local state = p13.props.navigation.state
		local index = state.routes and state.routes[state.index]
		local var24 = if index then getActiveChildParams(index) else state.params
		local state_1 = p14.navigation.state
		local index_1 = state_1.routes and state_1.routes[state_1.index]
		local var26 = if index_1 then getActiveChildParams(index_1) else state_1.params
		local var27 = if var26 then if var26.conversation then var26.conversation.id else var26.conversationId else nil
		
		if (if var24 then if var24.conversation then var24.conversation.id else var24.conversationId else nil) ~= var27 then
			p13.props.setActiveConversationId(var27)
		end
		if not p14.chatIsVisible then return end
		local navigation = p14.navigation
		local state_2 = navigation.state
		local index_2 = state_2.routes and state_2.routes[state_2.index]
		local var29 = if index_2 and index_2.routes then getActiveChildNavigationOptions(navigation.getChildNavigation(index_2.key)) else roactNavigationModule.getActiveChildNavigationOptions(navigation)
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			local state_3 = p14.navigation.state
			index_2 = getTopBarStoreModule(false).getScreenTopBar(state_3.routes[state_3.index].routeName)()
			
			if index_2.backButtonEnabled ~= nil then
				p13.props.setBackButtonEnabled(index_2.backButtonEnabled)
			end
		elseif var29 and var29.backButtonEnabled ~= nil then
			p13.props.setBackButtonEnabled(var29.backButtonEnabled)
		end
		if var29 and var29.tabBarVisible ~= nil then
			p13.props.setTabBarVisible(var29.tabBarVisible)
		end
	end
	
	function roactChatStackNavigator.didMount(p15)
		-- upvalues: p8 (ref), p7 (ref), enumScreensModule (copy)
		if p8 and p7 then
			p15.backButtonConnection = p8:connect(p15.onDirectBackButtonPressed)
		end
		local parameters = p15.props.parameters
		local conversationId = parameters and parameters.conversationId
		
		if conversationId then
			p15.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = conversationId })
		end
	end
	
	function roactChatStackNavigator.willUnmount(p16)
		p16.props.setActiveConversationId(nil)
		p16.backHandler = nil
		p16.suppressNextButtonBRelease = false
		
		if p16.backButtonConnection then
			p16.backButtonConnection:disconnect()
		end
	end
	
	function roactChatStackNavigator.render(p17)
		-- upvalues: roactModule (copy), RoactChatStackNavigatorWithBackHandler (copy), p6 (ref)
		return roactModule.createElement(RoactChatStackNavigatorWithBackHandler, {
			navigation = p17.props.navigation,
			navigator = p6,
			onNavigateBack = p17.onBackButtonPressed,
			registerBackHandler = p17.registerBackHandler,
			shouldSuppressNavigateBack = p17.shouldSuppressNavigateBack
		})
	end
	
	roactChatStackNavigator.router = p6.router
	
	return roactChatStackNavigator
end