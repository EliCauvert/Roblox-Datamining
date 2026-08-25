local expChatShared = script:FindFirstAncestor("ExpChatShared")

return require(expChatShared.Parent.Rodux).createReducer(nil, {
	[require(expChatShared.Actions.LocalTeamChanged).name] = function(_, p0)
		return p0.team
	end,
	[require(expChatShared.Actions.ClientAppLoaded).name] = function(_, p1)
		return p1.team
	end
})