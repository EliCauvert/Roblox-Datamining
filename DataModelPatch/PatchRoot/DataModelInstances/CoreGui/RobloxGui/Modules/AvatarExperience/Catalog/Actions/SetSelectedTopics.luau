return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("Catalog-" .. script.Name, function(SelectedTopics)
	return { selectedTopics = SelectedTopics }
end)