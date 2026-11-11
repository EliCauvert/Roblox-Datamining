local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(Count)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Count, "number", "SetTencentNoticeBadgeCount: count")
	
	return { count = Count }
end)