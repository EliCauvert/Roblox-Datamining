local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(NotificationCount)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNonNegativeNumber(NotificationCount, "SetNotificationCount: notificationCount")
	
	return { notificationCount = NotificationCount }
end)