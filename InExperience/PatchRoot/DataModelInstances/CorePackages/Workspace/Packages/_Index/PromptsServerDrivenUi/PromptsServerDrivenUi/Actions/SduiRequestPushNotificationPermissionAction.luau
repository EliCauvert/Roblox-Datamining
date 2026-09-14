local parent = script:FindFirstAncestor("PromptsServerDrivenUi").Parent
local requestPushNotificationPermission = require(parent.NotificationsUpsell).requestPushNotificationPermission
local default = require(parent.LoggingProtocol).default
local sduiErrorType = require(parent.SduiCoreSystem).SduiErrors.SduiErrorType
local modalEventConstants = require(parent.NotificationsUpsell).ModalEventConstants
local pushUpsellEventConfig = require(parent.NotificationsUpsell).PushUpsellEventConfig

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), default (ref), pushUpsellEventConfig (ref), modalEventConstants (ref), requestPushNotificationPermission (ref)
	local source = (if p1 then p1.actionParams else {}).source
	
	if source == nil or type(source) == "string" then
		default:logRobloxTelemetryEvent(pushUpsellEventConfig, {}, {
			[modalEventConstants.ActionType] = modalEventConstants.Opened,
			[modalEventConstants.EntryPoint] = source or "SDUI"
		}, modalEventConstants.ModalContextSysUpsell)
		requestPushNotificationPermission():andThen(function()
			-- upvalues: default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy)
			default:logRobloxTelemetryEvent(pushUpsellEventConfig, {}, {
				[modalEventConstants.ActionType] = modalEventConstants.RequestSuccess
			}, modalEventConstants.ModalContextSysUpsell)
		end, function()
			-- upvalues: default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy)
			default:logRobloxTelemetryEvent(pushUpsellEventConfig, {}, {
				[modalEventConstants.ActionType] = modalEventConstants.RequestFailed
			}, modalEventConstants.ModalContextSysUpsell)
		end)
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = "RequestPushNotificationPermission",
		message = "Invalid source",
		propName = "source"
	}, p2.appPage)
end