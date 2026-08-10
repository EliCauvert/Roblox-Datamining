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

return function(p0) --[[ line: 66 | named "classifyCommunicationChannelsEvent" ]]
	-- upvalues: t (ref), communicationChannelsTypesModule (ref), t_1 (ref)
	if p0 == nil then
		return t
	elseif p0.ChannelVertical ~= "PlatformChat" then
		return t
	elseif table.find(communicationChannelsTypesModule.ChannelTypeAllowlist, p0.ChannelType) == nil then
		return t
	end
	local type = t_1[p0.Type]
	
	if type == nil then
		return t
	end
	local channelId = p0.ChannelId
	
	return if channelId == nil or channelId == "" then t else { kind = type, channelId = channelId }
end