return require(script.Parent.Parent.ActionCreator)("SetTeamColor", function(Team, TeamColor) --[[ Line: 4 ]]
	return { isTeamAction = true, team = Team, teamColor = TeamColor }
end)