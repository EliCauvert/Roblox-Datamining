local function _(p0) --[[ line: 3 | named "getOpenChannelName" ]]
	local textChannels = p0.TextChannels
	
	if textChannels == nil then
		return nil
	end
	local targetTextChannel = textChannels.targetTextChannel
	
	if targetTextChannel ~= nil and targetTextChannel.Name ~= nil then
		return targetTextChannel.Name
	end
	local selectedChannelName = textChannels.selectedChannelName
	local channelTabs = p0.ChannelTabs
	
	return if not (selectedChannelName ~= nil and channelTabs ~= nil and channelTabs.allChannelTabs[selectedChannelName] ~= nil) then if channelTabs == nil then selectedChannelName else channelTabs.selectedTabName or "RBXGeneral" else selectedChannelName
end

local _ = function(p1, p2) --[[ line: 28 | named "getMessageChannelName" ]]
	local var0 = nil
	
	if p2 == nil then
		if p1.TextChannel == nil then
			return nil
		end
		var0 = p1.TextChannel.Name
	else
		var0 = p2
	end
	if var0 == "RBXSystem" then
		var0 = "RBXGeneral"
	end
	return var0
end

return function(p3, p4, p5) --[[ line: 45 | named "isMessageForOpenChannel" ]]
	local var1, targetTextChannel
	local textChannels = p3.TextChannels
	
	if textChannels == nil then
		var1 = nil
	else
		targetTextChannel = textChannels.targetTextChannel
		
		if targetTextChannel == nil or targetTextChannel.Name == nil then
			local selectedChannelName = textChannels.selectedChannelName
			local channelTabs = p3.ChannelTabs
			var1 = if selectedChannelName == nil or channelTabs == nil or channelTabs.allChannelTabs[selectedChannelName] == nil then channelTabs == nil and ((if channelTabs == nil then channelTabs.selectedTabName else nil) or "RBXGeneral") else selectedChannelName
		else
			var1 = targetTextChannel.Name
		end
	end
	local var2
	targetTextChannel = nil
	
	if p5 == nil then
		if p4.TextChannel == nil then
			var2 = nil
		else
			targetTextChannel = p4.TextChannel.Name
		end
		return var1 == nil or var2 == nil or var2 == var1
	else
		targetTextChannel = p5
	end
	if targetTextChannel == "RBXSystem" then
		targetTextChannel = "RBXGeneral"
	end
	var2 = targetTextChannel
end