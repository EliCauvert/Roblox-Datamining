local analytics = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).Analytics

local function getCounterName(p0)
	if p0.Status == Enum.TextChatMessageStatus.Success then
		local textChannel = p0.TextChannel
		
		if textChannel then
			local name = textChannel.Name
			
			return if string.find(name, "^RBX") == nil then "expChatMessageReceivedSuccessCustom" elseif name == "RBXGeneral" then "expChatMessageReceivedSuccessGeneral" elseif name == "RBXSystem" then "expChatMessageReceivedSuccessSystem" elseif string.find(name, "^RBXWhisper") then "expChatMessageReceivedSuccessWhisper" elseif string.find(name, "^RBXTeam") then "expChatMessageReceivedSuccessTeam" else "expChatMessageReceivedSuccessCustom"
		end
	end
	return if p0.Status == Enum.TextChatMessageStatus.Unknown then "expChatMessageReceivedUnknown" elseif p0.Status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then "expChatMessageReceivedInvalidTextChannelPermissions" elseif p0.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then "expChatMessageReceivedInvalidPrivacySettings" elseif p0.Status == Enum.TextChatMessageStatus.TextFilterFailed then "expChatMessageReceivedTextFilterFailed" elseif p0.Status == Enum.TextChatMessageStatus.Floodchecked then "expChatMessageReceivedFloodchecked" elseif p0.Status == Enum.TextChatMessageStatus.MessageTooLong then "expChatMessageReceivedMessageTooLong" elseif p0.Status == Enum.TextChatMessageStatus.ModerationTimeout then "expChatMessageReceivedModerationTimeout" else nil
end

return function(p1, p2)
	-- upvalues: getCounterName (ref), analytics (ref)
	local textSource = p2.TextSource
	
	if textSource and p1 == textSource.UserId then
		local var1 = getCounterName(p2)
		
		if var1 then
			analytics.reportCounter(var1)
		end
	end
end