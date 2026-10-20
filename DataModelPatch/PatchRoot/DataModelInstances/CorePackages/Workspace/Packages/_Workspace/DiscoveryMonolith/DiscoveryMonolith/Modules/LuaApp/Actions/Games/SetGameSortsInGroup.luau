return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(GroupId, Sorts, PageId, SortsTopicLayoutData)
	return {
		groupId = GroupId,
		sorts = Sorts,
		pageId = PageId,
		sortsTopicLayoutData = SortsTopicLayoutData
	}
end)