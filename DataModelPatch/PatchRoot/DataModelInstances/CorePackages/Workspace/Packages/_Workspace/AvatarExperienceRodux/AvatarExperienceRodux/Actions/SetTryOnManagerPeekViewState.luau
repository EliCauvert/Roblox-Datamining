return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator("SetTryOnManagerPeekViewState", function(ViewState)
	return { viewState = ViewState }
end)