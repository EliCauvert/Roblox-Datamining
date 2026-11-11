local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(Left, Top, Right, Bottom)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNonNegativeNumber(Left, "SetGlobalGuiInset: left")
	ArgCheckModule.isNonNegativeNumber(Top, "SetGlobalGuiInset: top")
	ArgCheckModule.isNonNegativeNumber(Right, "SetGlobalGuiInset: right")
	ArgCheckModule.isNonNegativeNumber(Bottom, "SetGlobalGuiInset: bottom")
	
	return { left = Left, top = Top, right = Right, bottom = Bottom }
end)