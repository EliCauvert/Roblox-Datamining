return require(script.Parent.Parent.ActionCreator)("AddPlayerToTeam", function(p0, p1)
	return { player = p0, userId = p0.UserId, team = p1 }
end)