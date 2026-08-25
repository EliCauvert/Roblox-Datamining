local appChat = script:FindFirstAncestor("AppChat")
local constantsModule = require(appChat.Constants)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local t = {
	[constantsModule.OptInVariant.OsaContextCard] = {
		field = "osaAcknowledgementStatus",
		value = conversationChannelsModule.OsaAcknowledgementStatus.Acknowledged
	},
	[constantsModule.OptInVariant.ChatOptInInfoCard] = {
		field = "userOptedIntoChatMessages",
		value = conversationChannelsModule.UserOptedIntoChatMessagesStatus.OptedIn
	}
}

return function(p0)
	-- upvalues: t (ref)
	return if p0 == nil then nil else t[p0]
end