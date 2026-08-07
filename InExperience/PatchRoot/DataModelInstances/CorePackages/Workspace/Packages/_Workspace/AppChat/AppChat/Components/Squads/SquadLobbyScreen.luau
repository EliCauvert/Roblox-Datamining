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
local fFlagEnablePartyVoiceChangersInLua = sharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
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
local var15 = function(p0) --[[ line: 36 ]]
	-- upvalues: reactModule (ref), squadAddFriendsIconButtonModule (ref)
	local navigation = p0.navigation
	
	return {
		renderRight = function() --[[ line: 40 ]]
			-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), navigation (ref)
			return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = navigation })
		end
	}
end

function squadLobbyScreen.init(p1) --[[ line: 48 ]]
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), roactNavigationModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), list (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.PartyLobbyPage") else nil
	local navigation = p1.props.navigation
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadLobby, { backButtonEnabled = true })
	end
	p1.state = { isFocused = navigation.isFocused() }
	p1.willFocusSubscription = navigation.addListener(roactNavigationModule.Events.WillFocus, function() --[[ line: 61 ]]
		-- upvalues: p1 (ref)
		p1:setState({ isFocused = true })
	end)
	p1.didBlurSubscription = navigation.addListener(roactNavigationModule.Events.DidBlur, function() --[[ line: 64 ]]
		-- upvalues: p1 (ref)
		p1:setState({ isFocused = false })
	end)
	p1.hasNavigatedAwayFromSquad = false
	
	function p1.navigateToHomePage(_) --[[ line: 70 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		local home = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.Home]
		
		if home then
			home()
		end
	end
	
	function p1.openViewProfile(p2) --[[ line: 80 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		local viewUserProfile = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
		
		if viewUserProfile then
			viewUserProfile(p2, {})
		end
	end
	
	function p1.openSquadVoiceAbuseReport(p3) --[[ line: 88 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadVoiceReportAbuse, { reportData = p3 })
	end
	
	if fFlagEnablePartyVoiceChangersInLua then
		function p1.openSquadVoiceChangers() --[[ line: 93 ]]
			-- upvalues: p1 (ref), enumScreensModule (copy)
			p1.props.navigation.navigate(enumScreensModule.SquadVoiceChangers)
		end
	end
	function p1.navigateToSquadInviteFriends(p4) --[[ line: 98 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadInviteFriends, { conversationId = p4 })
	end
	
	function p1.navigateAwayFromSquad() --[[ line: 102 ]]
		-- upvalues: p1 (ref), list (copy)
		if p1.hasNavigatedAwayFromSquad then return end
		local var18 = p1.props.navigation._dangerouslyGetParent()
		
		if var18 then
			local state = var18.state
			
			if state then
				local key = nil
				
				for i = state.index, 1, -1 do
					local var19 = state.routes[i]
					
					if table.find(list, var19.routeName) then
						key = var19.key
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

function squadLobbyScreen.willUnmount(p5) --[[ line: 130 ]]
	if p5.ixpSubscription then
		p5.ixpSubscription.remove()
	end
	if p5.willFocusSubscription then
		p5.willFocusSubscription:remove()
	end
	if p5.didBlurSubscription then
		p5.didBlurSubscription:remove()
	end
end

function squadLobbyScreen.render(p6) --[[ line: 142 ]]
	-- upvalues: withChatPlacementContext (ref), reactModule (ref), squadLobbyModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), chatPlacementContextModule (ref)
	return withChatPlacementContext(function(p7) --[[ line: 143 ]]
		-- upvalues: p6 (ref), reactModule (copy), squadLobbyModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), chatPlacementContextModule (copy)
		return if p6.state.isFocused then reactModule.createElement(squadLobbyModule, {
			navigateToHomePage = p6.navigateToHomePage,
			openViewProfile = p6.openViewProfile,
			openSquadVoiceAbuseReport = p6.openSquadVoiceAbuseReport,
			navigateAwayFromSquad = p6.navigateAwayFromSquad,
			navigateToSquadInviteFriends = p6.navigateToSquadInviteFriends,
			openSquadVoiceChangers = if fFlagEnablePartyVoiceChangersInLua then p6.openSquadVoiceChangers else nil,
			isInExperience = chatPlacementContextModule.isPlacementInExperience(p7.chatPlacement),
			isWideMode = p6.props.isWideMode
		}) else nil
	end)
end

local wideSquadLobbyScreen = reactModule.PureComponent:extend("WideSquadLobbyScreen")
wideSquadLobbyScreen.navigationOptions = var15

function wideSquadLobbyScreen.init(_) --[[ line: 167 ]] end

function wideSquadLobbyScreen.render(p8) --[[ line: 169 ]]
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p8.props, { isWideMode = true }))
end

local compactSquadLobbyScreen = reactModule.PureComponent:extend("CompactSquadLobbyScreen")
compactSquadLobbyScreen.navigationOptions = var15

function compactSquadLobbyScreen.init(_) --[[ line: 175 ]] end

function compactSquadLobbyScreen.render(p9) --[[ line: 176 ]]
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p9.props, { isWideMode = false }))
end

return {
	WideSquadLobbyScreen = wideSquadLobbyScreen,
	CompactSquadLobbyScreen = compactSquadLobbyScreen
}