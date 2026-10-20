return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator("SetItemTryOnPeekViewState", function(ViewState)
	return { viewState = ViewState }
end)