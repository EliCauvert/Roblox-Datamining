local ExpChatShared = script:FindFirstAncestor("ExpChatShared")

return require(ExpChatShared.Parent.Rodux).createReducer(nil, {
	[require(ExpChatShared.Actions.LocalCharacterLoaded).name] = function(_, p1) --[[ Line: 8 ]]
		return p1.character
	end
})