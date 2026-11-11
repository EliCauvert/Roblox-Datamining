return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(TopicId, SortIndex, ItemsPerRow, Entries)
	return {
		topicId = TopicId,
		sortIndex = SortIndex,
		itemsPerRow = ItemsPerRow,
		entries = Entries
	}
end)