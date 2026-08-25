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
local var16 = function(p0)
	-- upvalues: reactModule (ref), squadAddFriendsIconButtonModule (ref)
	local navigation = p0.navigation
	
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
	
	function p1.openSquadVoiceAbuseReport(p3)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadVoiceReportAbuse, { reportData = p3 })
	end
	
	if fFlagEnablePartyVoiceChangersInLua then
		function p1.openSquadVoiceChangers()
			-- upvalues: p1 (ref), enumScreensModule (copy)
			p1.props.navigation.navigate(enumScreensModule.SquadVoiceChangers)
		end
	end
	function p1.navigateToSquadInviteFriends(p4)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.SquadInviteFriends, { conversationId = p4 })
	end
	
	function p1.navigateAwayFromSquad()
		-- upvalues: p1 (ref), list (copy)
		if p1.hasNavigatedAwayFromSquad then return end
		local var19 = p1.props.navigation._dangerouslyGetParent()
		
		if var19 then
			local state = var19.state
			
			if state then
				local key = nil
				
				for i = state.index, 1, -1 do
					local var20 = state.routes[i]
					
					if table.find(list, var20.routeName) then
						key = var20.key
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

function squadLobbyScreen.willUnmount(p5)
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

function squadLobbyScreen.render(p6)
	-- upvalues: withChatPlacementContext (ref), chatPlacementContextModule (ref), reactModule (ref), squadLobbyModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), fFlagExpChatEnableFriendsTab (ref), parentContainerContextModule (ref)
	return withChatPlacementContext(function(p7)
		-- upvalues: p6 (ref), chatPlacementContextModule (copy), reactModule (copy), squadLobbyModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), fFlagExpChatEnableFriendsTab (copy), parentContainerContextModule (copy)
		local var21 = chatPlacementContextModule.isPlacementInExperience(p7.chatPlacement)
		
		if not p6.state.isFocused then
			return nil
		end
		local var22 = function(p8)
			-- upvalues: reactModule (copy), squadLobbyModule (copy), p6 (copy), fFlagEnablePartyVoiceChangersInLua (copy), var21 (ref)
			return reactModule.createElement(squadLobbyModule, {
				navigateToHomePage = p6.navigateToHomePage,
				openViewProfile = p6.openViewProfile,
				openSquadVoiceAbuseReport = p6.openSquadVoiceAbuseReport,
				navigateAwayFromSquad = p6.navigateAwayFromSquad,
				navigateToChat = p8,
				navigateToSquadInviteFriends = p6.navigateToSquadInviteFriends,
				openSquadVoiceChangers = if fFlagEnablePartyVoiceChangersInLua then p6.openSquadVoiceChangers else nil,
				isInExperience = var21,
				isWideMode = p6.props.isWideMode
			})
		end
		
		return if fFlagExpChatEnableFriendsTab and var21 then reactModule.createElement(parentContainerContextModule.Consumer, {
			render = function(p9)
				-- upvalues: var22 (ref), p6 (copy)
				return var22(function(p10)
					-- upvalues: p9 (ref), p6 (copy)
					return p9.openFriendsChatConversation(p10):andThen(function(p11)
						-- upvalues: p6 (copy)
						p6.navigateAwayFromSquad()
						
						return p11
					end)
				end)
			end
		}) else var22(nil)
	end)
end

local wideSquadLobbyScreen = reactModule.PureComponent:extend("WideSquadLobbyScreen")
wideSquadLobbyScreen.navigationOptions = var16

function wideSquadLobbyScreen.init(_) end

function wideSquadLobbyScreen.render(p12)
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p12.props, { isWideMode = true }))
end

local compactSquadLobbyScreen = reactModule.PureComponent:extend("CompactSquadLobbyScreen")
compactSquadLobbyScreen.navigationOptions = var16

function compactSquadLobbyScreen.init(_) end

function compactSquadLobbyScreen.render(p13)
	-- upvalues: reactModule (ref), squadLobbyScreen (ref), cryoModule (ref)
	return reactModule.createElement(squadLobbyScreen, cryoModule.Dictionary.union(p13.props, { isWideMode = false }))
end

return {
	WideSquadLobbyScreen = wideSquadLobbyScreen,
	CompactSquadLobbyScreen = compactSquadLobbyScreen
}