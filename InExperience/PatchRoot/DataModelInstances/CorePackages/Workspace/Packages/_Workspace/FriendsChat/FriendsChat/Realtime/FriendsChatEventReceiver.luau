local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local friendsSurfaceVisibility = require(parent.ExpChatShared).FriendsSurfaceVisibility
local getFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local friendsChatRealtimeSubscriberModule = require(script.Parent.FriendsChatRealtimeSubscriber)
local friendsTabUnreadBridgeModule = require(script.Parent.FriendsTabUnreadBridge)

return function(p0) --[[ line: 40 | named "FriendsChatEventReceiver" ]]
	-- upvalues: getFriendsChatRealtimeStoreModule (ref), signalsReactModule (ref), getFriendsChatNavigationStoreModule (ref), reactModule (ref), friendsSurfaceVisibility (ref), friendsTabUnreadBridgeModule (ref), friendsChatRealtimeSubscriberModule (ref)
	local var6 = signalsReactModule.useSignalState(getFriendsChatRealtimeStoreModule(false).getHasEnteredFriendsTab)
	local var7 = signalsReactModule.useSignalState(getFriendsChatNavigationStoreModule(false).getSelectedConversationId)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: p0 (ref), var7 (ref), friendsSurfaceVisibility (copy)
		local var8 = if p0.isChatWindowVisible and p0.selectedTabName == "FriendsChat" then var7 else nil
		friendsSurfaceVisibility.setVisibleConversationId(var8)
		
		return function() --[[ line: 53 ]]
			-- upvalues: friendsSurfaceVisibility (copy), var8 (ref)
			if friendsSurfaceVisibility.getVisibleConversationId(false) == var8 then
				friendsSurfaceVisibility.setVisibleConversationId(nil)
			end
		end
	end, { p0.isChatWindowVisible, p0.selectedTabName, var7 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		unreadBridge = reactModule.createElement(friendsTabUnreadBridgeModule, {
			setTabUnread = p0.setTabUnread,
			selectedTabName = p0.selectedTabName,
			isChatWindowVisible = p0.isChatWindowVisible
		}),
		subscriber = if var6 then reactModule.createElement(friendsChatRealtimeSubscriberModule, {
			onActiveConversationMessageReceived = p0.onActiveConversationMessageReceived
		}) else nil
	})
end