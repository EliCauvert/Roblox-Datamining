local friendsCommon = script:FindFirstAncestor("FriendsCommon")
local reactModule = require(friendsCommon.Parent.React)
local handleFriendshipEventModule = require(friendsCommon.EventHandlers.handleFriendshipEvent)

return function() --[[ line: 8 | named "useHandleFriendshipEvent" ]]
	-- upvalues: reactModule (ref), handleFriendshipEventModule (ref)
	return reactModule.useCallback(function(p0) --[[ line: 9 ]]
		-- upvalues: handleFriendshipEventModule (copy)
		handleFriendshipEventModule({ friendshipUpdate = p0 })
	end, {})
end