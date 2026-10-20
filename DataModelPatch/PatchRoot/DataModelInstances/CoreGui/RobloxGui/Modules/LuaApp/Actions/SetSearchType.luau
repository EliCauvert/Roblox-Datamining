return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(SearchUuid, SearchType)
	return { searchUuid = SearchUuid, searchType = SearchType }
end)