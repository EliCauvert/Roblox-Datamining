local expChat = script:FindFirstAncestor("ExpChat")
local fFlagExpChatUseChannelTabsStore = require(expChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)

return function(p1)
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	if fFlagExpChatUseChannelTabsStore then
		return getChannelTabsStoreModule(false).getChannelTabsState(false).hasUserSelectedTab == true
	end
	local channelTabs = p1:getState().ChannelTabs
	
	return channelTabs ~= nil and channelTabs.hasUserSelectedTab == true
end