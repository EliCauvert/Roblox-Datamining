return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(PageType, RefreshTime)
	return { pageType = PageType, refreshTime = RefreshTime }
end)