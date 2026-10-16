local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local RequestSelectTabModule = require(ExpChat.ExternalNavigation.requestSelectTab)
local FriendsChatChannelSelectedFunction = ExpChatSharedModule.Actions.FriendsChatChannelSelected
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore

return function(): boolean --[[ Line: 18 | Named "requestSelectFriendsTab" ]]
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), ExpChatSharedModule (copy), RequestSelectTabModule (copy), FriendsChatTabNameModule (copy), FFlagExpChatUseChannelTabsStore (copy), FriendsChatChannelSelectedFunction (copy)
	if not FFlagExpChatEnableFriendsTab then
		return false
	end
	local Store = ExpChatSharedModule.context.store
	
	if Store == nil then
		return false
	end
	if not RequestSelectTabModule(FriendsChatTabNameModule) then
		return false
	end
	if not FFlagExpChatUseChannelTabsStore then
		Store:dispatch(FriendsChatChannelSelectedFunction(FriendsChatTabNameModule))
	end
	return true
end