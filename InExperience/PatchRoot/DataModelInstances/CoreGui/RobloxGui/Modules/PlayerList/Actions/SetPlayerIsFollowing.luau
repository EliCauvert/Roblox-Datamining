return require(script.Parent.Parent.ActionCreator)("SetPlayerIsFollowing", function(p0, p1)
	return { player = p0, userId = p0.UserId, isFollowing = p1 }
end)