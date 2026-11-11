return require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { lastToggledLookType = p1.lastToggledLookType }
end)