local ExpChatShared = script:FindFirstAncestor("ExpChatShared")

return require(ExpChatShared.Parent.Rodux).createReducer(nil, {
	[require(ExpChatShared.Actions.LocalTeamChanged).name] = function(_, p1)
		return p1.team
	end,
	[require(ExpChatShared.Actions.ClientAppLoaded).name] = function(_, p1)
		return p1.team
	end
})