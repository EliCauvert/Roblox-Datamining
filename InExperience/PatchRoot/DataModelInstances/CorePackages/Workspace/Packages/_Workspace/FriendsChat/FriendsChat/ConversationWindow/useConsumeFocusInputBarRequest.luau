local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local IsFocusRequestFreshModule = require(FriendsChat.Focus.isFocusRequestFresh)

return function(Callback)
	-- upvalues: ReactModule (copy), GetFriendsChatNavigationStoreModule (copy), SignalsModule (copy), IsFocusRequestFreshModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: GetFriendsChatNavigationStoreModule (upval), SignalsModule (upval), IsFocusRequestFreshModule (upval), Callback (copy)
		local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
		
		return SignalsModule.createEffect(function(p1)
			-- upvalues: FriendsChatNavigationStoreModule (copy), IsFocusRequestFreshModule (upval), Callback (upval)
			local FocusInputBarRequestTime = FriendsChatNavigationStoreModule.getFocusInputBarRequestTime(p1)
			
			if FocusInputBarRequestTime == nil then return end
			if IsFocusRequestFreshModule(FocusInputBarRequestTime, os.clock(), 5) then
				Callback()
			end
			FriendsChatNavigationStoreModule.clearFocusInputBarRequest()
		end)
	end, { Callback })
end