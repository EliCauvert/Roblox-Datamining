local appChat = script:FindFirstAncestor("AppChat")

return require(appChat.Parent.Rodux).createReducer(false, {
	[require(appChat.Actions.SetAppLoaded).name] = function(_, p0)
		return p0.value
	end
})