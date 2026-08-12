local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local friendsChatChannelSelected = expChatSharedModule.Actions.FriendsChatChannelSelected
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

return function(p0) --[[ line: 13 | named "requestSelectTab" ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), expChatSharedModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), friendsChatChannelSelected (ref)
	if not fFlagExpChatEnableFriendsTab then
		return false
	end
	local store = expChatSharedModule.context.store
	
	if store == nil then
		return false
	end
	local channelTabs = store:getState().ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs[p0] == nil then
		return false
	end
	local var4 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	
	if var4 and var4.getChannelTabsState(false).allChannelTabs[p0] == nil then
		return false
	end
	store:dispatch(friendsChatChannelSelected(p0))
	
	if var4 then
		var4.setTargetChannel(p0, false)
	end
	return true
end