return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(GroupId, Sorts, SortsTopicLayoutData)
	return {
		groupId = GroupId,
		sorts = Sorts,
		sortsTopicLayoutData = SortsTopicLayoutData
	}
end)