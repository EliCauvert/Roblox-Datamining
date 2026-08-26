return require(script.Parent.Parent.ActionCreator)("RemovePlayerFromTeam", function(p1, p2)
	return { player = p1, userId = p1.UserId, team = p2 }
end)