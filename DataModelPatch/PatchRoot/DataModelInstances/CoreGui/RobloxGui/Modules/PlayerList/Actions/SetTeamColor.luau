return require(script.Parent.Parent.ActionCreator)("SetTeamColor", function(Team, TeamColor)
	return { isTeamAction = true, team = Team, teamColor = TeamColor }
end)