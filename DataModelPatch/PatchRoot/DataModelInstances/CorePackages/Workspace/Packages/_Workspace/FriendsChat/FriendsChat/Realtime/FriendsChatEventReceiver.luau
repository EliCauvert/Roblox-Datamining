local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local FriendsChatRealtimeSubscriberModule = require(script.Parent.FriendsChatRealtimeSubscriber)
local FriendsTabUnreadBridgeModule = require(script.Parent.FriendsTabUnreadBridge)

return function(p1)
	-- upvalues: GetFriendsChatRealtimeStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), FriendsTabUnreadBridgeModule (copy), FriendsChatRealtimeSubscriberModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		unreadBridge = ReactModule.createElement(FriendsTabUnreadBridgeModule, {
			setTabUnread = p1.setTabUnread,
			selectedTabName = p1.selectedTabName,
			isChatWindowVisible = p1.isChatWindowVisible
		}),
		subscriber = if SignalsReactModule.useSignalState(GetFriendsChatRealtimeStoreModule(false).getHasEnteredFriendsTab) then ReactModule.createElement(FriendsChatRealtimeSubscriberModule) else nil
	})
end