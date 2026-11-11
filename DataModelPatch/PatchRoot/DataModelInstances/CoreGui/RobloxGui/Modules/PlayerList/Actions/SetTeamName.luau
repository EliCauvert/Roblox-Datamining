return require(script.Parent.Parent.ActionCreator)("SetTeamName", function(Team, TeamName)
	return { isTeamAction = true, team = Team, teamName = TeamName }
end)