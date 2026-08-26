return require(script.Parent.Parent.ActionCreator)("SetPlayerFollowRelationship", function(p1, p2, p3)
	return {
		player = p1,
		userId = p1.UserId,
		isFollower = p2,
		isFollowing = p3
	}
end)