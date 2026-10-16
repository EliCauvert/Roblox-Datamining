return require(script.Parent.Parent.ActionCreator)("SetTeamName", function(Team, TeamName) --[[ Line: 4 ]]
	return { isTeamAction = true, team = Team, teamName = TeamName }
end)