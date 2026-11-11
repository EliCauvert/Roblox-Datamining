return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UniverseId, PrivateServersEnabled)
	assert(type(UniverseId) == "string", "SetGamePrivateServersEnabled: universeId must be a string")
	assert(type(PrivateServersEnabled) == "boolean", "SetGamePrivateServersEnabled: isFavorited must be a boolean")
	
	return {
		universeId = UniverseId,
		privateServersEnabled = PrivateServersEnabled
	}
end)