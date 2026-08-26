return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator("SetItemDetailsPeekViewState", function(p1)
	return { viewState = p1 }
end)