local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)

return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UserModerated)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UserModerated, "boolean", "SetModerationStatus action expects `modStatus` to be a boolean")
	
	return { userModerated = UserModerated }
end)