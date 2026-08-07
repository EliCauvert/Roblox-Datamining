local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local friendsChatRealtimeSubscriberModule = require(script.Parent.FriendsChatRealtimeSubscriber)
local friendsTabUnreadBridgeModule = require(script.Parent.FriendsTabUnreadBridge)

return function(p0) --[[ line: 34 | named "FriendsChatEventReceiver" ]]
	-- upvalues: getFriendsChatRealtimeStoreModule (ref), signalsReactModule (ref), reactModule (ref), friendsTabUnreadBridgeModule (ref), friendsChatRealtimeSubscriberModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		unreadBridge = reactModule.createElement(friendsTabUnreadBridgeModule, {
			setTabUnread = p0.setTabUnread,
			selectedTabName = p0.selectedTabName,
			isChatWindowVisible = p0.isChatWindowVisible
		}),
		subscriber = if signalsReactModule.useSignalState(getFriendsChatRealtimeStoreModule(false).getHasEnteredFriendsTab) then reactModule.createElement(friendsChatRealtimeSubscriberModule) else nil
	})
end