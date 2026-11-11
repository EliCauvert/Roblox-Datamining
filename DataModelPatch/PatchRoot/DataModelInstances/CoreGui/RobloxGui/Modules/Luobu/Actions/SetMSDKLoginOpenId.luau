local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(OpenId)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(OpenId, "string", "openId")
	
	return { openId = OpenId }
end)