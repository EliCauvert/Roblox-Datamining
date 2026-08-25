return require(script.Parent.Parent.ActionCreator)("SetTeamName", function(p0, p1)
	return { isTeamAction = true, team = p0, teamName = p1 }
end)