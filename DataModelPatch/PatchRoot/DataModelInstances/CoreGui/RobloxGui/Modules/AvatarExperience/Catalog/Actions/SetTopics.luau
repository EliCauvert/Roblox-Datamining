return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("Catalog-" .. script.Name, function(SelectedTopics, InitialItems, SearchKeyword, NewTopics)
	return {
		selectedTopics = SelectedTopics,
		initialItems = InitialItems,
		searchKeyword = SearchKeyword,
		newTopics = NewTopics
	}
end)