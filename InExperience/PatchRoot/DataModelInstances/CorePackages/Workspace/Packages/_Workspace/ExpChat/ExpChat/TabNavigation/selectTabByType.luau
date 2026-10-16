local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local targetTextChannelPropertyChanged = expChatSharedModule.Actions.TargetTextChannelPropertyChanged
local universeChatChannelSelected = expChatSharedModule.Actions.UniverseChatChannelSelected
local friendsChatChannelSelected = expChatSharedModule.Actions.FriendsChatChannelSelected
local textChatChannelSelected = expChatSharedModule.Actions.TextChatChannelSelected
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatSelectTextChatTabByName = sharedFlagsModule.FFlagExpChatSelectTextChatTabByName
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)

return function(p1, p2)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), universeChatChannelSelected (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatChannelSelected (ref), fFlagExpChatSelectTextChatTabByName (ref), textChatChannelSelected (ref), targetTextChannelPropertyChanged (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	local channelName = p2.channelName
	local tabType = p2.tabType
	local shouldReorderTabs = p2.shouldReorderTabs
	
	if tabType == "UniverseChat" then
		if fFlagExpChatGlobalTabDefaultModule then
			p1(universeChatChannelSelected(channelName, true))
		else
			p1(universeChatChannelSelected(channelName))
		end
	elseif fFlagExpChatEnableFriendsTab and tabType == "FriendsChat" then
		p1(friendsChatChannelSelected(channelName))
	elseif fFlagExpChatSelectTextChatTabByName and tabType == "TextChat" then
		p1(textChatChannelSelected(channelName, shouldReorderTabs))
	elseif p2.textChannel then
		p1(targetTextChannelPropertyChanged(p2.textChannel, shouldReorderTabs))
	end
	if fFlagExpChatUseChannelTabsStore then
		local var1 = getChannelTabsStoreModule(false)
		
		if fFlagExpChatGlobalTabDefaultModule then
			var1.setTargetChannel(channelName, shouldReorderTabs, true)
			
			return
		end
		var1.setTargetChannel(channelName, shouldReorderTabs)
	end
end