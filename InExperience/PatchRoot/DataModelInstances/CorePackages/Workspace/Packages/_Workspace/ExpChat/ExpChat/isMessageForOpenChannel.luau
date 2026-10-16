local ExpChat = script:FindFirstAncestor("ExpChat")
local FFlagExpChatUseChannelTabsStore = require(ExpChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then require(ExpChat.Stores.GetChannelTabsStore) else nil

local function getOpenChannelName(p1) --[[ Line: 10 ]]
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	local TextChannels = p1.TextChannels
	
	if TextChannels == nil then
		return nil
	end
	local TargetTextChannel = TextChannels.targetTextChannel
	
	if TargetTextChannel == nil or TargetTextChannel.Name == nil then
		local SelectedChannelName = TextChannels.selectedChannelName
		local ChannelTabsState = if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false) else p1.ChannelTabs
		
		return if SelectedChannelName == nil or ChannelTabsState == nil or ChannelTabsState.allChannelTabs[SelectedChannelName] == nil then if ChannelTabsState == nil then SelectedChannelName else ChannelTabsState.selectedTabName or "RBXGeneral" else SelectedChannelName
	else
		return TargetTextChannel.Name
	end
end

local function _(p1, p2) --[[ Line: 37 | Named "getMessageChannelName" ]]
	local Name = nil
	
	if p2 == nil then
		if p1.TextChannel == nil then
			return nil
		end
		Name = p1.TextChannel.Name
	else
		Name = p2
	end
	if Name == "RBXSystem" then
		Name = "RBXGeneral"
	end
	return Name
end

return function(p1, p2, Name): boolean --[[ Line: 54 | Named "isMessageForOpenChannel" ]]
	-- upvalues: getOpenChannelName (copy)
	local OpenChannelName = getOpenChannelName(p1)
	local v1 = nil
	local Name1 = nil
	repeat
		if Name == nil then
			if p2.TextChannel == nil then
				v1 = nil
				break
			end
			Name1 = p2.TextChannel.Name
		else
			Name1 = Name
		end
		if Name1 == "RBXSystem" then
			Name1 = "RBXGeneral"
		end
		v1 = Name1
	until true
	return OpenChannelName == nil or v1 == nil or v1 == OpenChannelName
end