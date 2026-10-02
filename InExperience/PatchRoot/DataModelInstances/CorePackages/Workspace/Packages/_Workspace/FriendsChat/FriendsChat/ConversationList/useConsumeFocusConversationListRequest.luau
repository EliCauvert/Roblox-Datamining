local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local isFocusRequestFreshModule = require(friendsChat.Focus.isFocusRequestFresh)

return function(p1, p2)
	-- upvalues: reactModule (ref), getFriendsChatNavigationStoreModule (ref), signalsModule (ref), isFocusRequestFreshModule (ref)
	reactModule.useEffect(function()
		-- upvalues: getFriendsChatNavigationStoreModule (copy), signalsModule (copy), isFocusRequestFreshModule (copy), p1 (ref), p2 (ref)
		local var1 = getFriendsChatNavigationStoreModule(false)
		
		return signalsModule.createEffect(function(p3)
			-- upvalues: var1 (ref), isFocusRequestFreshModule (copy), p1 (copy), p2 (copy)
			local conversationListFocusRequestTime = var1.getConversationListFocusRequestTime(p3)
			
			if conversationListFocusRequestTime == nil then return end
			if not isFocusRequestFreshModule(conversationListFocusRequestTime, os.clock(), 5) then
				var1.clearConversationListFocusRequest()
				
				return
			end
			local var2 = p1(p3)
			
			if var2 == nil then
				return
			end
			p2(var2)
			var1.clearConversationListFocusRequest()
		end)
	end, { p1, p2 })
end