local ExpChatShared = script:FindFirstAncestor("ExpChatShared")

return require(ExpChatShared.Parent.Rodux).createReducer(nil, {
	[require(ExpChatShared.Actions.LocalCharacterLoaded).name] = function(_, p1)
		return p1.character
	end
})