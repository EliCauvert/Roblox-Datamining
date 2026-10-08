local expChat = script:FindFirstAncestor("ExpChat")
local fFlagExpChatUseChannelTabsStore = require(expChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local var1 = if fFlagExpChatUseChannelTabsStore then require(expChat.Stores.GetChannelTabsStore) else nil

local function getOpenChannelName(p1)
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), var1 (ref)
	local textChannels = p1.TextChannels
	
	if textChannels == nil then
		return nil
	end
	local targetTextChannel = textChannels.targetTextChannel
	
	if targetTextChannel ~= nil and targetTextChannel.Name ~= nil then
		return targetTextChannel.Name
	end
	local selectedChannelName = textChannels.selectedChannelName
	local var2 = if fFlagExpChatUseChannelTabsStore then var1(false).getChannelTabsState(false) else p1.ChannelTabs
	
	return if not (selectedChannelName ~= nil and var2 ~= nil and var2.allChannelTabs[selectedChannelName] ~= nil) then if var2 == nil then selectedChannelName else var2.selectedTabName or "RBXGeneral" else selectedChannelName
end

local function _(p1, p2)
	local var2 = nil
	
	if p2 == nil then
		if p1.TextChannel == nil then
			return nil
		end
		var2 = p1.TextChannel.Name
	else
		var2 = p2
	end
	if var2 == "RBXSystem" then
		var2 = "RBXGeneral"
	end
	return var2
end

return function(p1, p2, p3)
	-- upvalues: getOpenChannelName (ref)
	local var2, var3
	local var4 = getOpenChannelName(p1)
	local _ = nil
	
	if p3 == nil then
		if p2.TextChannel == nil then
			var3 = nil
		else
			var2 = p2.TextChannel.Name
		end
		return var4 == nil or var3 == nil or var3 == var4
	else
		var2 = p3
	end
	if var2 == "RBXSystem" then
		var2 = "RBXGeneral"
	end
	var3 = var2
end