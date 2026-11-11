local UserModel = require(game:GetService("CorePackages").Workspace.Packages.UserLib).Models.UserModel

return function(p1, p2)
	-- upvalues: UserModel (copy)
	local FriendPresenceCount = p1.FriendPresenceCounts[UserModel.PresenceType.IN_GAME] or 0
	p2.EventStream:setRBXEventStream("onlineFriends", "usersFriendsPresenceOnAppStartup", {
		onlineFriendCount = (p1.FriendPresenceCounts[UserModel.PresenceType.ONLINE] or 0) + FriendPresenceCount,
		inGameFriendCount = FriendPresenceCount,
		totalFriendCount = p1.FriendCount
	})
end