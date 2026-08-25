local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local friendsSurfaceVisibility = require(parent.ExpChatShared).FriendsSurfaceVisibility
local getFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local friendsChatRealtimeSubscriberModule = require(script.Parent.FriendsChatRealtimeSubscriber)
local friendsTabUnreadBridgeModule = require(script.Parent.FriendsTabUnreadBridge)
local friendsChatTabNameModule = require(script.Parent.Parent.FriendsChatTabName)

return function(p0)
	-- upvalues: getFriendsChatRealtimeStoreModule (ref), signalsReactModule (ref), getFriendsChatNavigationStoreModule (ref), reactModule (ref), friendsChatTabNameModule (ref), friendsSurfaceVisibility (ref), friendsTabUnreadBridgeModule (ref), friendsChatRealtimeSubscriberModule (ref)
	local var7 = signalsReactModule.useSignalState(getFriendsChatRealtimeStoreModule(false).getHasEnteredFriendsTab)
	local var8 = signalsReactModule.useSignalState(getFriendsChatNavigationStoreModule(false).getSelectedConversationId)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), friendsChatTabNameModule (copy), var8 (ref), friendsSurfaceVisibility (copy)
		local var9 = if p0.isChatWindowVisible and p0.selectedTabName == friendsChatTabNameModule then var8 else nil
		friendsSurfaceVisibility.setVisibleConversationId(var9)
		
		return function()
			-- upvalues: friendsSurfaceVisibility (copy), var9 (ref)
			if friendsSurfaceVisibility.getVisibleConversationId(false) == var9 then
				friendsSurfaceVisibility.setVisibleConversationId(nil)
			end
		end
	end, { p0.isChatWindowVisible, p0.selectedTabName, var8 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		unreadBridge = reactModule.createElement(friendsTabUnreadBridgeModule, {
			setTabUnread = p0.setTabUnread,
			selectedTabName = p0.selectedTabName,
			isChatWindowVisible = p0.isChatWindowVisible
		}),
		subscriber = if var7 then reactModule.createElement(friendsChatRealtimeSubscriberModule, {
			onActiveConversationMessageReceived = p0.onActiveConversationMessageReceived
		}) else nil
	})
end