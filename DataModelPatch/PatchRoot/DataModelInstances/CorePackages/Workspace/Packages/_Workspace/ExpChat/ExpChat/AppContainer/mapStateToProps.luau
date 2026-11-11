local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagExpChatEnableChannelTabsUIModule = require(ExpChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local FFlagExpChatNewInputBarModule = require(ExpChat.Flags.FFlagExpChatNewInputBar)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatChannelTabRefactor = SharedFlagsModule.FFlagExpChatChannelTabRefactor
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab

local function _(p1)
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), SelectSelectedTabNameModule (copy)
	local IsChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
	
	return if GetFFlagTextChatEnableUniverseChatTabsFunction() and SelectSelectedTabNameModule(p1) == "RBXGlobal" and IsChatInputBarEnabled._propertyEnabled ~= nil then IsChatInputBarEnabled._topBarVisibility and (IsChatInputBarEnabled._coreGuiEnabled and not IsChatInputBarEnabled._devTextBoxEnabled) else IsChatInputBarEnabled.value
end

local _ = function(p1)
	-- upvalues: FFlagExpChatChannelTabRefactor (copy)
	if not FFlagExpChatChannelTabRefactor then
		return nil
	end
	local ChannelTabs = p1.ChannelTabs
	
	if ChannelTabs == nil or ChannelTabs.allChannelTabs == nil or ChannelTabs.selectedTabName == nil then
		return nil
	else
		local AllChannelTab = ChannelTabs.allChannelTabs[ChannelTabs.selectedTabName]
		
		return AllChannelTab and AllChannelTab.Type or nil
	end
end

return function(p1, _)
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy), FFlagExpChatUseMessagesStore (copy), SelectSelectedTabNameModule (copy), GetFFlagExpChatEnableChannelTabsUIModule (copy), FFlagExpChatUseChatConfigStore (copy), FFlagExpChatChannelTabRefactor (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatNewInputBarModule (copy)
	local HasRBXGlobal = false
	
	if GetFFlagTextChatEnableUniverseChatTabsFunction() then
		local ChannelTabs = p1.ChannelTabs
		HasRBXGlobal = ChannelTabs ~= nil and (ChannelTabs.allChannelTabs ~= nil and ChannelTabs.allChannelTabs.RBXGlobal ~= nil)
	end
	local HasFriendsChat = false
	
	if FFlagExpChatEnableFriendsTab then
		local ChannelTabs = p1.ChannelTabs
		HasFriendsChat = ChannelTabs ~= nil and (ChannelTabs.allChannelTabs ~= nil and ChannelTabs.allChannelTabs.FriendsChat ~= nil)
	end
	local IsChatInputBarEnabled = p1.ChatVisibility.isChatInputBarEnabled
	local config = {
		canLocalUserChat = if FFlagExpChatUseMessagesStore then nil else p1.CanLocalUserChat,
		isChatInputBarVisible = if GetFFlagTextChatEnableUniverseChatTabsFunction() and SelectSelectedTabNameModule(p1) == "RBXGlobal" and IsChatInputBarEnabled._propertyEnabled ~= nil then IsChatInputBarEnabled._topBarVisibility and (IsChatInputBarEnabled._coreGuiEnabled and not IsChatInputBarEnabled._devTextBoxEnabled) else IsChatInputBarEnabled.value,
		isChatWindowVisible = p1.ChatVisibility.isChatWindowEnabled.value,
		isChannelBarVisible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.ChatVisibility.isChannelBarEnabled.value or (GetFFlagTextChatEnableUniverseChatTabsFunction() and HasRBXGlobal and p1.ChatVisibility.isChatWindowEnabled.value or HasFriendsChat and p1.ChatVisibility.isChatWindowEnabled.value) else false,
		chatTopBarVisibility = p1.ChatVisibility.isChatInputBarEnabled._topBarVisibility and p1.ChatVisibility.isChatWindowEnabled._topBarVisibility,
		chatLayoutAlignment = p1.ChatLayout.Alignment,
		chatWindowSettings = if FFlagExpChatUseChatConfigStore then nil else p1.ChatLayout.ChatWindowSettings,
		clientSettings = p1.ClientSettings
	}
	local Type = nil
	
	if FFlagExpChatChannelTabRefactor then
		local ChannelTabs = p1.ChannelTabs
		
		if ChannelTabs == nil or ChannelTabs.allChannelTabs == nil or ChannelTabs.selectedTabName == nil then
			Type = nil
		else
			local AllChannelTab = ChannelTabs.allChannelTabs[ChannelTabs.selectedTabName]
			Type = AllChannelTab and AllChannelTab.Type or nil
		end
	else
		Type = nil
	end
	config.selectedTabType = Type
	config.targetTextChannel = if FFlagExpChatPresetChatEnabled or FFlagExpChatNewInputBarModule then p1.TextChannels and p1.TextChannels.targetTextChannel else nil
	
	return config
end