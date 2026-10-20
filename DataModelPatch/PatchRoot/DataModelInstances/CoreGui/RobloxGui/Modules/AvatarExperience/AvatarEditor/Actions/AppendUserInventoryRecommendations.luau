local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Models.SortResults)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid, SortResults, ForceUpdate)
	return {
		searchUuid = SearchUuid,
		sortResults = SortResults,
		forceUpdate = ForceUpdate
	}
end)