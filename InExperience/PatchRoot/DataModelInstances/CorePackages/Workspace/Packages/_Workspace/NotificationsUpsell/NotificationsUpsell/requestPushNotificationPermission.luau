local AppStorageService = game:GetService("AppStorageService")
local Default = require(script.Parent.Parent.PermissionsProtocol).PermissionsProtocol.default
local NotificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local PushNotificationsUpsellUtilsModule = require(script.Parent.Util.PushNotificationsUpsellUtils)

return function() --[[ Line: 9 ]]
	-- upvalues: Default (copy), PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), NotificationsUpsellConstantsModule (copy)
	return Default:requestPermissions({ Default.Permissions.POST_NOTIFICATIONS }):andThen(function(Result) --[[ Line: 12 ]]
		-- upvalues: PushNotificationsUpsellUtilsModule (upval), AppStorageService (upval), NotificationsUpsellConstantsModule (upval)
		PushNotificationsUpsellUtilsModule.setPushSysUpsellPromptTimestamp(AppStorageService, os.time())
		PushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
		
		return Result
	end)
end