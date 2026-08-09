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
local var13 = function(p0) --[[ line: 33 ]]
	-- upvalues: reactModule (ref), squadAddFriendsIconButtonModule (ref)
	local navigation = p0.navigation
	
	return {
		renderRight = function() --[[ line: 37 ]]
			-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), navigation (ref)
			return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = navigation })
		end
	}
end

function squadLobbyScreen.init(p1) --[[ line: 45 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), roactNavigationModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), list (ref)
	local navigation = p1.props.navigation
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadLobby, { backButtonEnabled = true })
	end
	p1.state = { isFocused = navigation.isFocused() }
	p1.willFocusSubscription = navigation.addListener(roactNavigationModule.Events.WillFocus, function() --[[ line: 55 ]]
		-- upvalues: p1 (ref)
		p1:setState({ isFocused = true })
	end)
	p1.didBlurSubscription = navigation.addListener(roactNavigationModule.Events.DidBlur, function() --[[ line: 58 ]]
		-- upvalues: p1 (ref)
		p1:setState({ isFocused = false })
	end)
	p1.hasNavigatedAwayFromSquad = false
	
	function p1.navigateToHomePage(_) --[[ line: 64 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		local home = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.Home]
		
		if home then
			home()
		end
	end
	
	function p1.openViewProfile(p2) --[[ line: 74 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		local viewUserProfile = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
		
		if viewUserProfile then
			viewUserProfile(p2, {})
		end
	end
	
	function p1.openSquadVoiceAbuseReport(p3) --[[ line: 82 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadVoiceReportAbuse, { reportData = p3 })
	end
	
	if fFlagEnablePartyVoiceChangersInLua then
		function p1.openSquadVoiceChangers() --[[ line: 87 ]]
			-- upvalues: p1 (ref), enumScreensModule (copy)
			p1.props.navigation.navigate(enumScreensModule.SquadVoiceChangers)
		end
	end
	function p1.navigateToSquadInviteFriends(p4) --[[ line: 92 ]]
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadInviteFriends, { conversationId = p4 })
	end
	
	function p1.navigateAwayFromSquad() --[[ line: 96 ]]
		-- upvalues: p1 (ref), list (copy)
		if p1.hasNavigatedAwayFromSquad then return end
		local var16 = p1.props.navigation._dangerouslyGetParent()
		
		if var16 then
			local state = var16.state
			
			if state then
				local key = nil
				
				for i = state.index, 1, -1 do
					local var17 = state.routes[i]
					
					if table.find(list, var17.routeName) then
						key = var17.key
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

function squadLobbyScreen.willUnmount(p5) --[[ line: 124 ]]
	if p5.willFocusSubscription then
		p5.willFocusSubscription:remove()
	end
	if p5.didBlurSubscription then
		p5.didBlurSubscription:remove()
	end
end

function squadLobbyScreen.render(p6) --[[ line: 133 ]]
	-- upvalues: withChatPlacementContext (ref), reactModule (ref), squadLobbyModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), chatPlacementContextModule (ref)
	return withChatPlacementContext(function(p7) --[[ line: 134 ]]
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
wideSquadLobbyScreen.navigationOptions = var13

function wideSquadLobbyScreen.init(_) --[[ line: 158 ]] end

function wideSquadLobbyScreen.render(p8) --[[ line: 160 ]]
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p8.props, { isWideMode = true }))
end

local compactSquadLobbyScreen = reactModule.PureComponent:extend("CompactSquadLobbyScreen")
compactSquadLobbyScreen.navigationOptions = var13

function compactSquadLobbyScreen.init(_) --[[ line: 166 ]] end

function compactSquadLobbyScreen.render(p9) --[[ line: 167 ]]
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p9.props, { isWideMode = false }))
end

return {
	WideSquadLobbyScreen = wideSquadLobbyScreen,
	CompactSquadLobbyScreen = compactSquadLobbyScreen
}