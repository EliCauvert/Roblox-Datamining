local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)
local fFlagExpChatFixInputBarOrphanBorderModule = require(expChat.Flags.FFlagExpChatFixInputBarOrphanBorder)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

local function _(p1)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), selectSelectedTabNameModule (ref)
	local isChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
	
	return if getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(p1) == "RBXGlobal" and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value
end

local _ = function(p1)
	local channelTabs = p1.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		return nil
	end
	local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
	
	return if selectedTabName then selectedTabName.Type else nil
end

return function(p1, _)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagExpChatFixInputBarOrphanBorderModule (ref), selectSelectedTabNameModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), fFlagExpChatUseChatConfigStore (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatNewInputBarModule (ref)
	local var1 = false
	
	if getFFlagTextChatEnableUniverseChatTabs() then
		local channelTabs = p1.ChannelTabs
		var1 = channelTabs ~= nil and (channelTabs.allChannelTabs ~= nil and channelTabs.allChannelTabs.RBXGlobal ~= nil)
	end
	local var2 = false
	
	if fFlagExpChatEnableFriendsTab then
		local channelTabs = p1.ChannelTabs
		var2 = channelTabs ~= nil and (channelTabs.allChannelTabs ~= nil and channelTabs.allChannelTabs[friendsChatTabNameModule] ~= nil)
	end
	local var3
	local channelTabs = p1.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		var3 = nil
	else
		local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
		var3 = if selectedTabName then selectedTabName.Type else nil
	end
	local var4
	channelTabs = fFlagExpChatEnableFriendsTab and var3 == "FriendsChat"
	local var5 = not channelTabs
	local t = {
		canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p1.CanLocalUserChat
	}
	
	if fFlagExpChatFixInputBarOrphanBorderModule then
		local isChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
		var4 = (if getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(p1) == "RBXGlobal" and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value) and var5
	else
		local isChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
		var4 = if getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(p1) == "RBXGlobal" and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value
	end
	t.isChatInputBarVisible = var4
	t.isChatWindowVisible = p1.ChatVisibility.isChatWindowEnabled.value
	t.isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p1.ChatVisibility.isChannelBarEnabled.value or getFFlagTextChatEnableUniverseChatTabs() and (var1 and (p1.ChatVisibility.isChatWindowEnabled.value or var2 and p1.ChatVisibility.isChatWindowEnabled.value)) else false
	t.chatTopBarVisibility = p1.ChatVisibility.isChatInputBarEnabled._topBarVisibility and p1.ChatVisibility.isChatWindowEnabled._topBarVisibility
	t.chatLayoutAlignment = p1.ChatLayout.Alignment
	t.chatWindowSettings = if fFlagExpChatUseChatConfigStore then nil else p1.ChatLayout.ChatWindowSettings
	t.clientSettings = p1.ClientSettings
	t.selectedTabType = var3
	t.renderingFriends = channelTabs
	t.isExperienceChatRendered = var5
	t.targetTextChannel = if fFlagExpChatPresetChatEnabled or fFlagExpChatNewInputBarModule then p1.TextChannels and p1.TextChannels.targetTextChannel else nil
	
	return t
end