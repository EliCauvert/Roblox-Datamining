return require(script:FindFirstAncestor("GameDetail").Parent.Rodux).makeActionCreator("SetGameDetailsPeekViewState", function(ViewState)
	return { viewState = ViewState }
end)