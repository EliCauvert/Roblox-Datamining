local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local enumScreensModule = require(appChat.EnumScreens)
local configureTopBarWithNavigationOptionsModule = require(appChat.configureTopBarWithNavigationOptions)
local conversationStackNavigatorModule = require(script.Parent.conversationStackNavigator)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local chatConversationTopBarModule = require(appChat.Components.TopBar.ChatConversationTopBar)
local chatTopBarBaseModule = require(appChat.Components.TopBar.ChatTopBarBase)
local systemMenuTopBarModule = require(appChat.Components.TopBar.SystemMenuTopBar)
local squadAddFriendsIconButtonModule = require(appChat.Components.Squads.SquadAddFriendsIconButton)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local useChatWideModeFocusModule = require(appChat.Contexts.ChatWideModeFocus.useChatWideModeFocus)
local t = {
	configureTopBar = configureTopBarWithNavigationOptionsModule,
	createNewNavigator = conversationStackNavigatorModule
}

function ConversationStackNavigatorConnector(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useChatWideModeFocusModule (ref), reactModule (ref), userGameSettingsService (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), enumScreensModule (ref), chatConversationTopBarModule (ref), chatTopBarBaseModule (ref), squadAddFriendsIconButtonModule (ref), systemMenuTopBarModule (ref), fFlagAppChatConsoleFocusFixesModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useStyle()
	local var3 = useChatWideModeFocusModule()
	local _ = nil
	local var4, var5 = reactModule.useState(userGameSettingsService.ReducedMotion)
	reactModule.useEffect(function()
		-- upvalues: userGameSettingsService (copy), var5 (ref)
		local var6 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
			-- upvalues: var5 (copy), userGameSettingsService (copy)
			var5(userGameSettingsService.ReducedMotion)
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, {})
	local var6 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), var4 (ref)
		local var7 = var1.createNewNavigator({
			transparent = true,
			cardColor3 = var2.Theme.BackgroundDefault.Color
		}, var4)
		var1.setRouter(var7.router)
		
		return var7
	end, { var2.Theme.BackgroundDefault.Color, var4 })
	local var7 = nil
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
		local state = var1.navigation and var1.navigation.state
		local routeName = state and (state.routes and (state.index and (state.routes[state.index] and (state.routes[state.index].routeName or nil))))
		
		if routeName == enumScreensModule.ChatConversation then
			var7 = reactModule.createElement(chatConversationTopBarModule, {
				screenName = enumScreensModule.ChatConversation,
				navigation = var1.navigation
			})
		elseif routeName == enumScreensModule.ChatDetails then
			var7 = reactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.ChatDetails,
				navigation = var1.navigation
			})
		elseif routeName == enumScreensModule.SquadLobby then
			var7 = reactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadLobby,
				navigation = var1.navigation,
				renderRight = function()
					-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), var1 (ref)
					return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = var1.navigation })
				end
			})
		elseif routeName == enumScreensModule.SquadInviteFriends then
			var7 = reactModule.createElement(systemMenuTopBarModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				navigation = var1.navigation
			})
		end
	end
	var7 = var7 or var1.configureTopBar(var1.navigation)
	local topBarHeight = var1.navigation.getScreenProps("topBarHeight", 0)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = if fFlagAppChatConsoleFocusFixesModule then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 0, topBarHeight),
			ref = var3 and var3.conversationTopBarRef
		}, { Content = var7 }) else var7,
		navigatorFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -topBarHeight),
			ref = if fFlagAppChatConsoleFocusFixesModule and var3 then var3.conversationPanelRef else nil
		}, { navigator = reactModule.createElement(var6, var1) })
	})
end

local conversationStackNavigatorConnectorWrapper = reactModule.PureComponent:extend("ConversationStackNavigatorConnectorWrapper")
conversationStackNavigatorConnectorWrapper.router = conversationStackNavigatorModule().router

function conversationStackNavigatorConnectorWrapper.render(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), conversationStackNavigatorConnectorWrapper (ref)
	return reactModule.createElement(ConversationStackNavigatorConnector, cryoModule.Dictionary.join(p1.props, {
		setRouter = function(value)
			-- upvalues: conversationStackNavigatorConnectorWrapper (copy)
			conversationStackNavigatorConnectorWrapper.router = value
		end
	}))
end

return conversationStackNavigatorConnectorWrapper