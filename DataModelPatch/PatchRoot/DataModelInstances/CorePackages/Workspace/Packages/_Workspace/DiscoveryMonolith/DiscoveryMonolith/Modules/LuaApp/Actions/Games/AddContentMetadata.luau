return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(ContentMetadata)
	return { contentMetadata = ContentMetadata }
end)