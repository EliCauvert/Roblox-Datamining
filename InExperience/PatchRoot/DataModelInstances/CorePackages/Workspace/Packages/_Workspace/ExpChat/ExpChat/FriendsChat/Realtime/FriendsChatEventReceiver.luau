local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local friendsChatRealtimeSubscriberModule = require(script.Parent.FriendsChatRealtimeSubscriber)

return function() --[[ line: 22 | named "FriendsChatEventReceiver" ]]
	-- upvalues: getFriendsChatRealtimeStoreModule (ref), signalsReactModule (ref), reactModule (ref), friendsChatRealtimeSubscriberModule (ref)
	return if signalsReactModule.useSignalState(getFriendsChatRealtimeStoreModule(false).getHasEnteredFriendsTab) then reactModule.createElement(friendsChatRealtimeSubscriberModule) else nil
end