local expChatShared = script:FindFirstAncestor("ExpChatShared")

return require(expChatShared.Parent.Rodux).createReducer(nil, {
	[require(expChatShared.Actions.LocalTeamChanged).name] = function(_, p0) --[[ line: 9 ]]
		return p0.team
	end,
	[require(expChatShared.Actions.ClientAppLoaded).name] = function(_, p1) --[[ line: 13 ]]
		return p1.team
	end
})