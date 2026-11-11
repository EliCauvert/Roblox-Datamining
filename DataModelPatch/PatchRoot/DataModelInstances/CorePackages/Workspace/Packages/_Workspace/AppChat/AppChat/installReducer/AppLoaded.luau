local AppChat = script:FindFirstAncestor("AppChat")

return require(AppChat.Parent.Rodux).createReducer(false, {
	[require(AppChat.Actions.SetAppLoaded).name] = function(_, p1)
		return p1.value
	end
})