local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy
local ChatDisabledIndicatorModule = require(script.Parent.ChatDisabledIndicator)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local EmptyConversationList = RoactModule.PureComponent:extend("EmptyConversationList")
EmptyConversationList.defaultProps = {
	chatEnabled = false,
	privacyButtonKey = "Feature.Chat.Label.PrivacySettings",
	privacyButtonEnabled = true,
	renameFriendsToConnections = true,
	navigateToPrivacy = function() end,
	makeFriendsToChatKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.MakeFriendsToParty" else "Feature.Chat.Message.MakeFriendsToChat",
	turnOnChatKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.TurnOnParty" else "Feature.Chat.Message.TurnOnChat"
}
local config = {
	makeFriendsToChatKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.MakeConnectionsToParty" else "Feature.Chat.Message.MakeConnectionsToChat",
	turnOnChatKey = if GetFFlagIsSquadEnabledFunction() then if FFlagConnectionsToFriendsRename then "Feature.Chat.Message.EnableParty.FriendsRename" else "Feature.Chat.Message.EnableParty" elseif FFlagConnectionsToFriendsRename then "Feature.Chat.Message.EnableChat.FriendsRename" else "Feature.Chat.Message.EnableChat"
}

function EmptyConversationList.didMount(p1)
	if p1.props.fireRenderEvent then
		p1.props.fireRenderEvent()
	end
end

function EmptyConversationList.render(p1)
	-- upvalues: config (copy), WithLocalizationFunction (copy), WithStyleFunction (copy), RoactModule (copy), ChatDisabledIndicatorModule (copy)
	local MakeFriendsToChatKey = p1.props.makeFriendsToChatKey
	local TurnOnChatKey = p1.props.turnOnChatKey
	
	if p1.props.renameFriendsToConnections then
		MakeFriendsToChatKey = config[MakeFriendsToChatKey]
		TurnOnChatKey = config[TurnOnChatKey]
	end
	return WithLocalizationFunction({
		privacyButtonText = p1.props.privacyButtonKey,
		chatDisabledText = p1.props.chatEnabled and MakeFriendsToChatKey or TurnOnChatKey
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), ChatDisabledIndicatorModule (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: RoactModule (upval), ChatDisabledIndicatorModule (upval), p1 (upval), p2 (copy)
			return RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
				BackgroundTransparency = p3.Tokens.Color.None.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				ChatDisabledIndicator = RoactModule.createElement(ChatDisabledIndicatorModule, {
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

return UniversalAppPolicy.connect(function(p1)
	return {
		renameFriendsToConnections = p1.getRenameFriendsToConnections()
	}
end)(EmptyConversationList)