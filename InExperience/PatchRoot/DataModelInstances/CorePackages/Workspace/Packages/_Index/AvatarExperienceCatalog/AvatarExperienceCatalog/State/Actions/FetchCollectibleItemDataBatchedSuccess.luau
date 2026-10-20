return require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { collectibleItemData = p1.collectibleItemData }
end)