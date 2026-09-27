local expChat = script:FindFirstAncestor("ExpChat")
local fFlagExpChatUseChannelTabsStore = require(expChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)

return function(p1)
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	return if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false).getSelectedTabName(false) elseif p1 == nil then nil else p1.ChannelTabs.selectedTabName
end