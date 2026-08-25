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

function ConversationStackNavigatorConnector(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), userGameSettingsService (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), enumScreensModule (ref), chatConversationTopBarModule (ref), chatTopBarBaseModule (ref), squadAddFriendsIconButtonModule (ref), systemMenuTopBarModule (ref)
	local var16 = cryoModule.Dictionary.union(t, p0)
	local var17 = useStyle()
	local _ = nil
	local var18, var19 = reactModule.useState(userGameSettingsService.ReducedMotion)
	reactModule.useEffect(function()
		-- upvalues: userGameSettingsService (copy), var19 (ref)
		local var24 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
			-- upvalues: var19 (copy), userGameSettingsService (copy)
			var19(userGameSettingsService.ReducedMotion)
		end)
		
		return function()
			-- upvalues: var24 (ref)
			var24:Disconnect()
		end
	end, {})
	local var20 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), var17 (ref), var18 (ref)
		local var25 = var16.createNewNavigator({
			transparent = true,
			cardColor3 = var17.Theme.BackgroundDefault.Color
		}, var18)
		var16.setRouter(var25.router)
		
		return var25
	end, { var17.Theme.BackgroundDefault.Color, var18 })
	local var21 = nil
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
		local state = var16.navigation and var16.navigation.state
		local routeName = state and (state.routes and (state.index and (state.routes[state.index] and (state.routes[state.index].routeName or nil))))
		
		if routeName == enumScreensModule.ChatConversation then
			var21 = reactModule.createElement(chatConversationTopBarModule, {
				screenName = enumScreensModule.ChatConversation,
				navigation = var16.navigation
			})
		elseif routeName == enumScreensModule.ChatDetails then
			var21 = reactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.ChatDetails,
				navigation = var16.navigation
			})
		elseif routeName == enumScreensModule.SquadLobby then
			var21 = reactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadLobby,
				navigation = var16.navigation,
				renderRight = function()
					-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), var16 (ref)
					return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = var16.navigation })
				end
			})
		elseif routeName == enumScreensModule.SquadInviteFriends then
			var21 = reactModule.createElement(systemMenuTopBarModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				navigation = var16.navigation
			})
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = var21 or var16.configureTopBar(var16.navigation),
		navigatorFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -var16.navigation.getScreenProps("topBarHeight", 0))
		}, { navigator = reactModule.createElement(var20, var16) })
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