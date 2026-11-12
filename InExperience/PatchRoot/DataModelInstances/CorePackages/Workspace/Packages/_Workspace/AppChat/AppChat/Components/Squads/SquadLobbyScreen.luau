local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local Parent = AppChat.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(Parent.Squads.ModelTypes)
local SquadLobbyModule = require(Parent.Squads.SquadLobby)
local SquadAddFriendsIconButtonModule = require(script.Parent.SquadAddFriendsIconButton)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SquadLobbyScreen = ReactModule.PureComponent:extend("SquadLobbyScreen")
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local WithChatPlacementContextFunction = ChatPlacementContextModule.withChatPlacementContext
local ParentContainerContextModule = require(AppChat.Contexts.ParentContainer.ParentContainerContext)
local FFlagEnablePartyVoiceChangersInLua = SharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local FFlagAppChatIxpScreenExposureModule = require(AppChat.Flags.FFlagAppChatIxpScreenExposure)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local IXPNavigationUtilsModule = require(AppChat.Utils.IXPNavigationUtils)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local List = {
	EnumScreensModule.SquadLobby,
	EnumScreensModule.SquadInviteFriends,
	EnumScreensModule.SquadVoiceReportAbuse
}

if FFlagEnablePartyVoiceChangersInLua then
	table.insert(List, EnumScreensModule.SquadVoiceChangers)
end
local function NavigationOptions(p1)
	-- upvalues: ReactModule (copy), SquadAddFriendsIconButtonModule (copy)
	local Navigation = p1.navigation
	
	return {
		renderRight = function()
			-- upvalues: ReactModule (upval), SquadAddFriendsIconButtonModule (upval), Navigation (copy)
			return ReactModule.createElement(SquadAddFriendsIconButtonModule, { navigation = Navigation })
		end
	}
end

function SquadLobbyScreen.init(p1)
	-- upvalues: FFlagAppChatIxpScreenExposureModule (copy), IXPNavigationUtilsModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), RoactNavigationModule (copy), FFlagEnablePartyVoiceChangersInLua (copy), List (copy)
	p1.ixpSubscription = if FFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.PartyLobbyPage") else nil
	local Navigation = p1.props.navigation
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.SquadLobby, { backButtonEnabled = true })
	p1.state = { isFocused = Navigation.isFocused() }
	p1.willFocusSubscription = Navigation.addListener(RoactNavigationModule.Events.WillFocus, function()
		-- upvalues: p1 (copy)
		p1:setState({ isFocused = true })
	end)
	p1.didBlurSubscription = Navigation.addListener(RoactNavigationModule.Events.DidBlur, function()
		-- upvalues: p1 (copy)
		p1:setState({ isFocused = false })
	end)
	p1.hasNavigatedAwayFromSquad = false
	
	function p1:navigateToHomePage()
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		local NavigateToLuaAppPagesScreenProp: () -> () = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.Home]
		
		if NavigateToLuaAppPagesScreenProp then
			NavigateToLuaAppPagesScreenProp()
		end
	end
	
	function p1.openViewProfile(p2)
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		local NavigateToLuaAppPagesScreenProp: (any, any) -> () = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.ViewUserProfile]
		
		if NavigateToLuaAppPagesScreenProp then
			NavigateToLuaAppPagesScreenProp(p2, {})
		end
	end
	
	function p1.openSquadVoiceAbuseReport(ReportData)
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		p1.props.navigation.navigate(EnumScreensModule.SquadVoiceReportAbuse, { reportData = ReportData })
	end
	
	if FFlagEnablePartyVoiceChangersInLua then
		function p1.openSquadVoiceChangers()
			-- upvalues: p1 (copy), EnumScreensModule (upval)
			p1.props.navigation.navigate(EnumScreensModule.SquadVoiceChangers)
		end
	end
	function p1.navigateToSquadInviteFriends(ConversationId)
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		p1.props.navigation.navigate(EnumScreensModule.SquadInviteFriends, { conversationId = ConversationId })
	end
	
	function p1.navigateAwayFromSquad()
		-- upvalues: p1 (copy), List (upval)
		if p1.hasNavigatedAwayFromSquad then return end
		local DangerouslyGetParentResult = p1.props.navigation._dangerouslyGetParent()
		
		if DangerouslyGetParentResult then
			local State = DangerouslyGetParentResult.state
			
			if State then
				local Key = nil
				
				for i = State.index, 1, -1 do
					local Route = State.routes[i]
					
					if table.find(List, Route.routeName) then
						Key = Route.key
						continue
					elseif Key then
						p1.hasNavigatedAwayFromSquad = true
						p1.props.navigation.goBack(Key)
					end
					break
				end
			end
		end
	end
end

function SquadLobbyScreen.willUnmount(p2)
	if p2.ixpSubscription then
		p2.ixpSubscription.remove()
	end
	if p2.willFocusSubscription then
		p2.willFocusSubscription:remove()
	end
	if p2.didBlurSubscription then
		p2.didBlurSubscription:remove()
	end
end

function SquadLobbyScreen.render(p2)
	-- upvalues: WithChatPlacementContextFunction (copy), ChatPlacementContextModule (copy), ReactModule (copy), SquadLobbyModule (copy), FFlagEnablePartyVoiceChangersInLua (copy), FFlagExpChatEnableFriendsTab (copy), ParentContainerContextModule (copy)
	return WithChatPlacementContextFunction(function(p3)
		-- upvalues: p2 (copy), ChatPlacementContextModule (upval), ReactModule (upval), SquadLobbyModule (upval), FFlagEnablePartyVoiceChangersInLua (upval), FFlagExpChatEnableFriendsTab (upval), ParentContainerContextModule (upval)
		local IsPlacementInExperience = ChatPlacementContextModule.isPlacementInExperience(p3.chatPlacement)
		
		if p2.state.isFocused then
			local function v31(NavigateToChat)
				-- upvalues: ReactModule (upval), SquadLobbyModule (upval), p2 (upval), FFlagEnablePartyVoiceChangersInLua (upval), IsPlacementInExperience (copy)
				return ReactModule.createElement(SquadLobbyModule, {
					navigateToHomePage = p2.navigateToHomePage,
					openViewProfile = p2.openViewProfile,
					openSquadVoiceAbuseReport = p2.openSquadVoiceAbuseReport,
					navigateAwayFromSquad = p2.navigateAwayFromSquad,
					navigateToChat = NavigateToChat,
					navigateToSquadInviteFriends = p2.navigateToSquadInviteFriends,
					openSquadVoiceChangers = if FFlagEnablePartyVoiceChangersInLua then p2.openSquadVoiceChangers else nil,
					isInExperience = IsPlacementInExperience,
					isWideMode = p2.props.isWideMode
				})
			end
			
			return if FFlagExpChatEnableFriendsTab and IsPlacementInExperience then ReactModule.createElement(ParentContainerContextModule.Consumer, {
				render = function(p4)
					-- upvalues: v31 (copy), p2 (upval)
					return v31(function(p5)
						-- upvalues: p4 (copy), p2 (upval)
						return p4.openFriendsChatConversation(p5):andThen(function(Result)
							-- upvalues: p2 (upval)
							p2.navigateAwayFromSquad()
							
							return Result
						end)
					end)
				end
			}) else v31(nil)
		else
			return nil
		end
	end)
end

local WideSquadLobbyScreen = ReactModule.PureComponent:extend("WideSquadLobbyScreen")
WideSquadLobbyScreen.navigationOptions = NavigationOptions

function WideSquadLobbyScreen:init() end

function WideSquadLobbyScreen.render(p2)
	-- upvalues: ReactModule (copy), SquadLobbyScreen (copy), CryoModule (copy)
	return ReactModule.createElement(SquadLobbyScreen, CryoModule.Dictionary.union(p2.props, { isWideMode = true }))
end

local CompactSquadLobbyScreen = ReactModule.PureComponent:extend("CompactSquadLobbyScreen")
CompactSquadLobbyScreen.navigationOptions = NavigationOptions

function CompactSquadLobbyScreen:init() end

function CompactSquadLobbyScreen.render(p2)
	-- upvalues: ReactModule (copy), SquadLobbyScreen (copy), CryoModule (copy)
	return ReactModule.createElement(SquadLobbyScreen, CryoModule.Dictionary.union(p2.props, { isWideMode = false }))
end

return {
	WideSquadLobbyScreen = WideSquadLobbyScreen,
	CompactSquadLobbyScreen = CompactSquadLobbyScreen
}