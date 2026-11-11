local AppStorageService = game:GetService("AppStorageService")
local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
local Default = require(Parent.PermissionsProtocol).PermissionsProtocol.default
local Default1 = require(Parent.LoggingProtocol).default
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SendEventDeferredFunction = require(Parent.NotificationsCommon).sendEventDeferred
local ModalEventConstantsModule = require(script.Parent.Parent.Analytics.ModalEventConstants)
local PushUpsellEventNameModule = require(script.Parent.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
local PushNotificationsUpsellUtilsModule = require(script.Parent.Parent.Util.PushNotificationsUpsellUtils)
local MergeEventFieldsModule = require(script.Parent.Parent.Util.mergeEventFields)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction = require(Parent.SharedFlags).GetFFlagLuaAppPushUpsellDeprecateOldEvents

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseCallbackFunction (copy), PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (copy), SendEventDeferredFunction (copy), ModalEventConstantsModule (copy), Default1 (copy), PushUpsellEventNameModule (copy), MergeEventFieldsModule (copy), Default (copy), UseStateFunction (copy), ReactModule (copy), ReactRobloxModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction(p1.TranslationKeys)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: PushNotificationsUpsellUtilsModule (upval), AppStorageService (upval), GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval), MergeEventFieldsModule (upval), p1 (copy)
		PushNotificationsUpsellUtilsModule.setPushEduUpsellResponse(AppStorageService, "Deny")
		PushNotificationsUpsellUtilsModule.setPushEduUpsellResponseTimestamp(AppStorageService, os.time())
		
		if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
			SendEventDeferredFunction(ModalEventConstantsModule.ModalContextPushEduUpsell, ModalEventConstantsModule.OptInPushEventName, {
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Clicked,
				[ModalEventConstantsModule.Button] = ModalEventConstantsModule.Cancel
			})
		end
		Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, MergeEventFieldsModule({
			[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Clicked,
			[ModalEventConstantsModule.Button] = ModalEventConstantsModule.Cancel
		}, p1.ExtraEventFields), ModalEventConstantsModule.ModalContextPushEduUpsell)
		p1.CloseModal()
	end, { p1.CloseModal, p1.ExtraEventFields })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval), MergeEventFieldsModule (upval), p1 (copy), PushNotificationsUpsellUtilsModule (upval), AppStorageService (upval), Default (upval)
		if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
			SendEventDeferredFunction(ModalEventConstantsModule.ModalContextPushEduUpsell, ModalEventConstantsModule.OptInPushEventName, {
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Clicked,
				[ModalEventConstantsModule.Button] = ModalEventConstantsModule.Confirm
			})
		end
		Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, MergeEventFieldsModule({
			[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Clicked,
			[ModalEventConstantsModule.Button] = ModalEventConstantsModule.Confirm
		}, p1.ExtraEventFields), ModalEventConstantsModule.ModalContextPushEduUpsell)
		PushNotificationsUpsellUtilsModule.setPushEduUpsellResponse(AppStorageService, "Allow")
		PushNotificationsUpsellUtilsModule.setPushEduUpsellResponseTimestamp(AppStorageService, os.time())
		Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, MergeEventFieldsModule({
			[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Opened,
			[ModalEventConstantsModule.EntryPoint] = "LuaPushUpsellModal"
		}, p1.ExtraEventFields), ModalEventConstantsModule.ModalContextSysUpsell)
		Default:requestPermissions({ Default.Permissions.POST_NOTIFICATIONS }):andThen(function(_)
			-- upvalues: PushNotificationsUpsellUtilsModule (upval), AppStorageService (upval), GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval), MergeEventFieldsModule (upval), p1 (upval)
			PushNotificationsUpsellUtilsModule.setPushSysUpsellPromptTimestamp(AppStorageService, os.time())
			
			if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
				SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Opened
				})
				SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestSuccess
				})
			end
			Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, MergeEventFieldsModule({
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestSuccess
			}, p1.ExtraEventFields), ModalEventConstantsModule.ModalContextSysUpsell)
		end, function(_)
			-- upvalues: GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction (upval), SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), Default1 (upval), PushUpsellEventNameModule (upval), MergeEventFieldsModule (upval), p1 (upval)
			if not GetFFlagLuaAppPushUpsellDeprecateOldEventsFunction() then
				SendEventDeferredFunction(ModalEventConstantsModule.ModalContextSysUpsell, ModalEventConstantsModule.OptInPushEventName, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestFailed
				})
			end
			Default1:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, MergeEventFieldsModule({
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.RequestFailed
			}, p1.ExtraEventFields), ModalEventConstantsModule.ModalContextSysUpsell)
		end)
		p1.CloseModal()
	end, {
		p1.CloseModal,
		p1.ExtraEventFields,
		UseLocalizationResult
	})
	local UseStateResult, UseStateResult2 = UseStateFunction(Vector2.new(800, 600))
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[ReactRobloxModule.Change.AbsoluteSize] = UseCallbackFunction(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end, { UseStateResult2 })
	}, {
		ConfirmationPrompt = ReactModule.createElement(InteractiveAlert, {
			richText = true,
			screenSize = UseStateResult,
			title = UseLocalizationResult.Heading,
			bodyText = UseLocalizationResult.Body,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = {
							onActivated = UseCallbackResult,
							text = UseLocalizationResult.CancelAction
						}
					},
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseCallbackResult1,
							text = UseLocalizationResult.ConfirmAction
						}
					}
				}
			}
		})
	})
end