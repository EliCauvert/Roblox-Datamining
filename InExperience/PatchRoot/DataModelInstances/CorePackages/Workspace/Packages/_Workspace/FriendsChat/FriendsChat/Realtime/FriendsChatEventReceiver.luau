local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local friendsSurfaceVisibility = require(parent.ExpChatShared).FriendsSurfaceVisibility
local getFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local friendsChatRealtimeSubscriberModule = require(script.Parent.FriendsChatRealtimeSubscriber)
local friendsTabUnreadBridgeModule = require(script.Parent.FriendsTabUnreadBridge)
local friendsChatTabNameModule = require(script.Parent.Parent.FriendsChatTabName)

return function(p1)
	-- upvalues: getFriendsChatRealtimeStoreModule (ref), signalsReactModule (ref), getFriendsChatNavigationStoreModule (ref), reactModule (ref), friendsChatTabNameModule (ref), friendsSurfaceVisibility (ref), friendsTabUnreadBridgeModule (ref), friendsChatRealtimeSubscriberModule (ref)
	local var1 = signalsReactModule.useSignalState(getFriendsChatRealtimeStoreModule(false).getHasEnteredFriendsTab)
	local var2 = signalsReactModule.useSignalState(getFriendsChatNavigationStoreModule(false).getSelectedConversationId)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), friendsChatTabNameModule (copy), var2 (ref), friendsSurfaceVisibility (copy)
		local var3 = if p1.isChatWindowVisible and p1.selectedTabName == friendsChatTabNameModule then var2 else nil
		friendsSurfaceVisibility.setVisibleConversationId(var3)
		
		return function()
			-- upvalues: friendsSurfaceVisibility (copy), var3 (ref)
			if friendsSurfaceVisibility.getVisibleConversationId(false) == var3 then
				friendsSurfaceVisibility.setVisibleConversationId(nil)
			end
		end
	end, { p1.isChatWindowVisible, p1.selectedTabName, var2 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		unreadBridge = reactModule.createElement(friendsTabUnreadBridgeModule, {
			setTabUnread = p1.setTabUnread,
			selectedTabName = p1.selectedTabName,
			isChatWindowVisible = p1.isChatWindowVisible
		}),
		subscriber = if var1 then reactModule.createElement(friendsChatRealtimeSubscriberModule, {
			onActiveConversationMessageReceived = p1.onActiveConversationMessageReceived
		}) else nil
	})
end