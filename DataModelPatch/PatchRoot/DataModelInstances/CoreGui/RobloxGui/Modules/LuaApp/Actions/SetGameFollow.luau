return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UniverseId, IsFollowed)
	assert(type(UniverseId) == "string", "SetGameFollow: universeId must be a string")
	assert(type(IsFollowed) == "boolean", "SetGameFollow: isFollowed must be a boolean")
	
	return { universeId = UniverseId, isFollowed = IsFollowed }
end)