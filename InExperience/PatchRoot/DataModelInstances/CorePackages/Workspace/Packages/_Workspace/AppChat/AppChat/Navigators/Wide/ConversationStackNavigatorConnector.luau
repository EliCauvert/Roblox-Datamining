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
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local t = {
	configureTopBar = configureTopBarWithNavigationOptionsModule,
	createNewNavigator = conversationStackNavigatorModule
}

function ConversationStackNavigatorConnector(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), userGameSettingsService (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), enumScreensModule (ref), chatConversationTopBarModule (ref), chatTopBarBaseModule (ref), squadAddFriendsIconButtonModule (ref), systemMenuTopBarModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useStyle()
	local _ = nil
	local var3, var4 = reactModule.useState(userGameSettingsService.ReducedMotion)
	reactModule.useEffect(function()
		-- upvalues: userGameSettingsService (copy), var4 (ref)
		local var5 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
			-- upvalues: var4 (copy), userGameSettingsService (copy)
			var4(userGameSettingsService.ReducedMotion)
		end)
		
		return function()
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, {})
	local var5 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), var3 (ref)
		local var6 = var1.createNewNavigator({
			transparent = true,
			cardColor3 = var2.Theme.BackgroundDefault.Color
		}, var3)
		var1.setRouter(var6.router)
		
		return var6
	end, { var2.Theme.BackgroundDefault.Color, var3 })
	local var6 = nil
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
		local state = var1.navigation and var1.navigation.state
		local routeName = state and (state.routes and (state.index and (state.routes[state.index] and (state.routes[state.index].routeName or nil))))
		
		if routeName == enumScreensModule.ChatConversation then
			var6 = reactModule.createElement(chatConversationTopBarModule, {
				screenName = enumScreensModule.ChatConversation,
				navigation = var1.navigation
			})
		elseif routeName == enumScreensModule.ChatDetails then
			var6 = reactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.ChatDetails,
				navigation = var1.navigation
			})
		elseif routeName == enumScreensModule.SquadLobby then
			var6 = reactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadLobby,
				navigation = var1.navigation,
				renderRight = function()
					-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), var1 (ref)
					return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = var1.navigation })
				end
			})
		elseif routeName == enumScreensModule.SquadInviteFriends then
			var6 = reactModule.createElement(systemMenuTopBarModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				navigation = var1.navigation
			})
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = var6 or var1.configureTopBar(var1.navigation),
		navigatorFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -var1.navigation.getScreenProps("topBarHeight", 0))
		}, { navigator = reactModule.createElement(var5, var1) })
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