return require(script.Parent.Parent.ActionCreator)("SetPlayerIsBlocked", function(p0, p1)
	return { player = p0, userId = p0.UserId, isBlocked = p1 }
end)