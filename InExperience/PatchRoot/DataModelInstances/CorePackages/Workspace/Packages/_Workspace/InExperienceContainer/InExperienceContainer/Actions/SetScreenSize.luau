return require(script:FindFirstAncestor("InExperienceContainer").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { screenSize = p1 }
end)