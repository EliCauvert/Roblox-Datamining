return require(script.Parent.Parent.ActionCreator)("SetPlayerIsCreator", function(p0, p1)
	return { player = p0, userId = p0.UserId, isCreator = p1 }
end)