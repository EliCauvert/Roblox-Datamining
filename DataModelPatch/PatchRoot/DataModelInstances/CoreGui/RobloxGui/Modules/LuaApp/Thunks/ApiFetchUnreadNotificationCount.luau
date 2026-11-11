local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetUnreadNotificationCountModule = require(Modules.LuaApp.Http.Requests.GetUnreadNotificationCount)
local SetNotificationCountModule = require(Modules.LuaApp.Actions.SetNotificationCount)

return function(p1)
	-- upvalues: GetUnreadNotificationCountModule (copy), SetNotificationCountModule (copy)
	return function(p2)
		-- upvalues: GetUnreadNotificationCountModule (upval), p1 (copy), SetNotificationCountModule (upval)
		return GetUnreadNotificationCountModule(p1):andThen(function(Result)
			-- upvalues: p2 (copy), SetNotificationCountModule (upval)
			local UnreadNotifications = Result.responseBody.unreadNotifications
			p2:dispatch(SetNotificationCountModule(UnreadNotifications))
			
			return UnreadNotifications
		end)
	end
end