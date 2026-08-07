local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local withLocalization = require(parent.Localization).withLocalization
local universalAppPolicy = require(parent.UniversalAppPolicy).UniversalAppPolicy
local chatDisabledIndicatorModule = require(script.Parent.ChatDisabledIndicator)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local emptyConversationList = roactModule.PureComponent:extend("EmptyConversationList")
emptyConversationList.defaultProps = {
	chatEnabled = false,
	privacyButtonKey = "Feature.Chat.Label.PrivacySettings",
	privacyButtonEnabled = true,
	renameFriendsToConnections = true,
	navigateToPrivacy = function() --[[ line: 19 ]] end,
	makeFriendsToChatKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.MakeFriendsToParty" else "Feature.Chat.Message.MakeFriendsToChat",
	turnOnChatKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.TurnOnParty" else "Feature.Chat.Message.TurnOnChat"
}
local t = {
	makeFriendsToChatKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.MakeConnectionsToParty" else "Feature.Chat.Message.MakeConnectionsToChat",
	turnOnChatKey = if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.EnableParty.FriendsRename" else "Feature.Chat.Message.EnableParty" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.EnableChat.FriendsRename" else "Feature.Chat.Message.EnableChat"
}

function emptyConversationList.didMount(p0) --[[ line: 45 ]]
	if p0.props.fireRenderEvent then
		p0.props.fireRenderEvent()
	end
end

function emptyConversationList.render(p1) --[[ line: 51 ]]
	-- upvalues: t (ref), withLocalization (ref), withStyle (ref), roactModule (ref), chatDisabledIndicatorModule (ref)
	local makeFriendsToChatKey = p1.props.makeFriendsToChatKey
	local turnOnChatKey = p1.props.turnOnChatKey
	
	if p1.props.renameFriendsToConnections then
		makeFriendsToChatKey = t[makeFriendsToChatKey]
		turnOnChatKey = t[turnOnChatKey]
	end
	return withLocalization({
		privacyButtonText = p1.props.privacyButtonKey,
		chatDisabledText = if p1.props.chatEnabled then makeFriendsToChatKey else turnOnChatKey
	})(function(p2) --[[ line: 61 ]]
		-- upvalues: withStyle (copy), roactModule (copy), chatDisabledIndicatorModule (copy), p1 (ref)
		return withStyle(function(p3) --[[ line: 62 ]]
			-- upvalues: roactModule (copy), chatDisabledIndicatorModule (copy), p1 (copy), p2 (ref)
			return roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
				BackgroundTransparency = p3.Tokens.Color.None.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				ChatDisabledIndicator = roactModule.createElement(chatDisabledIndicatorModule, {
					chatEnabled = p1.props.chatEnabled,
					navigateToPrivacy = p1.props.navigateToPrivacy,
					chatDisabledText = p2.chatDisabledText,
					privacyButtonText = p2.privacyButtonText,
					privacyButtonEnabled = p1.props.privacyButtonEnabled
				})
			})
		end)
	end)
end

return universalAppPolicy.connect(function(p4) --[[ line: 82 ]]
	return {
		renameFriendsToConnections = p4.getRenameFriendsToConnections()
	}
end)(emptyConversationList)