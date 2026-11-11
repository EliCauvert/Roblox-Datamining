local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(UrlModule.NOTIFICATION_URL .. "v2/notifications/notification-preferences", "POST", {
		postBody = HttpService:JSONEncode({
			updatedPreferences = {
				{
					notificationType = "PromotionalEmails",
					notificationChannel = "Email",
					preferenceStatus = if p1 then "Personalized" else "None"
				}
			}
		})
	}):catch(function() end)
end