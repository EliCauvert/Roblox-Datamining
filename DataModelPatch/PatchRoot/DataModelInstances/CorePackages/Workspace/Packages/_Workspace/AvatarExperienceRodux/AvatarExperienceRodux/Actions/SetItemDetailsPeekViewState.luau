return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator("SetItemDetailsPeekViewState", function(ViewState)
	return { viewState = ViewState }
end)