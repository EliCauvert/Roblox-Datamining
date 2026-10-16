return require(script:FindFirstAncestor("ServerDrivenUi").Parent.Rodux).makeActionCreator(script.Name, function(FeedStoreKey) --[[ Line: 9 ]]
	return { feedStoreKey = FeedStoreKey }
end)