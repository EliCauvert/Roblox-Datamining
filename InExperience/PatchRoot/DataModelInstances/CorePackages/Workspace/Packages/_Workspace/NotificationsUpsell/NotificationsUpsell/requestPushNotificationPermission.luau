local appStorageService = game:GetService("AppStorageService")
local default = require(script.Parent.Parent.PermissionsProtocol).PermissionsProtocol.default
local notificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local pushNotificationsUpsellUtilsModule = require(script.Parent.Util.PushNotificationsUpsellUtils)

return function()
	-- upvalues: default (ref), pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), notificationsUpsellConstantsModule (ref)
	return default:requestPermissions({ default.Permissions.POST_NOTIFICATIONS }):andThen(function(p1)
		-- upvalues: pushNotificationsUpsellUtilsModule (copy), appStorageService (copy), notificationsUpsellConstantsModule (copy)
		pushNotificationsUpsellUtilsModule.setPushSysUpsellPromptTimestamp(appStorageService, os.time())
		pushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(appStorageService, notificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
		
		return p1
	end)
end