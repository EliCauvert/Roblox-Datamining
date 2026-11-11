local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(LoginInProgress)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(LoginInProgress, "boolean", "loginInProgress")
	
	return { loginInProgress = LoginInProgress }
end)