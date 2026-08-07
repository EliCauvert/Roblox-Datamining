local expChat = script:FindFirstAncestor("ExpChat")

return require(expChat.Parent.Rodux).createReducer(false, {
	[require(expChat.Actions.VoiceEnabledChanged).name] = function(_, p0) --[[ line: 9 ]]
		return p0.enabled
	end
})