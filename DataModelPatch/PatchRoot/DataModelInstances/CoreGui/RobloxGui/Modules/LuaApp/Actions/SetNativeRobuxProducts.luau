local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(NativeRobuxProducts)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(NativeRobuxProducts, "table", "SetNativeRobuxProducts: nativeRobuxProducts")
	
	return { nativeRobuxProducts = NativeRobuxProducts }
end)