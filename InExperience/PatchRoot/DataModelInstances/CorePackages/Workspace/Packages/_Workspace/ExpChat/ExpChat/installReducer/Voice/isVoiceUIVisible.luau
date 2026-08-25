local expChat = script:FindFirstAncestor("ExpChat")

return require(expChat.Parent.Rodux).createReducer(false, {
	[require(expChat.Actions.VoiceUIVisibilityChanged).name] = function(_, p0)
		return p0.visible
	end
})