local var0 = require(script:FindFirstAncestor("FriendsCommon").Parent.DataHydration).Friends.FriendsStore.get()

return function(p0)
	-- upvalues: var0 (ref)
	if p0.friendshipUpdate.removedUserId then
		var0.UpdateIsFriendsWith(p0.friendshipUpdate.removedUserId, false)
		
		return
	elseif p0.friendshipUpdate.addedUserId then
		var0.RefetchOnlineFriends()
		var0.UpdateIsFriendsWith(p0.friendshipUpdate.addedUserId, true)
	end
end