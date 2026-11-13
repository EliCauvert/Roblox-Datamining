local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local IXPService = game:GetService("IXPService")
local BackHandlerContextModule = require(AppChat.Contexts.BackHandlerContext)
local EnumScreensModule = require(AppChat.EnumScreens)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local FFlagAppChatFixRootChatBackNavigation = SharedFlagsModule.FFlagAppChatFixRootChatBackNavigation
local AppChatFixRootChatBackNavigationIxpEnabled = game:DefineFastFlag("AppChatFixRootChatBackNavigationIxpEnabled", false)
local AppChatFixRootChatBackNavigationIxpLayer = game:DefineFastString("AppChatFixRootChatBackNavigationIxpLayer", "Party.LandingPage")
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagSignalsNavDeferProjection = SharedFlagsModule.FFlagSignalsNavDeferProjection
local GetIsChatVisibleNow = if FFlagSignalsNavDeferProjection then require(AppChat.Utils.getIsChatVisibleNow).getIsChatVisibleNow else nil
local FFlagAppChatFoundationHeaderBarModule = require(AppChat.Flags.FFlagAppChatFoundationHeaderBar)
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
	-- upvalues: ReactModule (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), RoactModule (copy), FFlagAppChatFoundationHeaderBarModule (copy)
	return RoactModule.createFragment({
		FocusNavigationContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ref = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, (ReactModule.useCallback(InputHandlersModule.onRelease(function(p2)
				-- upvalues: p1 (copy)
				if p1.shouldSuppressNavigateBack(p2) then
					p2:cancel()
					
					return
				end
				if p1.onNavigateBack() then
					p2:cancel()
				end
			end), { p1.onNavigateBack, p1.shouldSuppressNavigateBack })))
		}, {
			navigator = RoactModule.createElement(p1.navigator, {
				navigation = p1.navigation,
				screenProps = if FFlagAppChatFoundationHeaderBarModule then p1.screenProps else nil
			})
		})
	})
end

local function RoactChatStackNavigatorWithBackHandler(p1)
	-- upvalues: RoactModule (copy), BackHandlerContextModule (copy), RoactChatStackNavigatorWithFocusNavigation (copy), FFlagAppChatFoundationHeaderBarModule (copy)
	return RoactModule.createElement(BackHandlerContextModule.Provider, { value = p1.registerBackHandler }, {
		FocusNavigation = RoactModule.createElement(RoactChatStackNavigatorWithFocusNavigation, {
			navigation = p1.navigation,
			screenProps = if FFlagAppChatFoundationHeaderBarModule then p1.screenProps else nil,
			navigator = p1.navigator,
			onNavigateBack = p1.onNavigateBack,
			shouldSuppressNavigateBack = p1.shouldSuppressNavigateBack
		})
	})
end

return function(Navigator, Callback, p1, p2)
	-- upvalues: RoactModule (copy), getActiveChildNavigationOptions (copy), RoactNavigationModule (copy), AppChatFixRootChatBackNavigationIxpEnabled (copy), IXPService (copy), AppChatFixRootChatBackNavigationIxpLayer (copy), EnumScreensModule (copy), FFlagAppChatFixRootChatBackNavigation (copy), getActiveChildParams (copy), FFlagSignalsNavDeferProjection (copy), GetIsChatVisibleNow (copy), GetTopBarStoreModule (copy), RoactChatStackNavigatorWithBackHandler (copy), FFlagAppChatFoundationHeaderBarModule (copy)
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
		p3.backHandler = nil
		p3.suppressNextButtonBRelease = false
		
		function p3.registerBackHandler(BackHandler)
			-- upvalues: p3 (copy)
			p3.backHandler = BackHandler
			
			return function()
				-- upvalues: p3 (upval), BackHandler (copy)
				if p3.backHandler == BackHandler then
					p3.backHandler = nil
				end
			end
		end
		
		function p3.shouldSuppressNavigateBack(p4): boolean
			-- upvalues: p3 (copy)
			if p3.suppressNextButtonBRelease then
				p3.suppressNextButtonBRelease = false
				
				return p4.eventData ~= nil and p4.eventData.KeyCode == Enum.KeyCode.ButtonB
			else
				return false
			end
		end
		
		function p3.onBackButtonPressed(): boolean
			-- upvalues: p3 (copy), getActiveChildNavigationOptions (upval), RoactNavigationModule (upval), Callback (upval), AppChatFixRootChatBackNavigationIxpEnabled (upval), IXPService (upval), AppChatFixRootChatBackNavigationIxpLayer (upval), EnumScreensModule (upval), FFlagAppChatFixRootChatBackNavigation (upval), p2 (upval)
			if p3.backHandler then
				p3.backHandler()
				
				return true
			end
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
		
		function p3.onDirectBackButtonPressed()
			-- upvalues: p3 (copy)
			p3.suppressNextButtonBRelease = p3.backHandler ~= nil
			
			return p3.onBackButtonPressed()
		end
	end
	
	function RoactChatStackNavigator.willUpdate(p3, p4)
		-- upvalues: getActiveChildParams (upval), FFlagSignalsNavDeferProjection (upval), GetIsChatVisibleNow (upval), getActiveChildNavigationOptions (upval), RoactNavigationModule (upval), GetTopBarStoreModule (upval)
		local State = p3.props.navigation.state
		local Index = State.index
		local Route = State.routes and State.routes[Index]
		local ActiveChildParams = if Route then getActiveChildParams(Route) else State.params
		local State1 = p4.navigation.state
		local Index1 = State1.index
		local Route1 = State1.routes and State1.routes[Index1]
		local ActiveChildParams1 = if Route1 then getActiveChildParams(Route1) else State1.params
		local Id = if ActiveChildParams then if ActiveChildParams.conversation then ActiveChildParams.conversation.id else ActiveChildParams.conversationId else nil
		local Id1 = if ActiveChildParams1 then if ActiveChildParams1.conversation then ActiveChildParams1.conversation.id else ActiveChildParams1.conversationId else nil
		
		if Id ~= Id1 then
			p3.props.setActiveConversationId(Id1)
		end
		if not (if FFlagSignalsNavDeferProjection then GetIsChatVisibleNow() else p4.chatIsVisible) then return end
		local State2 = p4.navigation.state
		local Route2 = State2.routes[State2.index]
		local Navigation = p4.navigation
		local State3 = Navigation.state
		local Index2 = State3.index
		local Route11 = State3.routes and State3.routes[Index2]
		local ActiveChildNavigationOptions = if Route11 and Route11.routes then getActiveChildNavigationOptions((Navigation.getChildNavigation(Route11.key))) else RoactNavigationModule.getActiveChildNavigationOptions(Navigation)
		local v1 = GetTopBarStoreModule(false).getScreenTopBar(Route2.routeName)()
		
		if v1.backButtonEnabled ~= nil then
			p3.props.setBackButtonEnabled(v1.backButtonEnabled)
		end
		if ActiveChildNavigationOptions and ActiveChildNavigationOptions.tabBarVisible ~= nil then
			p3.props.setTabBarVisible(ActiveChildNavigationOptions.tabBarVisible)
		end
	end
	
	function RoactChatStackNavigator.didMount(p3)
		-- upvalues: p1 (copy), Callback (copy), EnumScreensModule (upval)
		if p1 and Callback then
			p3.backButtonConnection = p1:connect(p3.onDirectBackButtonPressed)
		end
		local Parameters = p3.props.parameters
		local ConversationId = Parameters and Parameters.conversationId
		
		if ConversationId then
			p3.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
		end
	end
	
	function RoactChatStackNavigator.willUnmount(p3)
		p3.props.setActiveConversationId(nil)
		p3.backHandler = nil
		p3.suppressNextButtonBRelease = false
		
		if p3.backButtonConnection then
			p3.backButtonConnection:disconnect()
		end
	end
	
	function RoactChatStackNavigator.render(p3)
		-- upvalues: RoactModule (upval), RoactChatStackNavigatorWithBackHandler (upval), FFlagAppChatFoundationHeaderBarModule (upval), Navigator (copy)
		return RoactModule.createElement(RoactChatStackNavigatorWithBackHandler, {
			navigation = p3.props.navigation,
			screenProps = if FFlagAppChatFoundationHeaderBarModule then p3.props.screenProps else nil,
			navigator = Navigator,
			onNavigateBack = p3.onBackButtonPressed,
			registerBackHandler = p3.registerBackHandler,
			shouldSuppressNavigateBack = p3.shouldSuppressNavigateBack
		})
	end
	
	RoactChatStackNavigator.router = Navigator.router
	
	return RoactChatStackNavigator
end