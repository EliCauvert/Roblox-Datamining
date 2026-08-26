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

return function(p1)
	-- upvalues: t (ref)
	return if p1 == nil then nil else t[p1]
end