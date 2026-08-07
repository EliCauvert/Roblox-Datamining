return require(script.Parent.Parent.ActionCreator)("SetPlayerFollowRelationship", function(p0, p1, p2) --[[ line: 4 ]]
	return {
		player = p0,
		userId = p0.UserId,
		isFollower = p1,
		isFollowing = p2
	}
end)