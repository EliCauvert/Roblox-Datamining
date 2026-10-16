return require(script:FindFirstAncestor("InExperienceContainer").Parent.Rodux).makeActionCreator(script.Name, function(ScreenSize) --[[ Line: 6 ]]
	return { screenSize = ScreenSize }
end)