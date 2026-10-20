return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator("SetLookDetailsPeekViewSelectedTab", function(SelectedTab)
	return { selectedTab = SelectedTab }
end)