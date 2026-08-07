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

return function(p0) --[[ line: 27 ]]
	-- upvalues: useLocalization (ref), useCallback (ref), pushNotificationsUpsellUtilsModule (ref), appStorageService (ref), getFFlagLuaAppPushUpsellDeprecateOldEvents (ref), sendEventDeferred (ref), modalEventConstantsModule (ref), default_1 (ref), pushUpsellEventNameModule (ref), default (ref), useState (ref), reactModule (ref), reactRobloxModule (ref), interactiveAlert (ref), buttonType (ref)
	local var7 = useLocalization(p0.TranslationKeys)
	local var8 = useCallback(function() --[[ line: 29 ]]
		-- upvalues: pushNotificationsUpsellUtilsModule (copy), appStorageService (copy), getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy), p0 (ref)
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
		p0.CloseModal()
	end, { p0.CloseModal })
	local var9 = useCallback(function() --[[ line: 47 ]]
		-- upvalues: getFFlagLuaAppPushUpsellDeprecateOldEvents (copy), sendEventDeferred (copy), modalEventConstantsModule (copy), default_1 (copy), pushUpsellEventNameModule (copy), pushNotificationsUpsellUtilsModule (copy), appStorageService (copy), default (copy), p0 (ref)
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
		default:requestPermissions({ default.Permissions.POST_NOTIFICATIONS }):andThen(function(_) --[[ line: 74 ]]
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
		end, function(_) --[[ line: 96 ]]
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
		p0.CloseModal()
	end, { p0.CloseModal, var7 })
	local var10, var11 = useState(Vector2.new(800, 600))
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[reactRobloxModule.Change.AbsoluteSize] = useCallback(function(p1) --[[ line: 120 ]]
			-- upvalues: var11 (ref)
			var11(p1.AbsoluteSize)
		end, { var11 })
	}, {
		ConfirmationPrompt = reactModule.createElement(interactiveAlert, {
			richText = true,
			screenSize = var10,
			title = var7.Heading,
			bodyText = var7.Body,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = var8, text = var7.CancelAction }
					},
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var9, text = var7.ConfirmAction }
					}
				}
			}
		})
	})
end