local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)
local fFlagExpChatFixInputBarOrphanBorderModule = require(expChat.Flags.FFlagExpChatFixInputBarOrphanBorder)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

local function _(p1, p2)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	local isChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
	
	return if getFFlagTextChatEnableUniverseChatTabs() and p2 and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value
end

local _ = function(p1)
	local channelTabs = p1.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		return nil
	end
	local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
	
	return if selectedTabName then selectedTabName.Type else nil
end

return function(p1, p2)
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), getFFlagTextChatEnableUniverseChatTabs (ref), selectSelectedTabNameModule (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), fFlagExpChatFixInputBarOrphanBorderModule (ref), fFlagExpChatUseChatConfigStore (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatNewInputBarModule (ref)
	local isRBXGlobal
	local var1 = if fFlagExpChatUseChannelTabsStore then nil else p1.ChannelTabs
	local var2 = if fFlagExpChatUseChannelTabsStore or not getFFlagTextChatEnableUniverseChatTabs() then nil else selectSelectedTabNameModule(p1)
	
	if fFlagExpChatUseChannelTabsStore then
		isRBXGlobal = p2.isGlobalTabSelected == true
		isRBXGlobal = nil
	else
		isRBXGlobal = var2 == "RBXGlobal"
	end
	local var3 = if fFlagExpChatUseChannelTabsStore then p2.hasGlobalChannelTab else false
	
	if not fFlagExpChatUseChannelTabsStore and getFFlagTextChatEnableUniverseChatTabs() then
		var3 = var1 ~= nil and (var1.allChannelTabs ~= nil and var1.allChannelTabs.RBXGlobal ~= nil)
	end
	local selectedTabType, channelTabs
	local var4 = if fFlagExpChatUseChannelTabsStore then p2.hasFriendsChannelTab else false
	
	if not fFlagExpChatUseChannelTabsStore and fFlagExpChatEnableFriendsTab then
		var4 = var1 ~= nil and (var1.allChannelTabs ~= nil and var1.allChannelTabs[friendsChatTabNameModule] ~= nil)
	end
	if fFlagExpChatUseChannelTabsStore then
		selectedTabType = p2.selectedTabType
	else
		channelTabs = p1.ChannelTabs
		
		if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
			selectedTabType = nil
		else
			local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
			selectedTabType = if selectedTabName then selectedTabName.Type else nil
		end
	end
	local var5
	channelTabs = fFlagExpChatEnableFriendsTab and selectedTabType == "FriendsChat"
	local var6 = not channelTabs
	local t = {}
	
	if fFlagExpChatFixInputBarOrphanBorderModule then
		local isChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
		var5 = (if getFFlagTextChatEnableUniverseChatTabs() and isRBXGlobal and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value) and var6
	else
		local isChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
		var5 = if getFFlagTextChatEnableUniverseChatTabs() and isRBXGlobal and isChatInputBarEnabled._propertyEnabled ~= nil then isChatInputBarEnabled._topBarVisibility and (isChatInputBarEnabled._coreGuiEnabled and not isChatInputBarEnabled._devTextBoxEnabled) else isChatInputBarEnabled.value
	end
	t.isChatInputBarVisible = var5
	t.isChatWindowVisible = p1.ChatVisibility.isChatWindowEnabled.value
	t.isChannelBarVisible = p1.ChatVisibility.isChannelBarEnabled.value or getFFlagTextChatEnableUniverseChatTabs() and (var3 and (p1.ChatVisibility.isChatWindowEnabled.value or var4 and p1.ChatVisibility.isChatWindowEnabled.value))
	t.chatTopBarVisibility = p1.ChatVisibility.isChatInputBarEnabled._topBarVisibility and p1.ChatVisibility.isChatWindowEnabled._topBarVisibility
	t.chatLayoutAlignment = p1.ChatLayout.Alignment
	t.chatWindowSettings = if fFlagExpChatUseChatConfigStore then nil else p1.ChatLayout.ChatWindowSettings
	t.clientSettings = p1.ClientSettings
	t.selectedTabType = if fFlagExpChatUseChannelTabsStore then nil else selectedTabType
	t.renderingFriends = channelTabs
	t.isExperienceChatRendered = var6
	t.targetTextChannel = if fFlagExpChatPresetChatEnabled or fFlagExpChatNewInputBarModule then p1.TextChannels and p1.TextChannels.targetTextChannel else nil
	
	return t
end