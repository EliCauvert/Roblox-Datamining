local expChat = script:FindFirstAncestor("ExpChat")

return require(expChat.Parent.Rodux).createReducer(false, {
	[require(expChat.Actions.VoiceUIVisibilityChanged).name] = function(_, p1)
		return p1.visible
	end
})