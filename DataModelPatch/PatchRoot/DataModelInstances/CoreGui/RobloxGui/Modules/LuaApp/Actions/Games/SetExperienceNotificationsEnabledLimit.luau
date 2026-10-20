return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(Limit)
	assert(type(Limit) == "number", "SetCanTurnOnExperienceNotificationsLimit: limit must be a number")
	
	return { limit = Limit }
end)