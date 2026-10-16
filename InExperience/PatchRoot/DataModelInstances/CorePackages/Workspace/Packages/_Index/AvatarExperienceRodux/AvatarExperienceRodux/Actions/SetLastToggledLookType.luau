return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 14 ]]
	return { lastToggledLookType = p1.lastToggledLookType }
end)