return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(SearchUuid, Parameters)
	return { searchUuid = SearchUuid, parameters = Parameters }
end)