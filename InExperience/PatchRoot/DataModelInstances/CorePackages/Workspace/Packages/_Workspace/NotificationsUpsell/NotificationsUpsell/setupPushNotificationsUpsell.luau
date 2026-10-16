local LocalizationService = game:GetService("LocalizationService")
local AppStorageService = game:GetService("AppStorageService")
local Parent = script.Parent.Parent
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local Default = require(Parent.PermissionsProtocol).PermissionsProtocol.default
local Default1 = require(Parent.LoggingProtocol).default
local Localization = require(Parent.RobloxAppLocales).Localization
local SendEventDeferredFunction = require(Parent.NotificationsCommon).sendEventDeferred
local PushNotificationsUpsellModalModule = require(script.Parent.Components.PushNotificationsUpsellModal)
local NotificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local ModalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local PushUpsellEventNameModule = require(script.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
local PushNotificationsUpsellUtilsModule = require(script.Parent.Util.PushNotificationsUpsellUtils)
local PromiseModule = require(Parent.Promise)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local FIntPushUpsellCooldownPeriodModule = require(script.Parent.Flags.FIntPushUpsellCooldownPeriod)
local FIntPushUpsellMaxPromptCountModule = require(script.Parent.Flags.FIntPushUpsellMaxPromptCount)
local FIntPushUpsellChatCooldownPeriodModule = require(script.Parent.Flags.FIntPushUpsellChatCooldownPeriod)
local FIntPushUpsellChatMaxPromptCountModule = require(script.Parent.Flags.FIntPushUpsellChatMaxPromptCount)
local GetFFlagEnablePushNotificationsUpsellModalFunction = require(Parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal
local GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction = require(Parent.SharedFlags).GetFFlagLuaAppPushUpsellDeprecateOldEvents
local FFlagNotificationsUpsellUseRequestPushPermissionHelper = require(Parent.SharedFlags).FFlagNotificationsUpsellUseRequestPushPermissionHelper
local RequestPushNotificationPermissionModule = if FFlagNotificationsUpsellUseRequestPushPermissionHelper then require(script.Parent.requestPushNotificationPermission) else nil
local FFlagPushNotificationsUpsellPassClientAttributesToPrompts = require(Parent.SharedFlags).FFlagPushNotificationsUpsellPassClientAttributesToPrompts
local CacheShouldShowPushUpsellHideResponse = game:DefineFastFlag("CacheShouldShowPushUpsellHideResponse", false)
local ShouldShowPushUpsellHideResponseCacheExpirationTime = game:DefineFastInt("ShouldShowPushUpsellHideResponseCacheExpirationTime", 6)
local Flag = false
local Timestamp = 0
local Promise = nil

local function getPushNotificationPermissionUpsellStatus() --[[ Line: 48 ]]
	-- upvalues: Promise (ref), Default (copy)
	if Promise == nil then
		local Promise1 = nil
		Promise1 = Default:shouldShowUpsell({ Default.Permissions.POST_NOTIFICATIONS }):andThen(function(Result) --[[ Line: 57 ]]
			return Result.upsellStatus or "UNKNOWN"
		end, function(): string --[[ Line: 59 ]]
			return "ERROR"
		end)
		Promise = Promise1
		Promise1:finally(function() --[[ Line: 63 ]]
			-- upvalues: Promise (upval), Promise1 (ref)
			if Promise == Promise1 then
				Promise = nil
			end
		end)
		
		return Promise1
	else
		return Promise
	end
end

local function shouldShowUpsellHome(p1) --[[ Line: 72 ]]
	-- upvalues: CacheShouldShowPushUpsellHideResponse (copy), Timestamp (ref), ShouldShowPushUpsellHideResponseCacheExpirationTime (copy), Flag (ref), PromiseModule (copy), PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), NotificationsUpsellConstantsModule (copy), FIntPushUpsellMaxPromptCountModule (copy), FIntPushUpsellCooldownPeriodModule (copy), FFlagPushNotificationsUpsellPassClientAttributesToPrompts (copy), getPushNotificationPermissionUpsellStatus (copy), Default (copy)
	if CacheShouldShowPushUpsellHideResponse and (os.time() - Timestamp) / 3600 < ShouldShowPushUpsellHideResponseCacheExpirationTime and Flag then
		return PromiseModule.resolve(false)
	end
	local PushUpsellPromptedCount: number = PushNotificationsUpsellUtilsModule.getPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
	local PushEduUpsellResponseTimestamp = if p1 then PushNotificationsUpsellUtilsModule.getPushEduUpsellResponseTimestamp(AppStorageService) else PushNotificationsUpsellUtilsModule.getPushSysUpsellPromptTimestamp(AppStorageService)
	local v1 = false
	
	if PushUpsellPromptedCount >= 0 and PushEduUpsellResponseTimestamp >= 0 then
		local TimestampRatio = (os.time() - PushEduUpsellResponseTimestamp) / 86400
		v1 = PushUpsellPromptedCount < FIntPushUpsellMaxPromptCountModule and (FIntPushUpsellCooldownPeriodModule <= TimestampRatio or PushEduUpsellResponseTimestamp == 0)
	end
	return if v1 then if FFlagPushNotificationsUpsellPassClientAttributesToPrompts then getPushNotificationPermissionUpsellStatus():andThen(function(Result) --[[ Line: 103 ]]
		-- upvalues: PromiseModule (upval), Default (upval)
		return PromiseModule.resolve(Result == Default.UpsellStatus.SHOW)
	end) else Default:shouldShowUpsell({ Default.Permissions.POST_NOTIFICATIONS }):andThen(function(Result) --[[ Line: 110 ]]
		-- upvalues: Default (upval), PromiseModule (upval), CacheShouldShowPushUpsellHideResponse (upval), Flag (upval), Timestamp (upval)
		if Result.upsellStatus and Result.upsellStatus == Default.UpsellStatus.SHOW then
			return PromiseModule.resolve(true)
		end
		if CacheShouldShowPushUpsellHideResponse then
			Flag = true
			Timestamp = os.time()
		end
		return PromiseModule.resolve(false)
	end, function(_) --[[ Line: 122 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(false)
	end) else PromiseModule.resolve(false)
end

local function _(): boolean --[[ Line: 135 | Named "userHasRespondedToPushUpsellChat" ]]
	-- upvalues: PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), NotificationsUpsellConstantsModule (copy), FIntPushUpsellChatMaxPromptCountModule (copy)
	local PushUpsellPromptedCount: number = PushNotificationsUpsellUtilsModule.getPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.ChatPromptShownCount)
	
	return PushUpsellPromptedCount < 0 or FIntPushUpsellChatMaxPromptCountModule <= PushUpsellPromptedCount
end

local _ = function(): boolean --[[ Line: 143 | Named "userHasRespondedToUpsellPromptLessThanCooldownPeriod" ]]
	-- upvalues: PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), FIntPushUpsellChatCooldownPeriodModule (copy)
	local PushSysUpsellPromptTimestamp: number = PushNotificationsUpsellUtilsModule.getPushSysUpsellPromptTimestamp(AppStorageService)
	
	return PushSysUpsellPromptTimestamp >= 0 and (os.time() - PushSysUpsellPromptTimestamp) / 86400 < FIntPushUpsellChatCooldownPeriodModule
end

local function shouldShowRationale() --[[ Line: 149 ]]
	-- upvalues: Default (copy), PromiseModule (copy)
	return Default:shouldShowRationale({ Default.Permissions.POST_NOTIFICATIONS }):andThen(function(Result) --[[ Line: 153 ]]
		-- upvalues: PromiseModule (upval), Default (upval)
		return PromiseModule.resolve(Result.upsellStatus == Default.UpsellStatus.SHOW)
	end):catch(function(_) --[[ Line: 156 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(false)
	end)
end

local function shouldShowUpsellChat(_) --[[ Line: 161 ]]
	-- upvalues: PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), NotificationsUpsellConstantsModule (copy), FIntPushUpsellChatMaxPromptCountModule (copy), FIntPushUpsellChatCooldownPeriodModule (copy), PromiseModule (copy), shouldShowRationale (copy)
	local PushUpsellPromptedCount: number = PushNotificationsUpsellUtilsModule.getPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.ChatPromptShownCount)
	
	if PushUpsellPromptedCount >= 0 and PushUpsellPromptedCount < FIntPushUpsellChatMaxPromptCountModule then
		local PushSysUpsellPromptTimestamp: number = PushNotificationsUpsellUtilsModule.getPushSysUpsellPromptTimestamp(AppStorageService)
		
		if PushSysUpsellPromptTimestamp < 0 or (os.time() - PushSysUpsellPromptTimestamp) / 86400 >= FIntPushUpsellChatCooldownPeriodModule then
			return shouldShowRationale():andThen(function(Result) --[[ Line: 167 ]]
				-- upvalues: PromiseModule (upval)
				return if Result then PromiseModule.resolve(true) else PromiseModule.resolve(false)
			end):catch(function(_) --[[ Line: 170 ]]
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(false)
			end)
		end
	end
	return PromiseModule.resolve(false)
end

return {
	OpenModal = function(PushUpsellChat, PushNotificationsUpsellModalModule1, p1) --[[ Line: 192 ]]
		-- upvalues: GetFFlagEnablePushNotificationsUpsellModalFunction (copy), GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (copy), SendEventDeferredFunction (copy), ModalEventConstantsModule (copy), Default1 (copy), PushUpsellEventNameModule (copy), NotificationModalsManagerModule (copy), NotificationsUpsellConstantsModule (copy), PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), PushNotificationsUpsellModalModule (copy), Localization (copy), LocalizationService (copy), FFlagNotificationsUpsellUseRequestPushPermissionHelper (copy), RequestPushNotificationPermissionModule (copy), Default (copy)
		if not GetFFlagEnablePushNotificationsUpsellModalFunction() then return end
		if PushNotificationsUpsellModalModule1 then
			local function CloseCallback() --[[ Line: 198 ]]
				-- upvalues: GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval)
				if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
					SendEventDeferredFunction(ModalEventConstantsModule.ModalContextPushEduUpsell, ModalEventConstantsModule.OptInPushEventName, {
						[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Closed
					})
				end
				Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Closed
				}, ModalEventConstantsModule.ModalContextPushEduUpsell)
			end
			
			local function CloseModal() --[[ Line: 215 ]]
				-- upvalues: NotificationModalsManagerModule (upval), PushUpsellChat (copy)
				NotificationModalsManagerModule.CloseModal(PushUpsellChat)
			end
			
			if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
				SendEventDeferredFunction(ModalEventConstantsModule.ModalContextPushEduUpsell, ModalEventConstantsModule.OptInPushEventName, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Opened
				})
			end
			Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Opened,
				[ModalEventConstantsModule.EntryPoint] = p1 or ""
			}, ModalEventConstantsModule.ModalContextPushEduUpsell)
			
			if PushUpsellChat == NotificationsUpsellConstantsModule.ModalKey.PushUpsellHome then
				PushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
			elseif PushUpsellChat == NotificationsUpsellConstantsModule.ModalKey.PushUpsellChat then
				PushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.ChatPromptShownCount)
			end
			NotificationModalsManagerModule.OpenModal(PushUpsellChat, PushNotificationsUpsellModalModule, {
				DisableBackgroundDismiss = true,
				DisplayOrder = 2,
				CloseCallback = CloseCallback,
				Props = {
					CloseModal = CloseModal,
					TranslationKeys = NotificationsUpsellConstantsModule.TranslationKeys[PushUpsellChat]
				},
				Localization = Localization.new(LocalizationService.RobloxLocaleId)
			})
			
			return
		else
			if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
				SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Opened
				})
			end
			Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Opened,
				[ModalEventConstantsModule.EntryPoint] = p1 or ""
			}, ModalEventConstantsModule.ModalContextSysUpsell)
			
			if FFlagNotificationsUpsellUseRequestPushPermissionHelper then
				RequestPushNotificationPermissionModule():andThen(function() --[[ Line: 266 ]]
					-- upvalues: GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval)
					if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
						SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
							[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestSuccess
						})
					end
					Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
						[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestSuccess
					}, ModalEventConstantsModule.ModalContextSysUpsell)
				end, function() --[[ Line: 282 ]]
					-- upvalues: GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval)
					if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
						SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
							[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestFailed
						})
					end
					Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
						[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestFailed
					}, ModalEventConstantsModule.ModalContextSysUpsell)
				end)
				
				return
			else
				Default:requestPermissions({ Default.Permissions.POST_NOTIFICATIONS }):andThen(function(_) --[[ Line: 304 ]]
					-- upvalues: PushNotificationsUpsellUtilsModule (upval), AppStorageService (upval), NotificationsUpsellConstantsModule (upval), GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval)
					PushNotificationsUpsellUtilsModule.setPushSysUpsellPromptTimestamp(AppStorageService, os.time())
					PushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
					
					if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
						SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
							[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestSuccess
						})
					end
					Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
						[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestSuccess
					}, ModalEventConstantsModule.ModalContextSysUpsell)
				end, function(_) --[[ Line: 321 ]]
					-- upvalues: GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval)
					if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
						SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
							[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestFailed
						})
					end
					Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
						[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestFailed
					}, ModalEventConstantsModule.ModalContextSysUpsell)
				end)
			end
		end
	end,
	CloseModal = function(PushUpsellChat) --[[ Line: 337 ]]
		-- upvalues: NotificationModalsManagerModule (copy)
		NotificationModalsManagerModule.CloseModal(PushUpsellChat)
	end,
	ShouldShowUpsell = function(PushUpsellChat, p1) --[[ Line: 175 ]]
		-- upvalues: GetFFlagEnablePushNotificationsUpsellModalFunction (copy), PromiseModule (copy), GetAppFeaturePoliciesFunction (copy), NotificationsUpsellConstantsModule (copy), shouldShowUpsellHome (copy), shouldShowUpsellChat (copy)
		if not GetFFlagEnablePushNotificationsUpsellModalFunction() then
			return PromiseModule.resolve(false)
		end
		local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
		
		if not AppFeaturePolicies.getNotificationsCanReceivePush() or not AppFeaturePolicies.getPushNotificationsUpsell() then
			return PromiseModule.resolve(false)
		elseif PushUpsellChat == NotificationsUpsellConstantsModule.ModalKey.PushUpsellHome then
			return shouldShowUpsellHome(p1)
		elseif PushUpsellChat ~= NotificationsUpsellConstantsModule.ModalKey.PushUpsellChat then return end
		return shouldShowUpsellChat(p1)
	end,
	GetPushNotificationPermissionUpsellStatus = if FFlagPushNotificationsUpsellPassClientAttributesToPrompts then getPushNotificationPermissionUpsellStatus else nil
}