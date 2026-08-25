local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local fFlagExpChatUseChannelTabsStore = require(parent.SharedFlags).FFlagExpChatUseChannelTabsStore

return function(p0)
	-- upvalues: expChatSharedModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	local store = expChatSharedModule.context.store
	
	if store == nil then
		return false
	end
	local channelTabs = store:getState().ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs[p0] == nil then
		return false
	end
	local var3 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	
	if var3 and var3.getChannelTabsState(false).allChannelTabs[p0] == nil then
		return false
	elseif var3 then
		var3.setTargetChannel(p0, false)
	end
	return true
end