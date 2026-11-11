local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(p1)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join({ updateRequested = true }, p1 or {})
end)