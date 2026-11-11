local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(TencentAuthInfo)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(TencentAuthInfo, "table", "tencentAuthInfo")
	
	return { tencentAuthInfo = TencentAuthInfo }
end)