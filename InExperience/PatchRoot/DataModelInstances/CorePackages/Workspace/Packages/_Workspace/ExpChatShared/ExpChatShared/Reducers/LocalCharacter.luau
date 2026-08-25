local expChatShared = script:FindFirstAncestor("ExpChatShared")

return require(expChatShared.Parent.Rodux).createReducer(nil, {
	[require(expChatShared.Actions.LocalCharacterLoaded).name] = function(_, p0)
		return p0.character
	end
})