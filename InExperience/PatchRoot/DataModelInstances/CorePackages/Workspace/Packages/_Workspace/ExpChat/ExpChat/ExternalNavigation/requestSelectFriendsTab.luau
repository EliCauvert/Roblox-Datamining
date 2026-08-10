local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local requestSelectTabModule = require(expChat.ExternalNavigation.requestSelectTab)
local friendsChatChannelSelected = expChatSharedModule.Actions.FriendsChatChannelSelected
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

return function() --[[ line: 17 | named "requestSelectFriendsTab" ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), expChatSharedModule (ref), requestSelectTabModule (ref), friendsChatTabNameModule (ref), friendsChatChannelSelected (ref)
	if not fFlagExpChatEnableFriendsTab then
		return false
	end
	local store = expChatSharedModule.context.store
	
	if store == nil then
		return false
	elseif requestSelectTabModule(friendsChatTabNameModule) then
		store:dispatch(friendsChatChannelSelected(friendsChatTabNameModule))
		
		return true
	end
	return false
end