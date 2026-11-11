local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(Left, Top, Right, Bottom)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNonNegativeNumber(Left, "SetGlobalContextMenuInset: left")
	ArgCheckModule.isNonNegativeNumber(Top, "SetGlobalContextMenuInset: top")
	ArgCheckModule.isNonNegativeNumber(Right, "SetGlobalContextMenuInset: right")
	ArgCheckModule.isNonNegativeNumber(Bottom, "SetGlobalContextMenuInset: bottom")
	
	return { left = Left, top = Top, right = Right, bottom = Bottom }
end)