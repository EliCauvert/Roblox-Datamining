local communicationChannelsTypesModule = require(script:FindFirstAncestor("ExpChat").Parent.AppChat.CommunicationChannelsTypes)

return function(p0, p1) --[[ line: 28 | named "handleCommunicationChannelsMessageEvent" ]]
	-- upvalues: communicationChannelsTypesModule (ref)
	if p0 == nil then
		return false
	elseif p0.ChannelVertical ~= "PlatformChat" then
		return false
	elseif table.find(communicationChannelsTypesModule.ChannelTypeAllowlist, p0.ChannelType) == nil then
		return false
	elseif p0.Type ~= "MessageCreated" and p0.Type ~= "SystemMessageCreated" then
		return false
	end
	local channelId = p0.ChannelId
	
	if channelId == nil or channelId == "" then
		return false
	end
	p1(channelId)
	
	return true
end