local ExpChat = script:FindFirstAncestor("ExpChat")

return require(ExpChat.Parent.Rodux).createReducer(false, {
	[require(ExpChat.Actions.VoiceUIVisibilityChanged).name] = function(_, p1) --[[ Line: 9 ]]
		return p1.visible
	end
})