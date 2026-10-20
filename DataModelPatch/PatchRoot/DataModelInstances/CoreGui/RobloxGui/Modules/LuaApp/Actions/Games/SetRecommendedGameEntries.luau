return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UniverseId, Entries)
	return { universeId = UniverseId, entries = Entries }
end)