local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FriendsChatEventReceiverModule = require(Parent.FriendsChat.FriendsChatEventReceiver)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local UseChannelTabUnreadWriterModule = require(ExpChat.useChannelTabUnreadWriter)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy), SelectSelectedTabNameModule (copy), UseChannelTabUnreadWriterModule (copy), ReactModule (copy), FriendsChatEventReceiverModule (copy)
	return ReactModule.createElement(FriendsChatEventReceiverModule, {
		setTabUnread = UseChannelTabUnreadWriterModule("FriendsChat"),
		selectedTabName = UseSelectorFunction(SelectSelectedTabNameModule),
		isChatWindowVisible = p1.isChatWindowVisible
	})
end