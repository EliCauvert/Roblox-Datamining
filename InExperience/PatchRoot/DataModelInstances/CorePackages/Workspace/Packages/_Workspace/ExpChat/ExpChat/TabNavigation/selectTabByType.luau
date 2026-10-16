local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local TargetTextChannelPropertyChangedFunction = ExpChatSharedModule.Actions.TargetTextChannelPropertyChanged
local UniverseChatChannelSelectedFunction = ExpChatSharedModule.Actions.UniverseChatChannelSelected
local FriendsChatChannelSelectedFunction = ExpChatSharedModule.Actions.FriendsChatChannelSelected
local TextChatChannelSelectedFunction = ExpChatSharedModule.Actions.TextChatChannelSelected
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatSelectTextChatTabByName = SharedFlagsModule.FFlagExpChatSelectTextChatTabByName
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)

return function(Callback: (any) -> (), p1) --[[ Line: 41 | Named "selectTabByType" ]]
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), UniverseChatChannelSelectedFunction (copy), FFlagExpChatUseChannelTabsStore (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatChannelSelectedFunction (copy), FFlagExpChatSelectTextChatTabByName (copy), TextChatChannelSelectedFunction (copy), TargetTextChannelPropertyChangedFunction (copy), GetChannelTabsStoreModule (copy)
	local ChannelName = p1.channelName
	local TabType = p1.tabType
	local ShouldReorderTabs = p1.shouldReorderTabs
	
	if TabType == "UniverseChat" then
		if FFlagExpChatGlobalTabDefaultModule then
			Callback(UniverseChatChannelSelectedFunction(ChannelName, true))
		else
			Callback(UniverseChatChannelSelectedFunction(ChannelName))
		end
	elseif FFlagExpChatUseChannelTabsStore or not FFlagExpChatEnableFriendsTab or TabType ~= "FriendsChat" then
		if FFlagExpChatSelectTextChatTabByName and TabType == "TextChat" then
			Callback(TextChatChannelSelectedFunction(ChannelName, ShouldReorderTabs))
		elseif p1.textChannel then
			Callback(TargetTextChannelPropertyChangedFunction(p1.textChannel, ShouldReorderTabs))
		end
	else
		Callback(FriendsChatChannelSelectedFunction(ChannelName))
	end
	if FFlagExpChatUseChannelTabsStore then
		local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
		
		if FFlagExpChatGlobalTabDefaultModule then
			ChannelTabsStoreModule.setTargetChannel(ChannelName, ShouldReorderTabs, true)
			
			return
		end
		ChannelTabsStoreModule.setTargetChannel(ChannelName, ShouldReorderTabs)
	end
end