local Parent = script:FindFirstAncestor("PromptsServerDrivenUi").Parent
local RequestPushNotificationPermissionFunction = require(Parent.NotificationsUpsell).requestPushNotificationPermission
local Default = require(Parent.LoggingProtocol).default
local SduiErrorType = require(Parent.SduiCoreSystem).SduiErrors.SduiErrorType
local ModalEventConstants = require(Parent.NotificationsUpsell).ModalEventConstants
local PushUpsellEventConfig = require(Parent.NotificationsUpsell).PushUpsellEventConfig

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), Default (copy), PushUpsellEventConfig (copy), ModalEventConstants (copy), RequestPushNotificationPermissionFunction (copy)
	local Source = (p1 and p1.actionParams or {}).source
	
	if Source == nil or type(Source) == "string" then
		Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
			[ModalEventConstants.ActionType] = ModalEventConstants.Opened,
			[ModalEventConstants.EntryPoint] = Source or "SDUI"
		}, ModalEventConstants.ModalContextSysUpsell)
		RequestPushNotificationPermissionFunction():andThen(function()
			-- upvalues: Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval)
			Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
				[ModalEventConstants.ActionType] = ModalEventConstants.RequestSuccess
			}, ModalEventConstants.ModalContextSysUpsell)
		end, function()
			-- upvalues: Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval)
			Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
				[ModalEventConstants.ActionType] = ModalEventConstants.RequestFailed
			}, ModalEventConstants.ModalContextSysUpsell)
		end)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "RequestPushNotificationPermission",
			message = "Invalid source",
			propName = "source"
		}, p2.appPage)
	end
end