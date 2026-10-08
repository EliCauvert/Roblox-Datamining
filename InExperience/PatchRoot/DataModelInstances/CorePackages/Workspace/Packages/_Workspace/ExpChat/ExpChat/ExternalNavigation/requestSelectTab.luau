local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local fFlagExpChatUseChannelTabsStore = require(parent.SharedFlags).FFlagExpChatUseChannelTabsStore

return function(p1)
	-- upvalues: expChatSharedModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	local store = expChatSharedModule.context.store
	
	if store == nil then
		return false
	elseif fFlagExpChatUseChannelTabsStore then
		local var1 = getChannelTabsStoreModule(false)
		
		if var1.getChannelTabsState(false).allChannelTabs[p1] == nil then
			return false
		end
		var1.setTargetChannel(p1, false)
		
		return true
	else
		local channelTabs = store:getState().ChannelTabs
		
		return channelTabs == nil or channelTabs.allChannelTabs[p1] == nil
	end
end