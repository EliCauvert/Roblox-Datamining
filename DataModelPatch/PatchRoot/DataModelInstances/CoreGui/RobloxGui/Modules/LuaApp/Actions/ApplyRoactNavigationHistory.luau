local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(p1)
	-- upvalues: ArgCheckModule (copy)
	return {
		navigationState = ArgCheckModule.isTypeOrNil(p1, "table", "navigationState")
	}
end)