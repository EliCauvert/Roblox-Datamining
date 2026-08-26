local expChatShared = script:FindFirstAncestor("ExpChatShared")

return require(expChatShared.Parent.Rodux).createReducer(nil, {
	[require(expChatShared.Actions.LocalCharacterLoaded).name] = function(_, p1)
		return p1.character
	end
})