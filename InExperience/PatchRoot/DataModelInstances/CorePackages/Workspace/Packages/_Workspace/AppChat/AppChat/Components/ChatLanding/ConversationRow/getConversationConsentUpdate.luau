local AppChat = script:FindFirstAncestor("AppChat")
local ConstantsModule = require(AppChat.Constants)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local config = {
	[ConstantsModule.OptInVariant.OsaContextCard] = {
		field = "osaAcknowledgementStatus",
		value = ConversationChannelsModule.OsaAcknowledgementStatus.Acknowledged
	},
	[ConstantsModule.OptInVariant.ChatOptInInfoCard] = {
		field = "userOptedIntoChatMessages",
		value = ConversationChannelsModule.UserOptedIntoChatMessagesStatus.OptedIn
	}
}

return function(p1)
	-- upvalues: config (copy)
	return if p1 == nil then nil else config[p1]
end