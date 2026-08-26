local communicationChannelsTypesModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.CommunicationChannelsTypes)
local t = { kind = "ignore", channelId = nil }
local t_1 = {
	MessageCreated = "fetchMessage",
	SystemMessageCreated = "fetchMessage",
	ChannelDeleted = "removeConversation",
	RemovedFromChannel = "removeConversation",
	ChannelArchived = "removeConversation",
	ChannelUpdated = "fetchConversationDetails",
	ParticipantsAdded = "fetchConversationDetails",
	ParticipantsRemoved = "fetchConversationDetails",
	ChannelMetadataUpdated = "fetchConversationDetails",
	AddedToChannel = "fetchConversationDetails",
	ChannelCreated = "fetchConversationDetails",
	ChannelUnarchived = "fetchConversationDetails",
	ChannelMarkedRead = "fetchConversationDetails"
}

return function(p1)
	-- upvalues: t (ref), communicationChannelsTypesModule (ref), t_1 (ref)
	if p1 == nil then
		return t
	elseif p1.ChannelVertical ~= "PlatformChat" then
		return t
	elseif table.find(communicationChannelsTypesModule.ChannelTypeAllowlist, p1.ChannelType) == nil then
		return t
	end
	local type = t_1[p1.Type]
	
	if type == nil then
		return t
	end
	local channelId = p1.ChannelId
	
	return if channelId == nil or channelId == "" then t else { kind = type, channelId = channelId }
end