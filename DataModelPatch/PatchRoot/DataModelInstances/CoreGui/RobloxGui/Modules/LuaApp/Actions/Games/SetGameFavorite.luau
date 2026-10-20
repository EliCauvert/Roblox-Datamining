return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UniverseId, IsFavorited)
	assert(type(UniverseId) == "string", "SetGameFavorite: universeId must be a string")
	assert(type(IsFavorited) == "boolean", "SetGameFavorite: isFavorited must be a boolean")
	
	return { universeId = UniverseId, isFavorited = IsFavorited }
end)