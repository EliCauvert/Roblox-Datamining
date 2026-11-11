return require(script:FindFirstAncestor("InExperienceContainer").Parent.Rodux).makeActionCreator(script.Name, function(ScreenSize)
	return { screenSize = ScreenSize }
end)