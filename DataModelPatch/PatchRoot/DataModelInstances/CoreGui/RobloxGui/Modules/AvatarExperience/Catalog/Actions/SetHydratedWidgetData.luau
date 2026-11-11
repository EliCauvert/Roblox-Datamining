local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Payload)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Payload, "table", "payload")
	
	return { payload = Payload }
end)