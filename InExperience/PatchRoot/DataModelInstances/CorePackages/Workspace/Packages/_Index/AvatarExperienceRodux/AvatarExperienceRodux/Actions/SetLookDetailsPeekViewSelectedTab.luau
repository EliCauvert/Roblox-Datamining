return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator("SetLookDetailsPeekViewSelectedTab", function(p1)
	return { selectedTab = p1 }
end)