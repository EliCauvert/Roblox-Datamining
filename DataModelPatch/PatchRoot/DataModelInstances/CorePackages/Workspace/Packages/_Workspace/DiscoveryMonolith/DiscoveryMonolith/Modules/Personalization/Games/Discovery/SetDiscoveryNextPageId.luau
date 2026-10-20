return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(NextPageId)
	return { nextPageId = NextPageId }
end)