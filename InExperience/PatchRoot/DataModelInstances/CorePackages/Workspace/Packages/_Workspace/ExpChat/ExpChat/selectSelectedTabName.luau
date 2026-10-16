local ExpChat = script:FindFirstAncestor("ExpChat")
local FFlagExpChatUseChannelTabsStore = require(ExpChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	return if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) elseif p1 == nil then nil else p1.ChannelTabs.selectedTabName
end