local appChat = script:FindFirstAncestor("AppChat")

return require(appChat.Parent.Rodux).createReducer(false, {
	[require(appChat.Actions.SetAppLoaded).name] = function(_, p1)
		return p1.value
	end
})