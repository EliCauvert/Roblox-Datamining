local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(DevSubs)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(DevSubs, "table", "SetDevSubs: devSubs")
	
	return { devSubs = DevSubs }
end)