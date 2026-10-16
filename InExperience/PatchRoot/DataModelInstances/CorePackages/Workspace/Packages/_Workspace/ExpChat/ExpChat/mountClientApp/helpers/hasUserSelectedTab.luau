local ExpChat = script:FindFirstAncestor("ExpChat")
local FFlagExpChatUseChannelTabsStore = require(ExpChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)

return function(p1): boolean --[[ Line: 8 ]]
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	if FFlagExpChatUseChannelTabsStore then
		return GetChannelTabsStoreModule(false).getChannelTabsState(false).hasUserSelectedTab == true
	else
		local ChannelTabs = p1:getState().ChannelTabs
		
		return ChannelTabs ~= nil and ChannelTabs.hasUserSelectedTab == true
	end
end