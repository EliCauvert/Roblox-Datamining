return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator("SetItemTryOnPeekViewState", function(p1)
	return { viewState = p1 }
end)