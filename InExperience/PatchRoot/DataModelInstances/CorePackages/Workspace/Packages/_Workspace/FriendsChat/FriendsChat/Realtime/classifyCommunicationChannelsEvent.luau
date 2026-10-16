local CommunicationChannelsTypesModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.CommunicationChannelsTypes)
local config = { kind = "ignore", channelId = nil }
local config1 = {
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

return function(p1) --[[ Line: 66 | Named "classifyCommunicationChannelsEvent" ]]
	-- upvalues: config (copy), CommunicationChannelsTypesModule (copy), config1 (copy)
	if p1 == nil then
		return config
	elseif p1.ChannelVertical ~= "PlatformChat" then
		return config
	elseif table.find(CommunicationChannelsTypesModule.ChannelTypeAllowlist, p1.ChannelType) == nil then
		return config
	else
		local Entry = config1[p1.Type]
		
		if Entry == nil then
			return config
		else
			local ChannelId = p1.ChannelId
			
			return if ChannelId == nil or ChannelId == "" then config else { kind = Entry, channelId = ChannelId }
		end
	end
end