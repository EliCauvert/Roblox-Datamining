return require(script:FindFirstAncestor("GameDetail").Parent.Rodux).makeActionCreator("SetGameDetailsPeekViewState", function(p1)
	return { viewState = p1 }
end)