local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(DevSub)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(DevSub, "table", "SetDevSub: devSub")
	
	return { devSub = DevSub }
end)