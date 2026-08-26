local expChat = script:FindFirstAncestor("ExpChat")
local fFlagExpChatUseChannelTabsStore = require(expChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)

return function(p1)
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref)
	return if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false).getSelectedTabName(false) elseif getFFlagExpChatEnableChannelTabsUIModule() and p1 ~= nil then p1.ChannelTabs.selectedTabName else nil
end