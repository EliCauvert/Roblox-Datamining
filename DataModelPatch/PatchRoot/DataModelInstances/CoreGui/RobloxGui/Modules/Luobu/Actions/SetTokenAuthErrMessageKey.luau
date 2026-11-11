local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(ErrMessageKey)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(ErrMessageKey, "string", "errMessageKey")
	
	return { errMessageKey = ErrMessageKey }
end)