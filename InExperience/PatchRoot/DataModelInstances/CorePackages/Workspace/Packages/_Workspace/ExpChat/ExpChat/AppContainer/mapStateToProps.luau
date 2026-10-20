local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatNewInputBarModule = require(ExpChat.Flags.FFlagExpChatNewInputBar)
local FFlagExpChatFixInputBarOrphanBorderModule = require(ExpChat.Flags.FFlagExpChatFixInputBarOrphanBorder)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab

local function _(p1, p2)
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	local IsChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
	
	return if GetFFlagTextChatEnableUniverseChatTabsFunction() and p2 and IsChatInputBarEnabled._propertyEnabled ~= nil then IsChatInputBarEnabled._topBarVisibility and (IsChatInputBarEnabled._coreGuiEnabled and not IsChatInputBarEnabled._devTextBoxEnabled) else IsChatInputBarEnabled.value
end

local _ = function(p1)
	local ChannelTabs = p1.ChannelTabs
	
	if ChannelTabs == nil or ChannelTabs.allChannelTabs == nil or ChannelTabs.selectedTabName == nil then
		return nil
	else
		local AllChannelTab = ChannelTabs.allChannelTabs[ChannelTabs.selectedTabName]
		
		return AllChannelTab and AllChannelTab.Type or nil
	end
end

return function(p1, p2)
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), SelectSelectedTabNameModule (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatTabNameModule (copy), FFlagExpChatFixInputBarOrphanBorderModule (copy), FFlagExpChatUseChatConfigStore (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatNewInputBarModule (copy)
	local ChannelTabs = if FFlagExpChatUseChannelTabsStore then nil else p1.ChannelTabs
	local SelectSelectedTabNameModuleResult = if FFlagExpChatUseChannelTabsStore or not GetFFlagTextChatEnableUniverseChatTabsFunction() then nil else SelectSelectedTabNameModule(p1)
	local IsIsGlobalTabSelected: boolean = if FFlagExpChatUseChannelTabsStore then p2.isGlobalTabSelected == true else SelectSelectedTabNameModuleResult == "RBXGlobal"
	local HasGlobalChannelTab = if FFlagExpChatUseChannelTabsStore or not GetFFlagTextChatEnableUniverseChatTabsFunction() then if FFlagExpChatUseChannelTabsStore then p2.hasGlobalChannelTab else false else ChannelTabs ~= nil and (ChannelTabs.allChannelTabs ~= nil and ChannelTabs.allChannelTabs.RBXGlobal ~= nil)
	local HasAllChannelTab = if not FFlagExpChatUseChannelTabsStore and FFlagExpChatEnableFriendsTab then ChannelTabs ~= nil and (ChannelTabs.allChannelTabs ~= nil and ChannelTabs.allChannelTabs[FriendsChatTabNameModule] ~= nil) elseif FFlagExpChatUseChannelTabsStore then p2.hasFriendsChannelTab else false
	local SelectedTabType = nil
	
	if FFlagExpChatUseChannelTabsStore then
		SelectedTabType = p2.selectedTabType
	else
		local ChannelTabs1 = p1.ChannelTabs
		
		if ChannelTabs1 == nil or ChannelTabs1.allChannelTabs == nil or ChannelTabs1.selectedTabName == nil then
			SelectedTabType = nil
		else
			local AllChannelTab = ChannelTabs1.allChannelTabs[ChannelTabs1.selectedTabName]
			SelectedTabType = AllChannelTab and AllChannelTab.Type or nil
		end
	end
	local IsFriendsChat: boolean = FFlagExpChatEnableFriendsTab and SelectedTabType == "FriendsChat"
	local NoIsFriendsChat = not IsFriendsChat
	local t = {}
	local NoIsFriendsChat1 = nil
	
	if FFlagExpChatFixInputBarOrphanBorderModule then
		local IsChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
		NoIsFriendsChat1 = (if GetFFlagTextChatEnableUniverseChatTabsFunction() and IsIsGlobalTabSelected and IsChatInputBarEnabled._propertyEnabled ~= nil then IsChatInputBarEnabled._topBarVisibility and (IsChatInputBarEnabled._coreGuiEnabled and not IsChatInputBarEnabled._devTextBoxEnabled) else IsChatInputBarEnabled.value) and NoIsFriendsChat
	else
		local IsChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
		NoIsFriendsChat1 = if GetFFlagTextChatEnableUniverseChatTabsFunction() and IsIsGlobalTabSelected and IsChatInputBarEnabled._propertyEnabled ~= nil then IsChatInputBarEnabled._topBarVisibility and (IsChatInputBarEnabled._coreGuiEnabled and not IsChatInputBarEnabled._devTextBoxEnabled) else IsChatInputBarEnabled.value
	end
	t.isChatInputBarVisible = NoIsFriendsChat1
	t.isChatWindowVisible = p1.ChatVisibility.isChatWindowEnabled.value
	t.isChannelBarVisible = p1.ChatVisibility.isChannelBarEnabled.value or (GetFFlagTextChatEnableUniverseChatTabsFunction() and HasGlobalChannelTab and p1.ChatVisibility.isChatWindowEnabled.value or HasAllChannelTab and p1.ChatVisibility.isChatWindowEnabled.value)
	t.chatTopBarVisibility = p1.ChatVisibility.isChatInputBarEnabled._topBarVisibility and p1.ChatVisibility.isChatWindowEnabled._topBarVisibility
	t.chatLayoutAlignment = p1.ChatLayout.Alignment
	t.chatWindowSettings = if FFlagExpChatUseChatConfigStore then nil else p1.ChatLayout.ChatWindowSettings
	t.clientSettings = p1.ClientSettings
	t.selectedTabType = if FFlagExpChatUseChannelTabsStore then nil else SelectedTabType
	t.renderingFriends = IsFriendsChat
	t.isExperienceChatRendered = NoIsFriendsChat
	t.targetTextChannel = if FFlagExpChatPresetChatEnabled or FFlagExpChatNewInputBarModule then p1.TextChannels and p1.TextChannels.targetTextChannel else nil
	
	return t
end