return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(ContentIds)
	return { contentIds = ContentIds }
end)