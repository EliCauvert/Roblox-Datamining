return require(script:FindFirstAncestor("ServerDrivenUi").Parent.Rodux).makeActionCreator(script.Name, function(FeedStoreKey)
	return { feedStoreKey = FeedStoreKey }
end)