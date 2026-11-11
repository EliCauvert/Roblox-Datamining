return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UniverseId, ContainsStrongLanguage)
	return {
		universeId = UniverseId,
		containsStrongLanguage = ContainsStrongLanguage
	}
end)