return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(TopicId, SortIndex, NumberOfRows, ItemsPerRow, Entries)
	return {
		topicId = TopicId,
		sortIndex = SortIndex,
		numberOfRows = NumberOfRows,
		itemsPerRow = ItemsPerRow,
		entries = Entries
	}
end)