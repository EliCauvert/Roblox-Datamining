local function _(p1)
	local textChannels = p1.TextChannels
	
	if textChannels == nil then
		return nil
	end
	local targetTextChannel = textChannels.targetTextChannel
	
	if targetTextChannel ~= nil and targetTextChannel.Name ~= nil then
		return targetTextChannel.Name
	end
	local selectedChannelName = textChannels.selectedChannelName
	local channelTabs = p1.ChannelTabs
	
	return if not (selectedChannelName ~= nil and channelTabs ~= nil and channelTabs.allChannelTabs[selectedChannelName] ~= nil) then if channelTabs == nil then selectedChannelName else channelTabs.selectedTabName or "RBXGeneral" else selectedChannelName
end

local _ = function(p1, p2)
	local var1 = nil
	
	if p2 == nil then
		if p1.TextChannel == nil then
			return nil
		end
		var1 = p1.TextChannel.Name
	else
		var1 = p2
	end
	if var1 == "RBXSystem" then
		var1 = "RBXGeneral"
	end
	return var1
end

return function(p1, p2, p3)
	local var1, targetTextChannel
	local textChannels = p1.TextChannels
	
	if textChannels == nil then
		var1 = nil
	else
		targetTextChannel = textChannels.targetTextChannel
		
		if targetTextChannel == nil or targetTextChannel.Name == nil then
			local selectedChannelName = textChannels.selectedChannelName
			local channelTabs = p1.ChannelTabs
			var1 = if selectedChannelName == nil or channelTabs == nil or channelTabs.allChannelTabs[selectedChannelName] == nil then channelTabs == nil and ((if channelTabs == nil then channelTabs.selectedTabName else nil) or "RBXGeneral") else selectedChannelName
		else
			var1 = targetTextChannel.Name
		end
	end
	local var2
	targetTextChannel = nil
	
	if p3 == nil then
		if p2.TextChannel == nil then
			var2 = nil
		else
			targetTextChannel = p2.TextChannel.Name
		end
		return var1 == nil or var2 == nil or var2 == var1
	else
		targetTextChannel = p3
	end
	if targetTextChannel == "RBXSystem" then
		targetTextChannel = "RBXGeneral"
	end
	var2 = targetTextChannel
end