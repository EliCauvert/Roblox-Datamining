local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

local function _(p0)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), selectSelectedTabNameModule (ref)
	local isChatInputBarEnabled = p0.ChatVisibility.isChatInputBarEnabled
	
	return if getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(p0) == "RBXGlobal" and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value
end

local _ = function(p1)
	local channelTabs = p1.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		return nil
	end
	local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
	
	return if selectedTabName then selectedTabName.Type else nil
end

return function(p2, _)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), fFlagExpChatUseMessagesStore (ref), selectSelectedTabNameModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), fFlagExpChatUseChatConfigStore (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatNewInputBarModule (ref)
	local var7 = false
	
	if getFFlagTextChatEnableUniverseChatTabs() then
		local channelTabs = p2.ChannelTabs
		var7 = channelTabs ~= nil and (channelTabs.allChannelTabs ~= nil and channelTabs.allChannelTabs.RBXGlobal ~= nil)
	end
	local var8 = false
	
	if fFlagExpChatEnableFriendsTab then
		local channelTabs = p2.ChannelTabs
		var8 = channelTabs ~= nil and (channelTabs.allChannelTabs ~= nil and channelTabs.allChannelTabs[friendsChatTabNameModule] ~= nil)
	end
	local var10
	local t = {
		canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p2.CanLocalUserChat
	}
	local isChatInputBarEnabled = p2.ChatVisibility.isChatInputBarEnabled
	t.isChatInputBarVisible = if getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(p2) == "RBXGlobal" and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value
	t.isChatWindowVisible = p2.ChatVisibility.isChatWindowEnabled.value
	t.isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p2.ChatVisibility.isChannelBarEnabled.value or getFFlagTextChatEnableUniverseChatTabs() and (var7 and (p2.ChatVisibility.isChatWindowEnabled.value or var8 and p2.ChatVisibility.isChatWindowEnabled.value)) else false
	t.chatTopBarVisibility = p2.ChatVisibility.isChatInputBarEnabled._topBarVisibility and p2.ChatVisibility.isChatWindowEnabled._topBarVisibility
	t.chatLayoutAlignment = p2.ChatLayout.Alignment
	t.chatWindowSettings = if fFlagExpChatUseChatConfigStore then nil else p2.ChatLayout.ChatWindowSettings
	t.clientSettings = p2.ClientSettings
	local channelTabs = p2.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		var10 = nil
	else
		local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
		var10 = if selectedTabName then selectedTabName.Type else nil
	end
	t.selectedTabType = var10
	t.targetTextChannel = if fFlagExpChatPresetChatEnabled or fFlagExpChatNewInputBarModule then p2.TextChannels and p2.TextChannels.targetTextChannel else nil
	
	return t
end