return require(script.Parent.Parent.ActionCreator)("SetTeamColor", function(p0, p1)
	return { isTeamAction = true, team = p0, teamColor = p1 }
end)