local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local EnumScreensModule = require(AppChat.EnumScreens)
local ConversationStackNavigatorModule = require(script.Parent.conversationStackNavigator)
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local ChatConversationTopBarModule = require(AppChat.Components.TopBar.ChatConversationTopBar)
local ChatTopBarBaseModule = require(AppChat.Components.TopBar.ChatTopBarBase)
local SystemMenuTopBarModule = require(AppChat.Components.TopBar.SystemMenuTopBar)
local SquadAddFriendsIconButtonModule = require(AppChat.Components.Squads.SquadAddFriendsIconButton)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local config = {
	configureTopBar = require(AppChat.configureTopBarWithNavigationOptions),
	createNewNavigator = ConversationStackNavigatorModule
}

function ConversationStackNavigatorConnector(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), UserGameSettings (copy), FFlagAppChatTopBarConfigDrivenModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), EnumScreensModule (copy), ChatConversationTopBarModule (copy), ChatTopBarBaseModule (copy), SquadAddFriendsIconButtonModule (copy), SystemMenuTopBarModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.ReducedMotion)
	ReactModule.useEffect(function()
		-- upvalues: UserGameSettings (upval), UseStateResult2 (copy)
		local Connection = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserGameSettings (upval)
			UseStateResult2(UserGameSettings.ReducedMotion)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UnionResult (copy), UseStyleResult (copy), UseStateResult (copy)
		local NewNavigator = UnionResult.createNewNavigator({
			transparent = true,
			cardColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, UseStateResult)
		UnionResult.setRouter(NewNavigator.router)
		
		return NewNavigator
	end, {
		UseStyleResult.Theme.BackgroundDefault.Color,
		UseStateResult
	})
	local Element = nil
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		if FFlagAppChatPerfTrackingModule then
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
		local State = UnionResult.navigation and UnionResult.navigation.state
		local RouteName = State and State.routes and State.index and State.routes[State.index] and State.routes[State.index].routeName or nil
		
		if RouteName == EnumScreensModule.ChatConversation then
			Element = ReactModule.createElement(ChatConversationTopBarModule, {
				screenName = EnumScreensModule.ChatConversation,
				navigation = UnionResult.navigation
			})
		elseif RouteName == EnumScreensModule.ChatDetails then
			Element = ReactModule.createElement(ChatTopBarBaseModule, {
				screenName = EnumScreensModule.ChatDetails,
				navigation = UnionResult.navigation
			})
		elseif RouteName == EnumScreensModule.SquadLobby then
			Element = ReactModule.createElement(ChatTopBarBaseModule, {
				screenName = EnumScreensModule.SquadLobby,
				navigation = UnionResult.navigation,
				renderRight = function()
					-- upvalues: ReactModule (upval), SquadAddFriendsIconButtonModule (upval), UnionResult (copy)
					return ReactModule.createElement(SquadAddFriendsIconButtonModule, { navigation = UnionResult.navigation })
				end
			})
		elseif RouteName == EnumScreensModule.SquadInviteFriends then
			Element = ReactModule.createElement(SystemMenuTopBarModule, {
				screenName = EnumScreensModule.SquadInviteFriends,
				navigation = UnionResult.navigation
			})
		end
	end
	if not Element then
		Element = UnionResult.configureTopBar(UnionResult.navigation)
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		layout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = Element,
		navigatorFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -UnionResult.navigation.getScreenProps("topBarHeight", 0))
		}, {
			navigator = ReactModule.createElement(UseMemoResult, UnionResult)
		})
	})
end

local ConversationStackNavigatorConnectorWrapper = ReactModule.PureComponent:extend("ConversationStackNavigatorConnectorWrapper")
ConversationStackNavigatorConnectorWrapper.router = ConversationStackNavigatorModule().router

function ConversationStackNavigatorConnectorWrapper.render(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), ConversationStackNavigatorConnectorWrapper (copy)
	return ReactModule.createElement(ConversationStackNavigatorConnector, CryoModule.Dictionary.join(p1.props, {
		setRouter = function(Router)
			-- upvalues: ConversationStackNavigatorConnectorWrapper (upval)
			ConversationStackNavigatorConnectorWrapper.router = Router
		end
	}))
end

return ConversationStackNavigatorConnectorWrapper