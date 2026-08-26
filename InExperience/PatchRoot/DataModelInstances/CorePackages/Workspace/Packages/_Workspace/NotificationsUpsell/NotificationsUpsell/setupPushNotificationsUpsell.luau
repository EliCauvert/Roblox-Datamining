local localizationService = game:GetService("LocalizationService")
local appStorageService = game:GetService("AppStorageService")
local parent = script.Parent.Parent
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local default = require(parent.PermissionsProtocol).PermissionsProtocol.default
local default_1 = require(parent.LoggingProtocol).default
local localization = require(parent.RobloxAppLocales).Localization
local sendEventDeferred = require(parent.NotificationsCommon).sendEventDeferred
local pushNotificationsUpsellModalModule = require(script.Parent.Components.PushNotificationsUpsellModal)
local notificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local modalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local pushUpsellEventNameModule = require(script.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
local pushNotificationsUpsellUtilsModule = require(script.Parent.Util.PushNotificationsUpsellUtils)
local promiseModule = require(parent.Promise)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local fIntPushUpsellCooldownPeriodModule = require(script.Parent.Flags.FIntPushUpsellCooldownPeriod)
local fIntPushUpsellMaxPromptCountModule = require(script.Parent.Flags.FIntPushUpsellMaxPromptCount)
local fIntPushUpsellChatCooldownPeriodModule = require(script.Parent.Flags.FIntPushUpsellChatCooldownPeriod)
local fIntPushUpsellChatMaxPromptCountModule = require(script.Parent.Flags.FIntPushUpsellChatMaxPromptCount)
local getFFlagEnablePushNotificationsUpsellModal = require(parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal
local getFFlagLuaAppPushUpsellDeprecateOldEvents = require(parent.SharedFlags).GetFFlagLuaAppPushUpsellDeprecateOldEvents
local cacheShouldShowPushUpsellHideResponse = game:DefineFastFlag("CacheShouldShowPushUpsellHideResponse", false)
local shouldShowPushUpsellHideResponseCacheExpirationTime = game:DefineFastInt("ShouldShowPushUpsellHideResponseCacheExpirationTime", 6)
local var1 = false
local var2 = 0

local function shouldShowUpsellHome(p1)
	-- upvalues: cacheShouldShowPushUpsellHideResponse (ref), var2 (write), shouldShowPushUpsellHideResponseCacheExpirationTime (ref), var1 (write), promiseModule (ref), pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), notificationsUpsellConstantsModule (ref), fIntPushUpsellMaxPromptCountModule (ref), fIntPushUpsellCooldownPeriodModule (ref), default (ref)
	if cacheShouldShowPushUpsellHideResponse and (os.time() - var2) / 3600 < shouldShowPushUpsellHideResponseCacheExpirationTime and var1 then
		return promiseModule.resolve(false)
	end
	local pushUpsellPromptedCount = pushNotificationsUpsellUtilsModule.getPushUpsellPromptedCount(appStorageService, notificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
	local var3 = if p1 then pushNotificationsUpsellUtilsModule.getPushEduUpsellResponseTimestamp(appStorageService) else pushNotificationsUpsellUtilsModule.getPushSysUpsellPromptTimestamp(appStorageService)
	local var4 = false
	
	if pushUpsellPromptedCount >= 0 and var3 >= 0 then
		var4 = pushUpsellPromptedCount < fIntPushUpsellMaxPromptCountModule and (if fIntPushUpsellCooldownPeriodModule > (os.time() - var3) / 86400 then var3 == 0 else true)
	end
	return if var4 then default:shouldShowUpsell({ default.Permissions.POST_NOTIFICATIONS }):andThen(function(p2)
		-- upvalues: default (copy), promiseModule (copy), cacheShouldShowPushUpsellHideResponse (copy), var1 (copy), var2 (copy)
		if p2.upsellStatus and p2.upsellStatus == default.UpsellStatus.SHOW then
			return promiseModule.resolve(true)
		elseif cacheShouldShowPushUpsellHideResponse then
			var1 = true
			var2 = os.time()
		end
		return promiseModule.resolve(false)
	end, function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end) else promiseModule.resolve(false)
end

local function _()
	-- upvalues: pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), notificationsUpsellConstantsModule (ref), fIntPushUpsellChatMaxPromptCountModule (ref)
	local pushUpsellPromptedCount = pushNotificationsUpsellUtilsModule.getPushUpsellPromptedCount(appStorageService, notificationsUpsellConstantsModule.LocalStorageKeys.ChatPromptShownCount)
	
	return if pushUpsellPromptedCount >= 0 then fIntPushUpsellChatMaxPromptCountModule <= pushUpsellPromptedCount else true
end

local _ = function()
	-- upvalues: pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), fIntPushUpsellChatCooldownPeriodModule (ref)
	local pushSysUpsellPromptTimestamp = pushNotificationsUpsellUtilsModule.getPushSysUpsellPromptTimestamp(appStorageService)
	
	return pushSysUpsellPromptTimestamp >= 0 and (os.time() - pushSysUpsellPromptTimestamp) / 86400 < fIntPushUpsellChatCooldownPeriodModule
end

local function shouldShowRationale()
	-- upvalues: default (ref), promiseModule (ref)
	return default:shouldShowRationale({ default.Permissions.POST_NOTIFICATIONS }):andThen(function(p1)
		-- upvalues: promiseModule (copy), default (copy)
		return promiseModule.resolve(p1.upsellStatus == default.UpsellStatus.SHOW)
	end):catch(function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end)
end

local function shouldShowUpsellChat(_)
	-- upvalues: pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), notificationsUpsellConstantsModule (ref), fIntPushUpsellChatMaxPromptCountModule (ref), fIntPushUpsellChatCooldownPeriodModule (ref), promiseModule (ref), shouldShowRationale (ref)
	local pushUpsellPromptedCount = pushNotificationsUpsellUtilsModule.getPushUpsellPromptedCount(appStorageService, notificationsUpsellConstantsModule.LocalStorageKeys.ChatPromptShownCount)
	
	if not (if pushUpsellPromptedCount >= 0 then fIntPushUpsellChatMaxPromptCountModule <= pushUpsellPromptedCount else true) then
		local pushSysUpsellPromptTimestamp = pushNotificationsUpsellUtilsModule.getPushSysUpsellPromptTimestamp(appStorageService)
		
		return if pushSysUpsellPromptTimestamp >= 0 and (os.time() - pushSysUpsellPromptTimestamp) / 86400 < fIntPushUpsellChatCooldownPeriodModule then promiseModule.resolve(false) else shouldShowRationale():andThen(function(p1)
			-- upvalues: promiseModule (copy)
			return if p1 then promiseModule.resolve(true) else promiseModule.resolve(false)
		end):catch(function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(false)
		end)
	end
end

return {
	OpenModal = function(p1, p2, p3)
		-- upvalues: getFFlagEnablePushNotificationsUpsellModal (ref), getFFlagLuaAppPushUpsellDeprecateOldEvents (ref), sendEventDeferred (ref), modalEventConstantsModule (ref), default_1 (ref), pushUpsellEventNameModule (ref), notificationModalsManagerModule (ref), notificationsUpsellConstantsModule (ref), pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), pushNotificationsUpsellModalModule (ref), localization (ref), localizationService (ref), default (ref)
		if not getFFlagEnablePushNotificationsUpsellModal() then return end
		if p2 then
			local var3 = function()
				-- upvalues: getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy)
				if not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
					sendEventDeferred(modalEventConstantsModule.ModalContextPushEduUpsell, modalEventConstantsModule.OptInPushEventName, {
						[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Closed
					})
				end
				default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Closed
				}, modalEventConstantsModule.ModalContextPushEduUpsell)
			end
			
			local var4 = function()
				-- upvalues: notificationModalsManagerModule (copy), p1 (ref)
				notificationModalsManagerModule.CloseModal(p1)
			end
			
			if not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
				sendEventDeferred(modalEventConstantsModule.ModalContextPushEduUpsell, modalEventConstantsModule.OptInPushEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened
				})
			end
			default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened,
				[modalEventConstantsModule.EntryPoint] = p3 or ""
			}, modalEventConstantsModule.ModalContextPushEduUpsell)
			
			if p1 == notificationsUpsellConstantsModule.ModalKey.PushUpsellHome then
				pushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(appStorageService, notificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
			elseif p1 == notificationsUpsellConstantsModule.ModalKey.PushUpsellChat then
				pushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(appStorageService, notificationsUpsellConstantsModule.LocalStorageKeys.ChatPromptShownCount)
			end
			notificationModalsManagerModule.OpenModal(p1, pushNotificationsUpsellModalModule, {
				DisableBackgroundDismiss = true,
				DisplayOrder = 2,
				CloseCallback = var3,
				Props = {
					CloseModal = var4,
					TranslationKeys = notificationsUpsellConstantsModule.TranslationKeys[p1]
				},
				Localization = localization.new(localizationService.RobloxLocaleId)
			})
			
			return
		elseif not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
			sendEventDeferred(modalEventConstantsModule.ModalContextSysUpsell, modalEventConstantsModule.OptInPushEventName, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened
			})
		end
		default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened,
			[modalEventConstantsModule.EntryPoint] = p3 or ""
		}, modalEventConstantsModule.ModalContextSysUpsell)
		default:requestPermissions({ default.Permissions.POST_NOTIFICATIONS }):andThen(function(_)
			-- upvalues: pushNotificationsUpsellUtilsModule (copy), appStorageService (copy), notificationsUpsellConstantsModule (copy), getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy)
			pushNotificationsUpsellUtilsModule.setPushSysUpsellPromptTimestamp(appStorageService, os.time())
			pushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(appStorageService, notificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
			
			if not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
				sendEventDeferred(modalEventConstantsModule.ModalContextSysUpsell, modalEventConstantsModule.OptInPushEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.RequestSuccess
				})
			end
			default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.RequestSuccess
			}, modalEventConstantsModule.ModalContextSysUpsell)
		end, function(_)
			-- upvalues: getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy)
			if not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
				sendEventDeferred(modalEventConstantsModule.ModalContextSysUpsell, modalEventConstantsModule.OptInPushEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.RequestFailed
				})
			end
			default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.RequestFailed
			}, modalEventConstantsModule.ModalContextSysUpsell)
		end)
	end,
	CloseModal = function(p1)
		-- upvalues: notificationModalsManagerModule (ref)
		notificationModalsManagerModule.CloseModal(p1)
	end,
	ShouldShowUpsell = function(p1, p2)
		-- upvalues: getFFlagEnablePushNotificationsUpsellModal (ref), promiseModule (ref), getAppFeaturePolicies (ref), notificationsUpsellConstantsModule (ref), shouldShowUpsellHome (ref), shouldShowUpsellChat (ref)
		if not getFFlagEnablePushNotificationsUpsellModal() then
			return promiseModule.resolve(false)
		end
		local var3 = getAppFeaturePolicies()
		
		if not var3.getNotificationsCanReceivePush() or not var3.getPushNotificationsUpsell() then
			return promiseModule.resolve(false)
		elseif p1 == notificationsUpsellConstantsModule.ModalKey.PushUpsellHome then
			return shouldShowUpsellHome(p2)
		elseif p1 == notificationsUpsellConstantsModule.ModalKey.PushUpsellChat then
			return shouldShowUpsellChat(p2)
		end
	end
}