local SetFriendCount = require(script:FindFirstAncestor("LegacyFriendsRodux").Actions).SetFriendCount

return function(p1, p2) --[[ Line: 5 ]]
	-- upvalues: SetFriendCount (copy)
	return if p2.type == SetFriendCount.name then p2.count else p1 or 0
end