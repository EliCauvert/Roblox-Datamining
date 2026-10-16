local Analytics = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).Analytics

local function getCounterName(p1) --[[ Line: 5 ]]
	if p1.Status == Enum.TextChatMessageStatus.Success then
		local TextChannel = p1.TextChannel
		
		if TextChannel then
			local Name: string = TextChannel.Name
			
			return if string.find(Name, "^RBX") == nil then "expChatMessageReceivedSuccessCustom" elseif Name == "RBXGeneral" then "expChatMessageReceivedSuccessGeneral" elseif Name == "RBXSystem" then "expChatMessageReceivedSuccessSystem" elseif string.find(Name, "^RBXWhisper") then "expChatMessageReceivedSuccessWhisper" elseif string.find(Name, "^RBXTeam") then "expChatMessageReceivedSuccessTeam" else "expChatMessageReceivedSuccessCustom"
		end
	end
	return if p1.Status == Enum.TextChatMessageStatus.Unknown then "expChatMessageReceivedUnknown" elseif p1.Status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then "expChatMessageReceivedInvalidTextChannelPermissions" elseif p1.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then "expChatMessageReceivedInvalidPrivacySettings" elseif p1.Status == Enum.TextChatMessageStatus.TextFilterFailed then "expChatMessageReceivedTextFilterFailed" elseif p1.Status == Enum.TextChatMessageStatus.Floodchecked then "expChatMessageReceivedFloodchecked" elseif p1.Status == Enum.TextChatMessageStatus.MessageTooLong then "expChatMessageReceivedMessageTooLong" elseif p1.Status == Enum.TextChatMessageStatus.ModerationTimeout then "expChatMessageReceivedModerationTimeout" else nil
end

return function(UserId, p1) --[[ Line: 47 ]]
	-- upvalues: getCounterName (copy), Analytics (copy)
	local TextSource = p1.TextSource
	
	if TextSource and UserId == TextSource.UserId then
		local CounterName = getCounterName(p1)
		
		if CounterName then
			Analytics.reportCounter(CounterName)
		end
	end
end