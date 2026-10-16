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
	end
	local channelTabs = store:getState().ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs[p1] == nil then
		return false
	end
	local var1 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	
	if var1 and var1.getChannelTabsState(false).allChannelTabs[p1] == nil then
		return false
	elseif var1 then
		var1.setTargetChannel(p1, false)
	end
	return true
end