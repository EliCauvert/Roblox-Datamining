local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local FriendsSurfaceVisibility = require(Parent.ExpChatShared).FriendsSurfaceVisibility
local GetFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local FriendsChatRealtimeSubscriberModule = require(script.Parent.FriendsChatRealtimeSubscriber)
local FriendsCountRefetchBridgeModule = require(script.Parent.FriendsCountRefetchBridge)
local FriendsTabUnreadBridgeModule = require(script.Parent.FriendsTabUnreadBridge)
local FriendsChatTabNameModule = require(script.Parent.Parent.FriendsChatTabName)
local FFlagFriendsChatHasFriendsGate = SharedFlagsModule.FFlagFriendsChatHasFriendsGate
local FFlagExpChatCanShowFriendsTab = SharedFlagsModule.FFlagExpChatCanShowFriendsTab

return function(p1) --[[ Line: 44 | Named "FriendsChatEventReceiver" ]]
	-- upvalues: GetFriendsChatRealtimeStoreModule (copy), SignalsReactModule (copy), GetFriendsChatNavigationStoreModule (copy), ReactModule (copy), FriendsChatTabNameModule (copy), FriendsSurfaceVisibility (copy), FriendsTabUnreadBridgeModule (copy), FFlagFriendsChatHasFriendsGate (copy), FFlagExpChatCanShowFriendsTab (copy), FriendsCountRefetchBridgeModule (copy), FriendsChatRealtimeSubscriberModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetFriendsChatRealtimeStoreModule(false).getHasEnteredFriendsTab)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetFriendsChatNavigationStoreModule(false).getSelectedConversationId)
	ReactModule.useEffect(function() --[[ Line: 50 ]]
		-- upvalues: p1 (copy), FriendsChatTabNameModule (upval), UseSignalStateResult1 (copy), FriendsSurfaceVisibility (upval)
		local UseSignalStateResult = if p1.isChatWindowVisible and p1.selectedTabName == FriendsChatTabNameModule then UseSignalStateResult1 else nil
		FriendsSurfaceVisibility.setVisibleConversationId(UseSignalStateResult)
		
		return function() --[[ Line: 57 ]]
			-- upvalues: FriendsSurfaceVisibility (upval), UseSignalStateResult (copy)
			if FriendsSurfaceVisibility.getVisibleConversationId(false) == UseSignalStateResult then
				FriendsSurfaceVisibility.setVisibleConversationId(nil)
			end
		end
	end, {
		p1.isChatWindowVisible,
		p1.selectedTabName,
		UseSignalStateResult1
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		unreadBridge = ReactModule.createElement(FriendsTabUnreadBridgeModule, {
			setTabUnread = p1.setTabUnread,
			selectedTabName = p1.selectedTabName,
			isChatWindowVisible = p1.isChatWindowVisible
		}),
		countRefetchBridge = if FFlagFriendsChatHasFriendsGate and FFlagExpChatCanShowFriendsTab then ReactModule.createElement(FriendsCountRefetchBridgeModule) else nil,
		subscriber = if UseSignalStateResult then ReactModule.createElement(FriendsChatRealtimeSubscriberModule, {
			onActiveConversationMessageReceived = p1.onActiveConversationMessageReceived
		}) else nil
	})
end