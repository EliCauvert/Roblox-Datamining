local friendsCommon = script:FindFirstAncestor("FriendsCommon")
local reactModule = require(friendsCommon.Parent.React)
local handleFriendshipEventModule = require(friendsCommon.EventHandlers.handleFriendshipEvent)

return function()
	-- upvalues: reactModule (ref), handleFriendshipEventModule (ref)
	return reactModule.useCallback(function(p1)
		-- upvalues: handleFriendshipEventModule (copy)
		handleFriendshipEventModule({ friendshipUpdate = p1 })
	end, {})
end