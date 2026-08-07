local expChat = script:FindFirstAncestor("ExpChat")
local fFlagExpChatUseChannelTabsStore = require(expChat.Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)

return function(p0) --[[ line: 13 ]]
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref)
	return if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false).getSelectedTabName(false) elseif getFFlagExpChatEnableChannelTabsUIModule() and p0 ~= nil then p0.ChannelTabs.selectedTabName else nil
end