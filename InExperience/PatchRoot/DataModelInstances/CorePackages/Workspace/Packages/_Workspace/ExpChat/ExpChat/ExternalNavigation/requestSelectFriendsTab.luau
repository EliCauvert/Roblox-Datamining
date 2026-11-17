local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local RequestSelectTabModule = require(ExpChat.ExternalNavigation.requestSelectTab)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local LogStickyTabsExposureModule = require(ExpChat.StickyTabs.logStickyTabsExposure)
local FriendsChatChannelSelectedFunction = ExpChatSharedModule.Actions.FriendsChatChannelSelected
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatStickyTabs = SharedFlagsModule.FFlagExpChatStickyTabs
local FFlagExpChatStickyTabsLogExposureModule = require(ExpChat.Flags.FFlagExpChatStickyTabsLogExposure)

return function(): boolean
	-- upvalues: ExpChatSharedModule (copy), FFlagExpChatStickyTabs (copy), SelectSelectedTabNameModule (copy), RequestSelectTabModule (copy), FriendsChatTabNameModule (copy), FFlagExpChatStickyTabsLogExposureModule (copy), LogStickyTabsExposureModule (copy), FFlagExpChatUseChannelTabsStore (copy), FriendsChatChannelSelectedFunction (copy)
	local Store = ExpChatSharedModule.context.store
	
	if Store == nil then
		return false
	end
	local SelectSelectedTabNameModuleResult = if FFlagExpChatStickyTabs then SelectSelectedTabNameModule(Store:getState()) else nil
	
	if not RequestSelectTabModule(FriendsChatTabNameModule, if FFlagExpChatStickyTabs then true else nil) then
		return false
	end
	if FFlagExpChatStickyTabs and FFlagExpChatStickyTabsLogExposureModule then
		LogStickyTabsExposureModule(FriendsChatTabNameModule, SelectSelectedTabNameModuleResult)
	end
	if not FFlagExpChatUseChannelTabsStore then
		Store:dispatch(FriendsChatChannelSelectedFunction(FriendsChatTabNameModule))
	end
	return true
end