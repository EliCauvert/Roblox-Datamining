local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local isFocusRequestFreshModule = require(friendsChat.Focus.isFocusRequestFresh)

return function(p1)
	-- upvalues: reactModule (ref), getFriendsChatNavigationStoreModule (ref), signalsModule (ref), isFocusRequestFreshModule (ref)
	reactModule.useEffect(function()
		-- upvalues: getFriendsChatNavigationStoreModule (copy), signalsModule (copy), isFocusRequestFreshModule (copy), p1 (ref)
		local var1 = getFriendsChatNavigationStoreModule(false)
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: var1 (ref), isFocusRequestFreshModule (copy), p1 (copy)
			local focusInputBarRequestTime = var1.getFocusInputBarRequestTime(p2)
			
			if focusInputBarRequestTime == nil then return end
			if isFocusRequestFreshModule(focusInputBarRequestTime, os.clock(), 5) then
				p1()
			end
			var1.clearFocusInputBarRequest()
		end)
	end, { p1 })
end