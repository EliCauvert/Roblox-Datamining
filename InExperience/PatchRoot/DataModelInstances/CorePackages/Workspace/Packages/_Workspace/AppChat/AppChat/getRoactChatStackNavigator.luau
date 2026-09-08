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
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local _ = require(appChat.types)

local function getActiveChildParams(p1)
	-- upvalues: getActiveChildParams (ref)
	local index = p1.routes and p1.routes[p1.index]
	
	return if index then getActiveChildParams(index) else p1.params
end

local function getActiveChildNavigationOptions(p1)
	-- upvalues: getActiveChildNavigationOptions (ref), roactNavigationModule (ref)
	local state = p1.state
	local index = state.routes and state.routes[state.index]
	
	return if index and index.routes then getActiveChildNavigationOptions(p1.getChildNavigation(index.key)) else roactNavigationModule.getActiveChildNavigationOptions(p1)
end

local function _(p1)
	return if p1 then if p1.conversation then p1.conversation.id else p1.conversationId else nil
end

local function RoactChatStackNavigatorWithFocusNavigation(p1)
	-- upvalues: reactModule (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), roactModule (ref)
	return roactModule.createFragment({
		FocusNavigationContainer = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ref = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p2)
				-- upvalues: p1 (ref)
				if p1.shouldSuppressNavigateBack(p2) then
					p2:cancel()
					
					return
				elseif p1.onNavigateBack() then
					p2:cancel()
				end
			end), { p1.onNavigateBack, p1.shouldSuppressNavigateBack }))
		}, {
			navigator = roactModule.createElement(p1.navigator, { navigation = p1.navigation })
		})
	})
end

local function RoactChatStackNavigatorWithBackHandler(p1)
	-- upvalues: roactModule (ref), backHandlerContextModule (ref), RoactChatStackNavigatorWithFocusNavigation (ref)
	return roactModule.createElement(backHandlerContextModule.Provider, { value = p1.registerBackHandler }, {
		FocusNavigation = roactModule.createElement(RoactChatStackNavigatorWithFocusNavigation, {
			navigation = p1.navigation,
			navigator = p1.navigator,
			onNavigateBack = p1.onNavigateBack,
			shouldSuppressNavigateBack = p1.shouldSuppressNavigateBack
		})
	})
end

return function(p1, p2, p3, p4)
	-- upvalues: roactModule (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), getActiveChildNavigationOptions (ref), roactNavigationModule (ref), appChatFixRootChatBackNavigationIxpEnabled (ref), IXPService (ref), appChatFixRootChatBackNavigationIxpLayer (ref), enumScreensModule (ref), fFlagAppChatFixRootChatBackNavigation (ref), getActiveChildParams (ref), getTopBarStoreModule (ref), RoactChatStackNavigatorWithBackHandler (ref)
	local roactChatStackNavigator = roactModule.PureComponent:extend("RoactChatStackNavigator")
	roactChatStackNavigator.defaultProps = {
		navigation = nil,
		parameters = nil,
		notificationCount = 0,
		setActiveConversationId = function() end,
		setBackButtonEnabled = function() end,
		setTabBarVisible = function() end
	}
	
	function roactChatStackNavigator.init(p5)
		-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), p2 (ref), appChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), appChatFixRootChatBackNavigationIxpLayer (copy), enumScreensModule (copy), fFlagAppChatFixRootChatBackNavigation (copy), p4 (ref)
		p5.backButtonConnection = nil
		p5.backHandler = nil
		p5.suppressNextButtonBRelease = false
		
		function p10.registerBackHandler(p6)
			-- upvalues: p5 (ref)
			p5.backHandler = p6
			
			return function()
				-- upvalues: p5 (copy), p6 (ref)
				if p5.backHandler == p6 then
					p5.backHandler = nil
				end
			end
		end
		
		function p10.shouldSuppressNavigateBack(p6)
			-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), p5 (ref)
			if not fFlagAppChatParticipantDialogGamepadFocusModule or not p5.suppressNextButtonBRelease then
				return false
			end
			p5.suppressNextButtonBRelease = false
			
			return p6.eventData ~= nil and p6.eventData.KeyCode == Enum.KeyCode.ButtonB
		end
		
		function p10.onBackButtonPressed()
			-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), p5 (ref), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), p2 (copy), appChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), appChatFixRootChatBackNavigationIxpLayer (copy), enumScreensModule (copy), fFlagAppChatFixRootChatBackNavigation (copy), p4 (copy)
			if fFlagAppChatParticipantDialogGamepadFocusModule and p5.backHandler then
				p5.backHandler()
				
				return true
			end
			local navigation = p5.props.navigation
			local state = navigation.state
			local index = state.routes and state.routes[state.index]
			
			if not p2 or not (if index and index.routes then getActiveChildNavigationOptions(navigation.getChildNavigation(index.key)) else roactNavigationModule.getActiveChildNavigationOptions(navigation)).isRoot then
				p5.props.navigation.pop()
				
				return true
			elseif appChatFixRootChatBackNavigationIxpEnabled then
				IXPService:LogFlagLinkedUserLayerExposure(appChatFixRootChatBackNavigationIxpLayer)
			end
			p5.props.navigation.navigate(enumScreensModule.EmptyConversation)
			p2()
			
			if not fFlagAppChatFixRootChatBackNavigation and p4 and p5.props.chatIsVisible then
				p4.showExitDialog()
			end
			return false
		end
		
		function p10.onDirectBackButtonPressed()
			-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), p5 (ref)
			if fFlagAppChatParticipantDialogGamepadFocusModule then
				p5.suppressNextButtonBRelease = p5.backHandler ~= nil
			end
			return p5.onBackButtonPressed()
		end
	end
	
	function roactChatStackNavigator.willUpdate(p5, p6)
		-- upvalues: getActiveChildParams (copy), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), getTopBarStoreModule (copy)
		local state = p5.props.navigation.state
		local index = state.routes and state.routes[state.index]
		local var1 = if index then getActiveChildParams(index) else state.params
		local state_1 = p6.navigation.state
		local index_1 = state_1.routes and state_1.routes[state_1.index]
		local var2 = if index_1 then getActiveChildParams(index_1) else state_1.params
		local var3 = if var2 then if var2.conversation then var2.conversation.id else var2.conversationId else nil
		
		if (if var1 then if var1.conversation then var1.conversation.id else var1.conversationId else nil) ~= var3 then
			p5.props.setActiveConversationId(var3)
		end
		if not p6.chatIsVisible then return end
		local state_2 = p6.navigation.state
		local index_2 = state_2.routes[state_2.index]
		local navigation = p6.navigation
		local state_3 = navigation.state
		local index_3 = state_3.routes and state_3.routes[state_3.index]
		local var4 = if index_3 and index_3.routes then getActiveChildNavigationOptions(navigation.getChildNavigation(index_3.key)) else roactNavigationModule.getActiveChildNavigationOptions(navigation)
		local var5 = getTopBarStoreModule(false).getScreenTopBar(index_2.routeName)()
		
		if var5.backButtonEnabled ~= nil then
			p5.props.setBackButtonEnabled(var5.backButtonEnabled)
		end
		if var4 and var4.tabBarVisible ~= nil then
			p5.props.setTabBarVisible(var4.tabBarVisible)
		end
	end
	
	function roactChatStackNavigator.didMount(p5)
		-- upvalues: p3 (ref), p2 (ref), enumScreensModule (copy)
		if p3 and p2 then
			p5.backButtonConnection = p3:connect(p5.onDirectBackButtonPressed)
		end
		local parameters = p5.props.parameters
		local conversationId = parameters and parameters.conversationId
		
		if conversationId then
			p5.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = conversationId })
		end
	end
	
	function roactChatStackNavigator.willUnmount(p5)
		p5.props.setActiveConversationId(nil)
		p5.backHandler = nil
		p5.suppressNextButtonBRelease = false
		
		if p5.backButtonConnection then
			p5.backButtonConnection:disconnect()
		end
	end
	
	function roactChatStackNavigator.render(p5)
		-- upvalues: roactModule (copy), RoactChatStackNavigatorWithBackHandler (copy), p1 (ref)
		return roactModule.createElement(RoactChatStackNavigatorWithBackHandler, {
			navigation = p5.props.navigation,
			navigator = p1,
			onNavigateBack = p5.onBackButtonPressed,
			registerBackHandler = p5.registerBackHandler,
			shouldSuppressNavigateBack = p5.shouldSuppressNavigateBack
		})
	end
	
	roactChatStackNavigator.router = p1.router
	
	return roactChatStackNavigator
end