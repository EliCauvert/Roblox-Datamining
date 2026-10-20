local ExpChat = script:FindFirstAncestor("ExpChat")
local FFlagExpChatUseChannelTabsStore = require(ExpChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetFFlagExpChatEnableChannelTabsUIModule = require(ExpChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)

return function(p1)
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), GetFFlagExpChatEnableChannelTabsUIModule (copy)
	return if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) elseif GetFFlagExpChatEnableChannelTabsUIModule() and p1 ~= nil then p1.ChannelTabs.selectedTabName else nil
end