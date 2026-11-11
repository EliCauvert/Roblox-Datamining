return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(Count)
	assert(type(Count) == "number", "SetCanTurnOnExperienceNotificationsCount: count must be a number")
	
	return { count = Count }
end)