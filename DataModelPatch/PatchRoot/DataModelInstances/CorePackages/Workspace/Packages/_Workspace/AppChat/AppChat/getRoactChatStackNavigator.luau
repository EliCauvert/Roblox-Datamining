local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local IXPService = game:GetService("IXPService")
local EnumScreensModule = require(AppChat.EnumScreens)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local FFlagAppChatFixRootChatBackNavigation = require(Parent.SharedFlags).FFlagAppChatFixRootChatBackNavigation
local AppChatFixRootChatBackNavigationIxpEnabled = game:DefineFastFlag("AppChatFixRootChatBackNavigationIxpEnabled", false)
local AppChatFixRootChatBackNavigationIxpLayer = game:DefineFastString("AppChatFixRootChatBackNavigationIxpLayer", "Party.LandingPage")
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local _ = require(AppChat.types)

local function getActiveChildParams(Route)
	-- upvalues: getActiveChildParams (copy)
	local Index = Route.index
	local Route1 = Route.routes and Route.routes[Index]
	
	return if Route1 then getActiveChildParams(Route1) else Route.params
end

local function getActiveChildNavigationOptions(ChildNavigation)
	-- upvalues: getActiveChildNavigationOptions (copy), RoactNavigationModule (copy)
	local State = ChildNavigation.state
	local Index = State.index
	local Route = State.routes and State.routes[Index]
	
	return if Route and Route.routes then getActiveChildNavigationOptions((ChildNavigation.getChildNavigation(Route.key))) else RoactNavigationModule.getActiveChildNavigationOptions(ChildNavigation)
end

local function _(p1)
	return if p1 then if p1.conversation then p1.conversation.id else p1.conversationId else nil
end

local function RoactChatStackNavigatorWithFocusNavigation(p1)
	-- upvalues: ReactModule (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), RoactModule (copy)
	return RoactModule.createFragment({
		FocusNavigationContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ref = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, (ReactModule.useCallback(InputHandlersModule.onRelease(function(p2)
				-- upvalues: p1 (copy)
				if p1.onNavigateBack() then
					p2:cancel()
				end
			end), { p1.onNavigateBack })))
		}, {
			navigator = RoactModule.createElement(p1.navigator, { navigation = p1.navigation })
		})
	})
end

return function(Navigator, Callback, p1, p2)
	-- upvalues: RoactModule (copy), getActiveChildNavigationOptions (copy), RoactNavigationModule (copy), AppChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), AppChatFixRootChatBackNavigationIxpLayer (copy), EnumScreensModule (copy), FFlagAppChatFixRootChatBackNavigation (copy), getActiveChildParams (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), RoactChatStackNavigatorWithFocusNavigation (copy)
	local RoactChatStackNavigator = RoactModule.PureComponent:extend("RoactChatStackNavigator")
	RoactChatStackNavigator.defaultProps = {
		navigation = nil,
		parameters = nil,
		notificationCount = 0,
		setActiveConversationId = function() end,
		setBackButtonEnabled = function() end,
		setTabBarVisible = function() end
	}
	
	function RoactChatStackNavigator.init(p3)
		-- upvalues: getActiveChildNavigationOptions (upval), RoactNavigationModule (upval), Callback (copy), AppChatFixRootChatBackNavigationIxpEnabled (upval), IXPService (upval), AppChatFixRootChatBackNavigationIxpLayer (upval), EnumScreensModule (upval), FFlagAppChatFixRootChatBackNavigation (upval), p2 (copy)
		p3.backButtonConnection = nil
		
		function p3.onBackButtonPressed(): boolean
			-- upvalues: p3 (copy), getActiveChildNavigationOptions (upval), RoactNavigationModule (upval), Callback (upval), AppChatFixRootChatBackNavigationIxpEnabled (upval), IXPService (upval), AppChatFixRootChatBackNavigationIxpLayer (upval), EnumScreensModule (upval), FFlagAppChatFixRootChatBackNavigation (upval), p2 (upval)
			local Navigation = p3.props.navigation
			local State = Navigation.state
			local Index = State.index
			local Route = State.routes and State.routes[Index]
			local ActiveChildNavigationOptions = if Route and Route.routes then getActiveChildNavigationOptions((Navigation.getChildNavigation(Route.key))) else RoactNavigationModule.getActiveChildNavigationOptions(Navigation)
			
			if not Callback or not ActiveChildNavigationOptions.isRoot then
				p3.props.navigation.pop()
				
				return true
			end
			if AppChatFixRootChatBackNavigationIxpEnabled then
				IXPService:LogFlagLinkedUserLayerExposure(AppChatFixRootChatBackNavigationIxpLayer)
			end
			p3.props.navigation.navigate(EnumScreensModule.EmptyConversation)
			Callback()
			
			if not FFlagAppChatFixRootChatBackNavigation and p2 and p3.props.chatIsVisible then
				p2.showExitDialog()
			end
			return false
		end
	end
	
	function RoactChatStackNavigator.willUpdate(p3, p4)
		-- upvalues: getActiveChildParams (upval), getActiveChildNavigationOptions (upval), RoactNavigationModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), GetTopBarStoreModule (upval)
		local State = p3.props.navigation.state
		local Index = State.index
		local Route = State.routes and State.routes[Index]
		local ActiveChildParams = if Route then getActiveChildParams(Route) else State.params
		local State1 = p4.navigation.state
		local Index1 = State1.index
		local Route1 = State1.routes and State1.routes[Index1]
		local ActiveChildParams1 = if Route1 then getActiveChildParams(Route1) else State1.params
		local Id = if ActiveChildParams1 then if ActiveChildParams1.conversation then ActiveChildParams1.conversation.id else ActiveChildParams1.conversationId else nil
		
		if (if ActiveChildParams then if ActiveChildParams.conversation then ActiveChildParams.conversation.id else ActiveChildParams.conversationId else nil) ~= Id then
			p3.props.setActiveConversationId(Id)
		end
		if not p4.chatIsVisible then return end
		local Navigation = p4.navigation
		local State2 = Navigation.state
		local Index2 = State2.index
		local Route2 = State2.routes and State2.routes[Index2]
		local ActiveChildNavigationOptions = if Route2 and Route2.routes then getActiveChildNavigationOptions((Navigation.getChildNavigation(Route2.key))) else RoactNavigationModule.getActiveChildNavigationOptions(Navigation)
		
		if FFlagAppChatTopBarConfigDrivenModule() then
			local State3 = p4.navigation.state
			local v1 = GetTopBarStoreModule(false).getScreenTopBar(State3.routes[State3.index].routeName)()
			
			if v1.backButtonEnabled ~= nil then
				p3.props.setBackButtonEnabled(v1.backButtonEnabled)
			end
		elseif ActiveChildNavigationOptions and ActiveChildNavigationOptions.backButtonEnabled ~= nil then
			p3.props.setBackButtonEnabled(ActiveChildNavigationOptions.backButtonEnabled)
		end
		if ActiveChildNavigationOptions and ActiveChildNavigationOptions.tabBarVisible ~= nil then
			p3.props.setTabBarVisible(ActiveChildNavigationOptions.tabBarVisible)
		end
	end
	
	function RoactChatStackNavigator.didMount(p3)
		-- upvalues: p1 (copy), Callback (copy), EnumScreensModule (upval)
		if p1 and Callback then
			p3.backButtonConnection = p1:connect(p3.onBackButtonPressed)
		end
		local Parameters = p3.props.parameters
		local ConversationId = Parameters and Parameters.conversationId
		
		if ConversationId then
			p3.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
		end
	end
	
	function RoactChatStackNavigator.willUnmount(p3)
		p3.props.setActiveConversationId(nil)
		
		if p3.backButtonConnection then
			p3.backButtonConnection:disconnect()
		end
	end
	
	function RoactChatStackNavigator.render(p3)
		-- upvalues: RoactModule (upval), RoactChatStackNavigatorWithFocusNavigation (upval), Navigator (copy)
		return RoactModule.createElement(RoactChatStackNavigatorWithFocusNavigation, {
			navigation = p3.props.navigation,
			navigator = Navigator,
			onNavigateBack = p3.onBackButtonPressed
		})
	end
	
	RoactChatStackNavigator.router = Navigator.router
	
	return RoactChatStackNavigator
end