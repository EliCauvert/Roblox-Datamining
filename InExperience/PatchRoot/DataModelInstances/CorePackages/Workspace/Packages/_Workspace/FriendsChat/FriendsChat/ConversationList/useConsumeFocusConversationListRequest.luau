local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local IsFocusRequestFreshModule = require(FriendsChat.Focus.isFocusRequestFresh)

return function(Callback, Callback1)
	-- upvalues: ReactModule (copy), GetFriendsChatNavigationStoreModule (copy), SignalsModule (copy), IsFocusRequestFreshModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: GetFriendsChatNavigationStoreModule (upval), SignalsModule (upval), IsFocusRequestFreshModule (upval), Callback (copy), Callback1 (copy)
		local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
		
		return SignalsModule.createEffect(function(p1)
			-- upvalues: FriendsChatNavigationStoreModule (copy), IsFocusRequestFreshModule (upval), Callback (upval), Callback1 (upval)
			local ConversationListFocusRequestTime = FriendsChatNavigationStoreModule.getConversationListFocusRequestTime(p1)
			
			if ConversationListFocusRequestTime == nil then return end
			if not IsFocusRequestFreshModule(ConversationListFocusRequestTime, os.clock(), 5) then
				FriendsChatNavigationStoreModule.clearConversationListFocusRequest()
				
				return
			end
			local CallbackResult = Callback(p1)
			
			if CallbackResult ~= nil then
				Callback1(CallbackResult)
				FriendsChatNavigationStoreModule.clearConversationListFocusRequest()
				
				return
			end
		end)
	end, { Callback, Callback1 })
end