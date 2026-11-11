local ExpChat = script:FindFirstAncestor("ExpChat")

return require(ExpChat.Parent.Rodux).createReducer(false, {
	[require(ExpChat.Actions.VoiceEnabledChanged).name] = function(_, p1)
		return p1.enabled
	end
})