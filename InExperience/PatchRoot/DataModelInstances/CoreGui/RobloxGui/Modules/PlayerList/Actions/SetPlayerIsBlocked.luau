return require(script.Parent.Parent.ActionCreator)("SetPlayerIsBlocked", function(p1, p2)
	return { player = p1, userId = p1.UserId, isBlocked = p2 }
end)