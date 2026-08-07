local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local friendsChatEventReceiverModule = require(parent.FriendsChat.FriendsChatEventReceiver)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local useChannelTabUnreadWriterModule = require(expChat.useChannelTabUnreadWriter)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

local function selectIsChatWindowVisible(p0) --[[ line: 34 ]]
	return p0.ChatVisibility.isChatWindowEnabled.value
end

return function() --[[ line: 38 | named "FriendsChatEventReceiverConnector" ]]
	-- upvalues: useSelector (ref), selectSelectedTabNameModule (ref), selectIsChatWindowVisible (ref), useChannelTabUnreadWriterModule (ref), reactModule (ref), friendsChatEventReceiverModule (ref)
	return reactModule.createElement(friendsChatEventReceiverModule, {
		setTabUnread = useChannelTabUnreadWriterModule("FriendsChat"),
		selectedTabName = useSelector(selectSelectedTabNameModule),
		isChatWindowVisible = useSelector(selectIsChatWindowVisible)
	})
end