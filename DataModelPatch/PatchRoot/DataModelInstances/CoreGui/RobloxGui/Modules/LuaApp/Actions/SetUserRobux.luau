return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UserId, Robux)
	assert(type(UserId) == "string", "SetUserRobux: universeId must be a string")
	assert(type(Robux) == "number", "SetUserRobux: robux must be a number")
	
	return { userId = UserId, robux = Robux }
end)