local appStorageService = game:GetService("AppStorageService")
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local UIBloxModule = require(parent.UIBlox)
local default = require(parent.PermissionsProtocol).PermissionsProtocol.default
local default_1 = require(parent.LoggingProtocol).default
local useState = reactModule.useState
local useCallback = reactModule.useCallback
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sendEventDeferred = require(parent.NotificationsCommon).sendEventDeferred
local modalEventConstantsModule = require(script.Parent.Parent.Analytics.ModalEventConstants)
local pushUpsellEventNameModule = require(script.Parent.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
local pushNotificationsUpsellUtilsModule = require(script.Parent.Parent.Util.PushNotificationsUpsellUtils)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local getFFlagLuaAppPushUpsellDeprecateOldEvents = require(parent.SharedFlags).GetFFlagLuaAppPushUpsellDeprecateOldEvents

return function(p1)
	-- upvalues: useLocalization (ref), useCallback (ref), pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), getFFlagLuaAppPushUpsellDeprecateOldEvents (ref), sendEventDeferred (ref), modalEventConstantsModule (ref), default_1 (ref), pushUpsellEventNameModule (ref), default (ref), useState (ref), reactModule (ref), reactRobloxModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useLocalization(p1.TranslationKeys)
	local var2 = useCallback(function()
		-- upvalues: pushNotificationsUpsellUtilsModule (copy), appStorageService (copy), getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy), p1 (ref)
		pushNotificationsUpsellUtilsModule.setPushEduUpsellResponse(appStorageService, "Deny")
		pushNotificationsUpsellUtilsModule.setPushEduUpsellResponseTimestamp(appStorageService, os.time())
		
		if not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
			sendEventDeferred(modalEventConstantsModule.ModalContextPushEduUpsell, modalEventConstantsModule.OptInPushEventName, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
				[modalEventConstantsModule.Button] = modalEventConstantsModule.Cancel
			})
		end
		default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
			[modalEventConstantsModule.Button] = modalEventConstantsModule.Cancel
		}, modalEventConstantsModule.ModalContextPushEduUpsell)
		p1.CloseModal()
	end, { p1.CloseModal })
	local var3 = useCallback(function()
		-- upvalues: getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy), pushNotificationsUpsellUtilsModule (copy), appStorageService (copy), default (copy), p1 (ref)
		if not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
			sendEventDeferred(modalEventConstantsModule.ModalContextPushEduUpsell, modalEventConstantsModule.OptInPushEventName, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
				[modalEventConstantsModule.Button] = modalEventConstantsModule.Confirm
			})
		end
		default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
			[modalEventConstantsModule.Button] = modalEventConstantsModule.Confirm
		}, modalEventConstantsModule.ModalContextPushEduUpsell)
		pushNotificationsUpsellUtilsModule.setPushEduUpsellResponse(appStorageService, "Allow")
		pushNotificationsUpsellUtilsModule.setPushEduUpsellResponseTimestamp(appStorageService, os.time())
		default_1:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened,
			[modalEventConstantsModule.EntryPoint] = "LuaPushUpsellModal"
		}, modalEventConstantsModule.ModalContextSysUpsell)
		default:requestPermissions({ default.Permissions.POST_NOTIFICATIONS }):andThen(function(_)
			-- upvalues: pushNotificationsUpsellUtilsModule (copy), appStorageService (copy), getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy)
			pushNotificationsUpsellUtilsModule.setPushSysUpsellPromptTimestamp(appStorageService, os.time())
			
			if not getFFlagLuaAppPushUpsellDeprecateOldEvents() then
				sendEventDeferred(modalEventConstantsModule.ModalContextSysUpsell, modalEventConstantsModule.OptInPushEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened
				})
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
		p1.CloseModal()
	end, { p1.CloseModal, var1 })
	local var4, var5 = useState(Vector2.new(800, 600))
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[reactRobloxModule.Change.AbsoluteSize] = useCallback(function(p2)
			-- upvalues: var5 (ref)
			var5(p2.AbsoluteSize)
		end, { var5 })
	}, {
		ConfirmationPrompt = reactModule.createElement(interactiveAlert, {
			richText = true,
			screenSize = var4,
			title = var1.Heading,
			bodyText = var1.Body,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = var2, text = var1.CancelAction }
					},
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var3, text = var1.ConfirmAction }
					}
				}
			}
		})
	})
end