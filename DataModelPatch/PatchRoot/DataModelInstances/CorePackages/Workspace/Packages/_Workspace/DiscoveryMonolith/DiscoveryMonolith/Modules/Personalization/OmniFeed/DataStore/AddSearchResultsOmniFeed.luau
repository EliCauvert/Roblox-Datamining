return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(SearchUuid, TopicId, TreatmentType, SortIndex, TopicLayoutData)
	return {
		searchUuid = SearchUuid,
		topicId = TopicId,
		treatmentType = TreatmentType,
		sortIndex = SortIndex,
		topicLayoutData = TopicLayoutData
	}
end)