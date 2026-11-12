local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local RequestSelectTabModule = require(ExpChat.ExternalNavigation.requestSelectTab)
local FriendsChatChannelSelectedFunction = ExpChatSharedModule.Actions.FriendsChatChannelSelected
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatStickyTabs = SharedFlagsModule.FFlagExpChatStickyTabs

return function(): boolean
	-- upvalues: ExpChatSharedModule (copy), FFlagExpChatStickyTabs (copy), RequestSelectTabModule (copy), FriendsChatTabNameModule (copy), FFlagExpChatUseChannelTabsStore (copy), FriendsChatChannelSelectedFunction (copy)
	local Store = ExpChatSharedModule.context.store
	
	if Store == nil then
		return false
	end
	if not RequestSelectTabModule(FriendsChatTabNameModule, if FFlagExpChatStickyTabs then true else nil) then
		return false
	end
	if not FFlagExpChatUseChannelTabsStore then
		Store:dispatch(FriendsChatChannelSelectedFunction(FriendsChatTabNameModule))
	end
	return true
end