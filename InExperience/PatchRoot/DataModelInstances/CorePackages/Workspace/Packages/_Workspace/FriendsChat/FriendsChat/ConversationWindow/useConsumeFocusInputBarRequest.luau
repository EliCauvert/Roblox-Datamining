local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local isFocusRequestFreshModule = require(friendsChat.Focus.isFocusRequestFresh)

return function(p0) --[[ line: 24 | named "useConsumeFocusInputBarRequest" ]]
	-- upvalues: reactModule (ref), getFriendsChatNavigationStoreModule (ref), signalsModule (ref), isFocusRequestFreshModule (ref)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: getFriendsChatNavigationStoreModule (copy), signalsModule (copy), isFocusRequestFreshModule (copy), p0 (ref)
		local var5 = getFriendsChatNavigationStoreModule(false)
		
		return signalsModule.createEffect(function(p1) --[[ line: 27 ]]
			-- upvalues: var5 (ref), isFocusRequestFreshModule (copy), p0 (copy)
			local focusInputBarRequestTime = var5.getFocusInputBarRequestTime(p1)
			
			if focusInputBarRequestTime == nil then return end
			if isFocusRequestFreshModule(focusInputBarRequestTime, os.clock(), 5) then
				p0()
			end
			var5.clearFocusInputBarRequest()
		end)
	end, { p0 })
end