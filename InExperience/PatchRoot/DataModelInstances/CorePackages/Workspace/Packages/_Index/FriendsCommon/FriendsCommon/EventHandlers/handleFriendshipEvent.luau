local var1 = require(script:FindFirstAncestor("FriendsCommon").Parent.DataHydration).Friends.FriendsStore.get()

return function(p1)
	-- upvalues: var1 (ref)
	if p1.friendshipUpdate.removedUserId then
		var1.UpdateIsFriendsWith(p1.friendshipUpdate.removedUserId, false)
		
		return
	elseif p1.friendshipUpdate.addedUserId then
		var1.RefetchOnlineFriends()
		var1.UpdateIsFriendsWith(p1.friendshipUpdate.addedUserId, true)
	end
end