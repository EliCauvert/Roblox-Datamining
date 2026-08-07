local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local IXPService = game:GetService("IXPService")
local enumScreensModule = require(appChat.EnumScreens)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local roactNavigationModule = require(parent.RoactNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local fFlagAppChatFixRootChatBackNavigation = require(parent.SharedFlags).FFlagAppChatFixRootChatBackNavigation
local appChatFixRootChatBackNavigationIxpEnabled = game:DefineFastFlag("AppChatFixRootChatBackNavigationIxpEnabled", false)
local appChatFixRootChatBackNavigationIxpLayer = game:DefineFastString("AppChatFixRootChatBackNavigationIxpLayer", "Party.LandingPage")
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local _ = require(appChat.types)

local function getActiveChildParams(p0) --[[ line: 27 ]]
	-- upvalues: getActiveChildParams (ref)
	local index = p0.routes and p0.routes[p0.index]
	
	return if index then getActiveChildParams(index) else p0.params
end

local function getActiveChildNavigationOptions(p1) --[[ line: 37 ]]
	-- upvalues: getActiveChildNavigationOptions (ref), roactNavigationModule (ref)
	local state = p1.state
	local index = state.routes and state.routes[state.index]
	
	return if index and index.routes then getActiveChildNavigationOptions(p1.getChildNavigation(index.key)) else roactNavigationModule.getActiveChildNavigationOptions(p1)
end

local function _(p2) --[[ line: 50 | named "getActiveConversationId" ]]
	return if p2 then if p2.conversation then p2.conversation.id else p2.conversationId else nil
end

local function RoactChatStackNavigatorWithFocusNavigation(p3) --[[ line: 63 ]]
	-- upvalues: reactModule (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), roactModule (ref)
	return roactModule.createFragment({
		FocusNavigationContainer = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ref = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p4) --[[ line: 65 ]]
				-- upvalues: p3 (ref)
				if p3.onNavigateBack() then
					p4:cancel()
				end
			end), { p3.onNavigateBack }))
		}, {
			navigator = roactModule.createElement(p3.navigator, { navigation = p3.navigation })
		})
	})
end

return function(p5, p6, p7, p8) --[[ line: 89 ]]
	-- upvalues: roactModule (ref), getActiveChildNavigationOptions (ref), roactNavigationModule (ref), appChatFixRootChatBackNavigationIxpEnabled (ref), IXPService (ref), appChatFixRootChatBackNavigationIxpLayer (ref), enumScreensModule (ref), fFlagAppChatFixRootChatBackNavigation (ref), getActiveChildParams (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), RoactChatStackNavigatorWithFocusNavigation (ref)
	local roactChatStackNavigator = roactModule.PureComponent:extend("RoactChatStackNavigator")
	roactChatStackNavigator.defaultProps = {
		navigation = nil,
		parameters = nil,
		notificationCount = 0,
		setActiveConversationId = function() --[[ line: 100 ]] end,
		setBackButtonEnabled = function() --[[ line: 101 ]] end,
		setTabBarVisible = function() --[[ line: 102 ]] end
	}
	
	function roactChatStackNavigator.init(p9) --[[ line: 106 ]]
		-- upvalues: getActiveChildNavigationOptions (copy), roactNavigationModule (copy), p6 (ref), appChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), appChatFixRootChatBackNavigationIxpLayer (copy), enumScreensModule (copy), fFlagAppChatFixRootChatBackNavigation (copy), p8 (ref)
		p9.backButtonConnection = nil
		
		function p9.onBackButtonPressed() --[[ line: 110 ]]
			-- upvalues: p9 (ref), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), p6 (copy), appChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), appChatFixRootChatBackNavigationIxpLayer (copy), enumScreensModule (copy), fFlagAppChatFixRootChatBackNavigation (copy), p8 (copy)
			local navigation = p9.props.navigation
			local state = navigation.state
			local index = state.routes and state.routes[state.index]
			
			if not p6 or not (if index and index.routes then getActiveChildNavigationOptions(navigation.getChildNavigation(index.key)) else roactNavigationModule.getActiveChildNavigationOptions(navigation)).isRoot then
				p9.props.navigation.pop()
				
				return true
			elseif appChatFixRootChatBackNavigationIxpEnabled then
				IXPService:LogFlagLinkedUserLayerExposure(appChatFixRootChatBackNavigationIxpLayer)
			end
			p9.props.navigation.navigate(enumScreensModule.EmptyConversation)
			p6()
			
			if not fFlagAppChatFixRootChatBackNavigation and p8 and p9.props.chatIsVisible then
				p8.showExitDialog()
			end
			return false
		end
	end
	
	function roactChatStackNavigator.willUpdate(p10, p11) --[[ line: 134 ]]
		-- upvalues: getActiveChildParams (copy), getActiveChildNavigationOptions (copy), roactNavigationModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy)
		local state = p10.props.navigation.state
		local index = state.routes and state.routes[state.index]
		local var20 = if index then getActiveChildParams(index) else state.params
		local state_1 = p11.navigation.state
		local index_1 = state_1.routes and state_1.routes[state_1.index]
		local var22 = if index_1 then getActiveChildParams(index_1) else state_1.params
		local var23 = if var22 then if var22.conversation then var22.conversation.id else var22.conversationId else nil
		
		if (if var20 then if var20.conversation then var20.conversation.id else var20.conversationId else nil) ~= var23 then
			p10.props.setActiveConversationId(var23)
		end
		if not p11.chatIsVisible then return end
		local navigation = p11.navigation
		local state_2 = navigation.state
		local index_2 = state_2.routes and state_2.routes[state_2.index]
		local var25 = if index_2 and index_2.routes then getActiveChildNavigationOptions(navigation.getChildNavigation(index_2.key)) else roactNavigationModule.getActiveChildNavigationOptions(navigation)
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			local state_3 = p11.navigation.state
			index_2 = getTopBarStoreModule(false).getScreenTopBar(state_3.routes[state_3.index].routeName)()
			
			if index_2.backButtonEnabled ~= nil then
				p10.props.setBackButtonEnabled(index_2.backButtonEnabled)
			end
		elseif var25 and var25.backButtonEnabled ~= nil then
			p10.props.setBackButtonEnabled(var25.backButtonEnabled)
		end
		if var25 and var25.tabBarVisible ~= nil then
			p10.props.setTabBarVisible(var25.tabBarVisible)
		end
	end
	
	function roactChatStackNavigator.didMount(p12) --[[ line: 172 ]]
		-- upvalues: p7 (ref), p6 (ref), enumScreensModule (copy)
		if p7 and p6 then
			p12.backButtonConnection = p7:connect(p12.onBackButtonPressed)
		end
		local parameters = p12.props.parameters
		local conversationId = parameters and parameters.conversationId
		
		if conversationId then
			p12.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = conversationId })
		end
	end
	
	function roactChatStackNavigator.willUnmount(p13) --[[ line: 185 ]]
		p13.props.setActiveConversationId(nil)
		
		if p13.backButtonConnection then
			p13.backButtonConnection:disconnect()
		end
	end
	
	function roactChatStackNavigator.render(p14) --[[ line: 192 ]]
		-- upvalues: roactModule (copy), RoactChatStackNavigatorWithFocusNavigation (copy), p5 (ref)
		return roactModule.createElement(RoactChatStackNavigatorWithFocusNavigation, {
			navigation = p14.props.navigation,
			navigator = p5,
			onNavigateBack = p14.onBackButtonPressed
		})
	end
	
	roactChatStackNavigator.router = p5.router
	
	return roactChatStackNavigator
end