return require(script.Parent.Parent.ActionCreator)("SetTeamColor", function(p1, p2)
	return { isTeamAction = true, team = p1, teamColor = p2 }
end)