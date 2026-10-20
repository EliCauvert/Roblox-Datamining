local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(SignUpInProgress)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(SignUpInProgress, "boolean", "signUpInProgress")
	
	return { signUpInProgress = SignUpInProgress }
end)