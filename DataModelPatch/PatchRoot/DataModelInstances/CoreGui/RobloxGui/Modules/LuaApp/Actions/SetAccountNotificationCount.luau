local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(AccountNotificationCount)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNonNegativeNumber(AccountNotificationCount, "SetAccountNotificationCount: accountNotificationCount")
	
	return { accountNotificationCount = AccountNotificationCount }
end)