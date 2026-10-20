return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UniverseId, CanFollow, IsFollowed)
	assert(type(UniverseId) == "string", "SetGameFollowingStatus: universeId must be a string")
	assert(type(CanFollow) == "boolean", "SetGameFollowingStatus: canFollow must be a boolean")
	assert(type(IsFollowed) == "boolean", "SetGameFollowingStatus: isFollowed must be a boolean")
	
	return {
		universeId = UniverseId,
		canFollow = CanFollow,
		isFollowed = IsFollowed
	}
end)