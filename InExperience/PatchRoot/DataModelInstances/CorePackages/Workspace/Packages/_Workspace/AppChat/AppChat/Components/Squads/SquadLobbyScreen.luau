local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local parent = appChat.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local _ = require(parent.Squads.ModelTypes)
local squadLobbyModule = require(parent.Squads.SquadLobby)
local squadAddFriendsIconButtonModule = require(script.Parent.SquadAddFriendsIconButton)
local roactNavigationModule = require(parent.RoactNavigation)
local squadLobbyScreen = reactModule.PureComponent:extend("SquadLobbyScreen")
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local withChatPlacementContext = chatPlacementContextModule.withChatPlacementContext
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local fFlagEnablePartyVoiceChangersInLua = sharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local list = {
	enumScreensModule.SquadLobby,
	enumScreensModule.SquadInviteFriends,
	enumScreensModule.SquadVoiceReportAbuse
}

if fFlagEnablePartyVoiceChangersInLua then
	table.insert(list, enumScreensModule.SquadVoiceChangers)
end
local var1 = function(p1)
	-- upvalues: reactModule (ref), squadAddFriendsIconButtonModule (ref)
	local navigation = p1.navigation
	
	return {
		renderRight = function()
			-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), navigation (ref)
			return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = navigation })
		end
	}
end

function squadLobbyScreen.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), roactNavigationModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), list (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.PartyLobbyPage") else nil
	local navigation = p1.props.navigation
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadLobby, { backButtonEnabled = true })
	end
	p1.state = { isFocused = navigation.isFocused() }
	p1.willFocusSubscription = navigation.addListener(roactNavigationModule.Events.WillFocus, function()
		-- upvalues: p1 (ref)
		p1:setState({ isFocused = true })
	end)
	p1.didBlurSubscription = navigation.addListener(roactNavigationModule.Events.DidBlur, function()
		-- upvalues: p1 (ref)
		p1:setState({ isFocused = false })
	end)
	p1.hasNavigatedAwayFromSquad = false
	
	function p1.navigateToHomePage(_)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		local home = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.Home]
		
		if home then
			home()
		end
	end
	
	function p1.openViewProfile(p2)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		local viewUserProfile = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
		
		if viewUserProfile then
			viewUserProfile(p2, {})
		end
	end
	
	function p1.openSquadVoiceAbuseReport(p2)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadVoiceReportAbuse, { reportData = p2 })
	end
	
	if fFlagEnablePartyVoiceChangersInLua then
		function p1.openSquadVoiceChangers()
			-- upvalues: p1 (ref), enumScreensModule (copy)
			p1.props.navigation.navigate(enumScreensModule.SquadVoiceChangers)
		end
	end
	function p1.navigateToSquadInviteFriends(p2)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadInviteFriends, { conversationId = p2 })
	end
	
	function p1.navigateAwayFromSquad()
		-- upvalues: p1 (ref), list (copy)
		if p1.hasNavigatedAwayFromSquad then return end
		local var2 = p1.props.navigation._dangerouslyGetParent()
		
		if var2 then
			local state = var2.state
			
			if state then
				local key = nil
				
				for i = state.index, 1, -1 do
					local var3 = state.routes[i]
					
					if table.find(list, var3.routeName) then
						key = var3.key
						continue
					end
					if key then
						p1.hasNavigatedAwayFromSquad = true
						p1.props.navigation.goBack(key)
					end
					return
				end
			end
		end
	end
end

function squadLobbyScreen.willUnmount(p2)
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

function squadLobbyScreen.render(p2)
	-- upvalues: withChatPlacementContext (ref), chatPlacementContextModule (ref), reactModule (ref), squadLobbyModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), fFlagExpChatEnableFriendsTab (ref), parentContainerContextModule (ref)
	return withChatPlacementContext(function(p3)
		-- upvalues: p2 (ref), chatPlacementContextModule (copy), reactModule (copy), squadLobbyModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), fFlagExpChatEnableFriendsTab (copy), parentContainerContextModule (copy)
		local var2 = chatPlacementContextModule.isPlacementInExperience(p3.chatPlacement)
		
		if not p2.state.isFocused then
			return nil
		end
		local var3 = function(p4)
			-- upvalues: reactModule (copy), squadLobbyModule (copy), p2 (copy), fFlagEnablePartyVoiceChangersInLua (copy), var2 (ref)
			return reactModule.createElement(squadLobbyModule, {
				navigateToHomePage = p2.navigateToHomePage,
				openViewProfile = p2.openViewProfile,
				openSquadVoiceAbuseReport = p2.openSquadVoiceAbuseReport,
				navigateAwayFromSquad = p2.navigateAwayFromSquad,
				navigateToChat = p4,
				navigateToSquadInviteFriends = p2.navigateToSquadInviteFriends,
				openSquadVoiceChangers = if fFlagEnablePartyVoiceChangersInLua then p2.openSquadVoiceChangers else nil,
				isInExperience = var2,
				isWideMode = p2.props.isWideMode
			})
		end
		
		return if fFlagExpChatEnableFriendsTab and var2 then reactModule.createElement(parentContainerContextModule.Consumer, {
			render = function(p4)
				-- upvalues: var3 (ref), p2 (copy)
				return var3(function(p5)
					-- upvalues: p4 (ref), p2 (copy)
					return p4.openFriendsChatConversation(p5):andThen(function(p6)
						-- upvalues: p2 (copy)
						p2.navigateAwayFromSquad()
						
						return p6
					end)
				end)
			end
		}) else var3(nil)
	end)
end

local wideSquadLobbyScreen = reactModule.PureComponent:extend("WideSquadLobbyScreen")
wideSquadLobbyScreen.navigationOptions = var1

function wideSquadLobbyScreen.init(_) end

function wideSquadLobbyScreen.render(p2)
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p2.props, { isWideMode = true }))
end

local compactSquadLobbyScreen = reactModule.PureComponent:extend("CompactSquadLobbyScreen")
compactSquadLobbyScreen.navigationOptions = var1

function compactSquadLobbyScreen.init(_) end

function compactSquadLobbyScreen.render(p2)
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p2.props, { isWideMode = false }))
end

return {
	WideSquadLobbyScreen = wideSquadLobbyScreen,
	CompactSquadLobbyScreen = compactSquadLobbyScreen
}